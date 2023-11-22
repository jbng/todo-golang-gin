package debug

import (
	"fmt"
	"os"
)

func ListDirEntries() {
	entries, err := os.ReadDir("./")
	if err != nil {
			fmt.Errorf("Error reading dir %w", err)
	}

	for _, e := range entries {
			fmt.Println(e.Name())
	}
}

func DirCurrent() {
	curr, err := os.Getwd()
	if err != nil {
		fmt.Errorf("Error getting current dir %w", err)
}
	fmt.Println("config current dir:", curr)
}