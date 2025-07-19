FRONT_END_BINARY=front-end

go_build:
	@echo "Building ${FRONT_END_BINARY} binary..."
	@GOOS=linux GOARCH=amd64 go build -o ./bin/web/${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

clean_build:
	@echo "Removing binaries..."
	@rm -f ./bin/web/${FRONT_END_BINARY}
	@echo "Done!"

go_run: go_build
	@echo "Running ${FRONT_END_BINARY} binary..."
	@./bin/web/${FRONT_END_BINARY} &
	@echo "Done!"

go_stop:
	@echo "Stopping ${FRONT_END_BINARY}..."
	@-pkill -SIGTERM -f "./bin/web/${FRONT_END_BINARY}"
	@echo "Stopped ${FRONT_END_BINARY}!"

