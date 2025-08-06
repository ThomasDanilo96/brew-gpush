#!/bin/bash
set -e

# --------------------------------------- #
#  gitsync – Push to multiple remotes/branches
# --------------------------------------- #

# ANSI Colors
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
RED="\033[1;31m"
RESET="\033[0m"

echo -e "\n${CYAN}Starting Git sync...${RESET}\n"

# --- Check if inside a Git repo ---
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo -e "${RED}Error: Not a Git repository.${RESET}"
  exit 1
fi

# --- Get available remotes ---
remotes=($(git remote))
if [ ${#remotes[@]} -eq 0 ]; then
  echo -e "${RED}No Git remotes found. Use 'git remote add' to configure one.${RESET}"
  exit 1
fi

# --- Select primary remote ---
if [ ${#remotes[@]} -eq 1 ]; then
  remote1="${remotes[0]}"
  echo -e "${GREEN}Selected remote:${RESET} $remote1"
else
  echo -e "${YELLOW}Available remotes:${RESET} ${remotes[*]}"
  echo -e "${CYAN}Choose the primary remote:${RESET}"
  select choice in "${remotes[@]}"; do
    if [[ -n "$choice" ]]; then
      remote1="$choice"
      break
    fi
  done
fi

# --- Optional: second remote ---
read -rp "Push to a second remote? (y/n): " use_second_remote
if [[ "$use_second_remote" == "y" ]]; then
  echo -e "${CYAN}Choose the second remote:${RESET}"
  select choice in "${remotes[@]}"; do
    if [[ -n "$choice" && "$choice" != "$remote1" ]]; then
      remote2="$choice"
      break
    fi
  done
fi

# --- Get current branch ---
branch1=$(git rev-parse --abbrev-ref HEAD)
echo -e "${MAGENTA}Current branch:${RESET} $branch1"

# --- Optional: second branch ---
read -rp "Push to a second branch? (y/n): " use_second_branch
if [[ "$use_second_branch" == "y" ]]; then
  branches=($(git branch --format='%(refname:short)'))
  echo -e "${CYAN}Choose the second branch:${RESET}"
  select choice in "${branches[@]}"; do
    if [[ -n "$choice" && "$choice" != "$branch1" ]]; then
      branch2="$choice"
      break
    fi
  done
fi

# --- Summary ---
echo -e "\n${CYAN}Push summary:${RESET}"
echo -e "- Remote:   ${GREEN}$remote1${RESET}"
echo -e "- Branch:   ${MAGENTA}$branch1${RESET}"
[[ "$remote2" ]] && echo -e "- Remote 2: ${GREEN}$remote2${RESET}"
[[ "$branch2" ]] && echo -e "- Branch 2: ${MAGENTA}$branch2${RESET}"
read -rp "Confirm and proceed? (y/n): " confirm
[[ "$confirm" != "y" ]] && echo -e "${RED}Operation cancelled.${RESET}" && exit 0

# --- Commit ---
read -rp "Commit message: " msg
git add .
git commit -am "$msg"

# --- Push function ---
try_push() {
  echo -e "\n${CYAN}Executing: git push $1 $2${RESET}"
  if git push "$1" "$2"; then
    return 0
  else
    return 1
  fi
}

# --- Push phase ---
success=0
errors=0

if try_push "$remote1" "$branch1"; then
  ((success++))
else
  ((errors++))
fi

if [[ "$branch2" ]]; then
  if try_push "$remote1" "$branch2"; then
    ((success++))
  else
    ((errors++))
  fi
fi

if [[ "$remote2" ]]; then
  if try_push "$remote2" "$branch1"; then
    ((success++))
  else
    ((errors++))
  fi

  if [[ "$branch2" ]]; then
    if try_push "$remote2" "$branch2"; then
      ((success++))
    else
      ((errors++))
    fi
  fi
fi

# --- Final result ---
if [[ $errors -eq 0 ]]; then
  echo -e "\n${GREEN}✔ All pushes completed successfully.${RESET}"
  osascript -e 'display notification "All Git pushes completed." with title "GitSync" sound name "Ping"'
else
  echo -e "\n${YELLOW}⚠ Completed with $errors error(s).${RESET}"
  osascript -e 'display notification "Some Git pushes failed." with title "GitSync" sound name "Submarine"'
fi
