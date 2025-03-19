INPUT=$(find . -maxdepth 1 -type f -name "integrate.i*" | sed 's|.*/||' | head -n 1)
${APP} "$INPUT" -o integrate.s
