#!/usr/bin/env bash
# Claude Code statusLine — Rose Pine theme + context & rate limit bars

input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // "/"')
time=$(date +"%H:%M")
dir=$(basename "$cwd")
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_day_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_day_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Rose Pine colors
c_reset="\033[0m"
c_dim="\033[2m"
c_love="\033[38;2;235;111;146m"
c_gold="\033[38;2;246;193;119m"
c_rose="\033[38;2;235;188;186m"
c_pine="\033[38;2;49;116;143m"
c_foam="\033[38;2;156;207;216m"
c_iris="\033[38;2;196;167;231m"
c_subtle="\033[38;2;144;140;170m"
c_muted="\033[38;2;110;106;134m"

# Build a 10-segment bar: ●●●○○○○○○○
make_bar() {
  local pct_int=$1
  local filled=$((pct_int / 10))
  local empty=$((10 - filled))
  local bar=""
  for i in $(seq 1 $filled); do bar="${bar}●"; done
  for i in $(seq 1 $empty); do bar="${bar}○"; done
  echo "$bar"
}

# Pick color based on usage
bar_color() {
  local pct=$1
  if [ "$pct" -lt 50 ]; then echo "$c_foam"
  elif [ "$pct" -lt 80 ]; then echo "$c_gold"
  else echo "$c_love"
  fi
}

# Format reset time (epoch seconds) to human-readable
fmt_reset() {
  local ts="$1"
  [ -z "$ts" ] && return
  local today=$(date +"%Y-%m-%d")
  local reset_day=$(date -r "$ts" "+%Y-%m-%d" 2>/dev/null)
  if [ "$reset_day" = "$today" ]; then
    date -r "$ts" "+%-I:%M%p" 2>/dev/null | tr '[:upper:]' '[:lower:]'
  else
    date -r "$ts" "+%b %-d, %-I:%M%p" 2>/dev/null | tr '[:upper:]' '[:lower:]'
  fi
}

# ── Line 1: original Rose Pine (unchanged) ──
printf "${c_dim}╭─${c_reset} ${c_gold}󰥔 ${time}${c_reset} ${c_dim}┊${c_reset} ${c_iris}󰧑 ${model}${c_reset} ${c_dim}┊${c_reset} ${c_foam}󰀄 $(whoami)${c_reset}${c_muted}@${c_reset}${c_pine}󰒋 $(hostname -s)${c_reset} ${c_dim}┊${c_reset} ${c_rose}󰉋 ${dir}${c_reset}"

if [ -d "$cwd/.git" ]; then
  cd "$cwd" 2>/dev/null
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --always 2>/dev/null)
  if [ -n "$branch" ]; then
    git_status=$(git status --porcelain 2>/dev/null)
    modified=$(echo "$git_status" | grep -cE "^ [MD]" 2>/dev/null); modified=${modified:-0}
    staged=$(echo "$git_status" | grep -cE "^[MADRC]" 2>/dev/null); staged=${staged:-0}
    untracked=$(echo "$git_status" | grep -c "^??" 2>/dev/null); untracked=${untracked:-0}
    printf " ${c_dim}┊${c_reset} ${c_muted}󰊢${c_reset} ${c_iris} ${branch}${c_reset}"
    [ "$modified" -gt 0 ] && printf " ${c_love}●${modified}${c_reset}"
    [ "$staged" -gt 0 ] && printf " ${c_foam}✓${staged}${c_reset}"
    [ "$untracked" -gt 0 ] && printf " ${c_gold}?${untracked}${c_reset}"
    [ "$modified$staged$untracked" = "000" ] && printf " ${c_foam}✨${c_reset}"
  fi
fi

# ── Line 2: usage bars (all on one line) ──
has_any=false
printf "\n${c_dim}╰─${c_reset}"

# Context window
if [ -n "$used" ]; then
  has_any=true
  u_int=$(printf "%.0f" "$used")
  color=$(bar_color "$u_int")
  bar=$(make_bar "$u_int")
  printf " ${c_subtle}ctx${c_reset} ${color}${bar} %d%%${c_reset}" "$u_int"
fi

# 5-hour rate limit
if [ -n "$five_hour_pct" ]; then
  [ "$has_any" = true ] && printf " ${c_dim}┊${c_reset}"
  has_any=true
  f_int=$(printf "%.0f" "$five_hour_pct")
  color=$(bar_color "$f_int")
  bar=$(make_bar "$f_int")
  reset_str=$(fmt_reset "$five_hour_reset")
  printf " ${c_subtle}5h${c_reset} ${color}${bar} %d%%${c_reset}" "$f_int"
  [ -n "$reset_str" ] && printf " ${c_muted}↻${reset_str}${c_reset}"
fi

# 7-day rate limit
if [ -n "$seven_day_pct" ]; then
  [ "$has_any" = true ] && printf " ${c_dim}┊${c_reset}"
  has_any=true
  s_int=$(printf "%.0f" "$seven_day_pct")
  color=$(bar_color "$s_int")
  bar=$(make_bar "$s_int")
  reset_str=$(fmt_reset "$seven_day_reset")
  printf " ${c_subtle}7d${c_reset} ${color}${bar} %d%%${c_reset}" "$s_int"
  [ -n "$reset_str" ] && printf " ${c_muted}↻${reset_str}${c_reset}"
fi

# Fallback if no usage data yet
if [ "$has_any" = false ]; then
  printf " ${c_subtle}Ready for development${c_reset}"
fi

printf "\n"
