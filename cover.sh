# Runs all tests, generates coverage report and opens it in a browser
# To use this script you must have grocv and llvm-tools-preview installed.
# You must also use nightly version of rustc toolchain
#
# rustup default nightly
# cargo install grcov
# cargo install llvm-tools-preview

# Clean previous coverage data
rm -rf ./coverage

# Runs the tests generating coverage data
RUSTFLAGS="-Zinstrument-coverage" LLVM_PROFILE_FILE="./coverage/sproute-%p-%m.profraw" cargo test
# RUSTFLAGS="-Zinstrument-coverage" cargo test

# Generates the .html report in the ./target/debug/coverage folder
grcov . -s . --binary-path ./target/debug/ -t html --branch --ignore-not-existing -o ./target/debug/coverage/
# grcov . -s . --binary-path ./target/debug/ -t html --ignore-not-existing -o ./target/debug/coverage/

# Opens the file in default browser
xdg-open ./target/debug/coverage/index.html