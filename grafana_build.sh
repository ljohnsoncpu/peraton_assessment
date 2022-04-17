git clone https://github.com/ljohnsoncpu/peraton_assessment.git
cd peraton_assessment

# Build frontend.

yarn install --immutable
yarn start

# Build backend.
make run 

# Create Windows .exe file.
go install github.com/google/wire/cmd/wire@latest
$GOPATH/bin/wire.exe gen -tags oss ./pkg/server ./pkg/cmd/grafana-cli/runner
go run build.go build 

# Generate documentation.
cd docs make run cd .. 

# Make the app mode production in custom.ini inside conf.
cd conf echo "app_mode = production" >> custom.ini
