# name: RobbyRussel
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null)
end

function fish_prompt
  # Save our status
  set -l last_status $status

  set -l last_status_string ""
  if [ $last_status -ne 0 ]
    set last_status_string (printf " %s(%d)%s " (set_color red --bold) $last_status (set_color normal))
  end

  set -l black_on_white (set_color -b white black)

  set -l white_bg (set_color -b white)
  set -l black_bg (set_color -b black)

  set -l normal (set_color normal)
  set -l white (set_color -o white)
  set -l grey (set_color white)
  set -l magenta (set_color -o magenta)
  set -l purple (set_color -o purple)
  set -l cyan (set_color -o cyan)
  set -l green (set_color green)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)


  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_user_hostname
    set -l short_hostname (hostname -s)
    set __fish_prompt_user_hostname "$blue$USER$normal$grey@$purple$short_hostname"
  end

  set -l arrow "$normal$grey:"

#  set -l cwd $cyan(basename (prompt_pwd))
  set -l cwd $cyan(pwd)

  if [ (_git_branch_name) ]
    # sed is removing leading spaces
    set git_info {" "}{$blue}git(__fish_git_prompt | sed -e 's/^[ \t]*//')  

  end

  set -l window ""
  if test -z $WINDOW
    set window ""
  else 
    set window "$green screen($white$WINDOW$normal$green)" 
  end

  echo " "
  echo -s (date +%X) $window $git_info $last_status_string
  echo -n -s $__fish_prompt_user_hostname $arrow $cwd $white ' ↪ '

end
