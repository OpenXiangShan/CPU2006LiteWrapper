INPUT=$(find . -maxdepth 1 -type f -name "cccp.i*" -printf "%f\n" | head -n 1)

$APP "$INPUT" -o cccp.s
