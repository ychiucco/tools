alias c='clear'
alias cl='clear'
alias cle='clear'
alias clea='clear'
alias ppython='poetry run python'
alias ppytest='poetry run pytest'
alias pcode='poetry run code --goto'
alias pfractal='poetry run fractal'
alias pfractalctl='poetry run fractalctl'
alias ggrep='git grep'

lscommit() {
  git diff-tree --no-commit-id --name-only $1 -r
}

committa() {
  git commit -a -m $1
}

cgrep() {
  for arg in "$@"; do
    length=${#arg}
    if ((length > max_length)); then
      max_length=$length
    fi
  done

  for arg in "$@"; do
    grep_results=($(git grep -l $arg))
    num_files=${#grep_results[@]}
    if [[ $num_files -gt 10 ]]; then
      printf "This is going to open %d files: do you want to continue? [yn]: " "$num_files"
      read -r prompt
      if [[ "$prompt" =~ ^[Yy]$ ]]; then
        for file in "${grep_results[@]}"; do
          printf "%-${max_length}s\t----->\t%s\n" "$arg" "$file"
          pcode $file
        done
      else
        continue
      fi
    else
      for file in "${grep_results[@]}"; do
        printf "%-${max_length}s\t----->\t%s\n" "$arg" "$file"
        pcode $file
      done
    fi
  done
}