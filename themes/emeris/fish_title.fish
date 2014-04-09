function fish_title
  set -l short_hostname (hostname -s)
  set -l cwd (prompt_pwd)
  set -l user_hostname "$USER@$short_hostname:$cwd"
  echo $user_hostname
end