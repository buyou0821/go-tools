package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strings"
)

var print = fmt.Println

// Scanf 获取整行输入，fmt.scanf获取时以空格分割
func Scanf(str *string) {
	reader := bufio.NewReader(os.Stdin)
	data, _, _ := reader.ReadLine()
	*str = string(data)
}

func main() {
	var dirName, deletePrefix string
	fmt.Print("请输入目录的绝对路径：")
	Scanf(&dirName)
	dirName = strings.TrimRight(dirName, " ")
	fmt.Print("请输入要删除的前缀：")
	Scanf(&deletePrefix)

	if dirName[len(dirName)-1:] != "/" {
		dirName = dirName + "/"
	}

	file, err := os.Open(dirName)
	if err != nil {
		print(err)
	}
	fileNames, _ := file.Readdirnames(0)
	for _, item := range fileNames {
		reg := regexp.MustCompile(deletePrefix)
		newName := dirName + reg.ReplaceAllString(item, "")
		err := os.Rename(dirName+item, newName)
		if err != nil {
			print(err)
		}
	}
}
