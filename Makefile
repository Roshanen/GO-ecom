build:
	@go build -o bin/GO-ecom cmd/main.go

test:
	@go test -v ./...

run: build
	@./bin/GO-ecom

migration:
	@migration create -ext sql -dir cmd/migrate/migrations $(filter-out $@,$(MAKECMDGOALS))

migration-up:
	@go run cmd/migrate/main.go up

migration-down:
	@go run cmd/migrate/main.go down