function git_prompt
  set -l branch (git branch 2> /dev/null | grep --color=never -e '*.\(.*\)' | colrm 1 2)

  set -l git_dirty (git status -s | colrm 3 | colrm 1 1 | grep --color=never -e '[MADRC]')
  set -l git_untracked (git status -s | colrm 3 | colrm 1 1 | grep --color=never -e '?')
  set -l git_stashed (git stash list | head -n 1)

  if test -n "$git_dirty"
    printf ' (%s%s' (set_color red) $branch
  else
    printf ' (%s%s' (set_color yellow) $branch
  end

  if test -n "$git_untracked"
    printf '%s*' (set_color purple)
  end

  if test -n "$git_stashed"
    printf '%s$' (set_color green)
  end

  set -l git_status_origin (git status -s -b | head -n 1)
  set -l ahead (echo $git_status_origin | grep --color=never -e '\[.*ahead.*\]')
  set -l behind (echo $git_status_origin | grep --color=never -e '\[.*behind.*\]')

  # if local repo is ahead, show up arrow
  if test -n "$ahead"
    printf '%s↑' (set_color cyan)
  end

  # if local repo is behind, show down arrow
  if test -n "$behind"
    printf '%s↓' (set_color magenta)
  end
  printf '%s)' (set_color normal)
end

function fish_prompt
  if not [ -z $VIRTUAL_ENV ]
    printf '%s(%s)%s ' (set_color -b cyan black) (basename "$VIRTUAL_ENV") (set_color normal)
  end
  printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)

  if test -d .git
    printf '%s' (git_prompt)
  end

  printf ' > '
  set_color normal
end
