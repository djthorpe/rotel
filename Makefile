# Go parameters
GOCMD=go
GOINSTALL=$(GOCMD) install
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
GOGEN=$(GOCMD) generate

# App parameters
GOPI=github.com/djthorpe/gopi
GOLDFLAGS += -X $(GOPI).GitTag=$(shell git describe --tags)
GOLDFLAGS += -X $(GOPI).GitBranch=$(shell git name-rev HEAD --name-only --always)
GOLDFLAGS += -X $(GOPI).GitHash=$(shell git rev-parse HEAD)
GOLDFLAGS += -X $(GOPI).GoBuildTime=$(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
GOFLAGS = -ldflags "-s -w $(GOLDFLAGS)" 

all: install

install: rotel-service rotel-client rotel-ctrl

protobuf:
	$(GOGEN) -x ./rpc/...

rotel-ctrl:
	$(GOINSTALL) $(GOFLAGS) ./cmd/rotel-ctrl/...

rotel-service: protobuf
	$(GOINSTALL) $(GOFLAGS) ./cmd/rotel-service/...

rotel-client: protobuf
	$(GOINSTALL) $(GOFLAGS) ./cmd/rotel-client/...

clean: 
	$(GOCLEAN)