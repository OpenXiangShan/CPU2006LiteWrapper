INPUT=$(find . -maxdepth 1 -type f -name "cccp.i*" | sed 's|.*/||' | head -n 1)
${APP} "$INPUT" -o cccp.s
