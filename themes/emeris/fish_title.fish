function fish_title
  set -l short_hostname (hostname -s)
  set -l cwd (prompt_pwd)
  set -l user_hostname "$USER@$short_hostname:$cwd"
  echo $user_hostname
end


set __fish_git_prompt_showdirtystate enabled
set __fish_git_prompt_show_informative_status enabled
set __fish_git_prompt_showstashstate enabled
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_showcolorhints enabled

