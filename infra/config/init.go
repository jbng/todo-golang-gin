package config

import (
	"fmt"
	"os"

	"github.com/spf13/viper"

	"todo-golang-gin/infra/debug"
)

func Init() (*viper.Viper, error) {
	debug.DirCurrent()
	debug.ListDirEntries()
	config := viper.New()
	config.SetConfigType("env")
	config.AddConfigPath(".")

	config.SetConfigFile(".env")
	errReadEnvConfig := config.ReadInConfig()
	if errReadEnvConfig != nil { 
		return nil, fmt.Errorf("fatal error env config file: %w", errReadEnvConfig)
	}

	release := os.Getenv("RELEASE")
	if release == "prod" {
		config.SetConfigName(".env.prod")
	} else {
		config.SetConfigName(".env.dev")
	}

	errReadReleaseConfig := config.MergeInConfig()
	if errReadReleaseConfig != nil { 
		return nil, fmt.Errorf("fatal error release config file: %w", errReadReleaseConfig)
	}
	return config, nil
}
