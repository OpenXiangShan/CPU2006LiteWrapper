#!/bin/bash

# Create a directory to store the build results
mkdir -p cpu2006_build

# Loop over the build directories found by the find command
find . -name "build" | while read build_dir; do
    # Extract benchmark name using string manipulation (removing the initial number and dot)
    benchmark_name=$(basename $(dirname "$build_dir") | sed 's/^[0-9]*\.//')
    
    # Construct the desired name for the target file
    new_name="${benchmark_name}_base.riscv64-linux-gnu-gcc-9.4.0-rv64gc"
    
    # Identify the target file. We're assuming it's the only non-directory item directly under the build directory.
    target_file=$(find "$build_dir" -maxdepth 1 -type f)
    
    # If target_file isn't empty, copy it to the cpu2006_build directory with the new name
    if [ -n "$target_file" ]; then
        echo copying $target_file to cpu2006_build/$new_name
        cp "$target_file" "cpu2006_build/$new_name"
    fi
done


