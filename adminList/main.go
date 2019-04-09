package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"math/rand"
	"os"
	"path"
	"regexp"
	"strconv"
	"strings"
	"time"

	"github.com/spf13/pflag"
)

func printList(list []string) {
	for _, v := range list {
		fmt.Println(v)
	}
}

func getRandomDate() string {
	min := time.Date(1970, 1, 0, 0, 0, 0, 0, time.UTC).Unix()
	max := time.Date(2070, 1, 0, 0, 0, 0, 0, time.UTC).Unix()
	delta := max - min

	sec := rand.Int63n(delta) + min
	return time.Unix(sec, 0).Format("2006-01-02")
}

func getRandomNumber() int {
	rand.Seed(time.Now().Unix())
	return rand.Intn(999)
}

func isMatchByRegexp(s string, keyWords []string) bool {
	for _, v := range keyWords {
		isMatch, _ := regexp.MatchString(" "+v, s)
		if isMatch {
			return isMatch
		}
	}
	return false
}

func getSQLType(sql string) string {
	numberTypes := []string{"tinyint", "smallint", "mediumint", "int", "bigint", "float", "double", "real", "decimal"}
	stringTypes := []string{"char", "varchar", "tinytext", "text", "mediumtext", "longtext"}
	timeType := []string{"date", "time", "datetime", "timestamp", "year"}
	if isMatchByRegexp(sql, numberTypes) {
		return "number"
	} else if isMatchByRegexp(sql, stringTypes) {
		return "string"
	} else if isMatchByRegexp(sql, timeType) {
		return "time"
	} else {
		return "other"
	}
}

func indexOf(element string, data []string) int {
	for k, v := range data {
		if element == v {
			return k
		}
	}
	return -1
}

func camelCase(name string) string {
	nameList := strings.Split(name, "")
	for {
		i := indexOf(`_`, nameList)
		if i == -1 {
			break
		}
		nameList[i+1] = strings.ToUpper(nameList[i+1])
		nameList = append(nameList[:i], nameList[i+1:]...)
	}
	return strings.Join(nameList, "")
}

func handleString(sql string) {
	sql = strings.Trim(sql, " ")
	if sql == "" || sql == "\n" {
		return
	}
	keyReg := regexp.MustCompile("^`(.+)`")
	keyList := keyReg.FindStringSubmatch(sql)
	var key string
	if len(keyList) > 0 {
		key = camelCase(keyList[1])
	} else {
		return
	}

	titleReg := regexp.MustCompile(`COMMENT '(.+)'`)
	titleList := titleReg.FindStringSubmatch(sql)
	var title string
	if len(titleList) > 0 {
		title = titleList[1]
	}

	defaultValReg, _ := regexp.Compile("DEFAULT '(.+)' COMMENT")
	defaultValList := defaultValReg.FindStringSubmatch(sql)
	var defaultVal string
	if len(defaultValList) > 0 {
		defaultVal = defaultValList[1]
	}

	var val string
	valType := getSQLType(sql)
	if defaultVal != "" {
		val = defaultVal
	} else {
		switch valType {
		case "number":
			val = strconv.Itoa(getRandomNumber())
		case "string":
			val = `"` + title + strconv.Itoa(getRandomNumber()) + `"`
		case "time":
			val = `"` + getRandomDate() + `"`
		default:
			val = `""`
		}
	}

	var comment string
	if title != "" {
		comment = ` // ` + title
	}

	jsonLine := `"` + key + `"` + `: ` + val + `,` + comment
	json = append(json, jsonLine)

	var keyStr string
	if *hasKey == true {
		keyStr = `, key: '` + key + `'`
	}
	columns := `{ title: '` + title + `'` + `, ` + `dataIndex: '` + key + `'` + keyStr + ` },`
	antdColumns = append(antdColumns, columns)
}

func handleFile(sourceFileName string) {
	sourceFile, openErr := os.Open(sourceFileName)
	if openErr != nil {
		log.Fatal(openErr)
	}
	defer sourceFile.Close()

	r := bufio.NewReader(sourceFile)
	for {
		buf, readErr := r.ReadBytes('\n')

		str := string(buf)
		handleString(str)

		if readErr != nil {
			if readErr == io.EOF {
				if len(json) > 0 {
					json[len(json)-1] = strings.Replace(json[len(json)-1], ",", "", 1)
					fmt.Println(">>>JSON:")
					printList(json)
					fmt.Println("\n>>>columns:")
					printList(antdColumns)
				}
				break
			} else {
				log.Fatal(readErr)
			}
		}
	}
}

var json []string
var antdColumns []string
var hasKey *bool
var fileName *string

func init() {
	hasKey = pflag.BoolP("key", "k", false, "是否添加key，默认false")
	fileName = pflag.StringP("file", "f", "", "源文件，必填")
}

func main() {
	pflag.Parse()
	if *fileName == "" {
		log.Fatal("缺少源文件(e.g. -f fileName)")
	}
	handleFile(path.Base(*fileName))
}
