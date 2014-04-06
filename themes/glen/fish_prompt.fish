# name: RobbyRussel
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  
  set -l black_on_white (set_color -b white black)

  set -l white_bg (set_color -b white)
  set -l black_bg (set_color -b black)

  set -l normal (set_color normal)
  set -l white (set_color -o white)
  set -l grey (set_color white)
  set -l magenta (set_color -o magenta)
  set -l purple (set_color -o purple)
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l short_hostname (hostname -s)

  set -l user_hostname "$blue$USER$normal$grey@$purple$short_hostname"
  set -l arrow "$normal$grey:"

#  set -l cwd $cyan(basename (prompt_pwd))
  set -l cwd $cyan(pwd)

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  set -l window ""
  if test -z $WINDOW
    set window ""
  else 
    set window "screen($WINDOW)" 
  end

  echo " "
  echo -s (date +%X) $window $git_info 
  echo -n -s $user_hostname $arrow $cwd ' ↪ '

end

