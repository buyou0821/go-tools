package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"
	"path"
	"regexp"
	"strings"

	"github.com/spf13/pflag"
)

func handleFile(sourceFileName string) {
	sourceFile, openErr := os.Open(sourceFileName)
	if openErr != nil {
		log.Fatal(openErr)
	}
	defer sourceFile.Close()

	targetFile, createErr := os.Create(sourceFileName + "_columns.js")
	if createErr != nil {
		log.Fatal(createErr)
	}
	defer targetFile.Close()

	r := bufio.NewReader(sourceFile)
	fmt.Println(">>>start" + "\n")
	for {
		buf, readErr := r.ReadBytes('\n')
		str := string(buf)
		str = strings.Replace(str, "\n", "", -1)
		str = handleStr(str)
		if str != "" {
			// 写入
			fmt.Printf("%s\n", str)

			_, writeErr := targetFile.WriteString(str + "\n")
			if writeErr != nil {
				log.Fatal(writeErr)
			}
		}
		if readErr != nil {
			if readErr == io.EOF {
				fmt.Println("\n>>>success")
				break
			} else {
				log.Fatal(readErr)
			}
		}
	}
}

func handleStr(lineStr string) string {
	str := strings.Trim(lineStr, " ")
	if str == "" {
		return str
	}
	isParantheses := strings.ContainsAny(str, "{&}")
	if isParantheses {
		return ""
	}
	ketReg := regexp.MustCompile(`"(.+?)"`)
	key := ketReg.FindStringSubmatch(str)[1]
	titleReg := regexp.MustCompile(`//\s*(.+)`)
	title := titleReg.FindStringSubmatch(str)[1]
	keyStr := ""
	if *hasKey == true {
		keyStr = `, key: '` + key + `'`
	}
	return `{ title: '` + title + `'` + `, ` + `dataIndex: '` + key + `'` + keyStr + ` },`
}

var hasKey *bool
var fileName *string

func init() {
	hasKey = pflag.BoolP("key", "k", false, "是否添加key，默认false")
	fileName = pflag.StringP("file", "f", "", "源文件，必填")
}

func main() {
	pflag.Parse()
	if *fileName == "" {
		log.Fatal("缺少源文件")
	}
	handleFile(path.Base(*fileName))
}
