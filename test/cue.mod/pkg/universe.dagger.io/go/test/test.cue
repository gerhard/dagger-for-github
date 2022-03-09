package go

import (
	"dagger.io/dagger"
	"universe.dagger.io/go"
)

dagger.#Plan & {
	client: filesystem: "./data/hello": read: contents: dagger.#FS

	actions: tests: test: simple: go.#Test & {
		source:  client.filesystem."./data/hello".read.contents
		package: "./greeting"
	}
}