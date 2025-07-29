FRONT_END_BINARY=front-end

go_build:
	@echo "Building ${FRONT_END_BINARY} binary..."
	@GOOS=linux GOARCH=amd64 go build -o ./bin/app/${FRONT_END_BINARY} ./cmd/app
	@echo "Done!"

clean_build:
	@echo "Removing binaries..."
	@rm -f ./bin/app/${FRONT_END_BINARY}
	@echo "Done!"

go_run: go_build
	@echo "Running ${FRONT_END_BINARY} binary..."
	@./bin/app/${FRONT_END_BINARY} &
	@echo "Done!"

go_stop:
	@echo "Stopping ${FRONT_END_BINARY}..."
	@-pkill -SIGTERM -f "./bin/app/${FRONT_END_BINARY}"
	@echo "Stopped ${FRONT_END_BINARY}!"

