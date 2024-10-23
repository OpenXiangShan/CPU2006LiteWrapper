INPUT=$(find . -maxdepth 1 -type f -name "integrate.i*" -printf "%f\n" | head -n 1)

$APP "$INPUT" -o integrate.s
