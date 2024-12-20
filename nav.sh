# |---------------------------|
# |        Nav Command        |
# |---------------------------|
# aliases for changing directories

#   change this to save the navigators in a different location
# --------------------------------------------------------------
local path_to_navigators="$HOME/.navigators/" # <= must end in "/"
# --------------------------------------------------------------


nav(){

  if [[ ! -d "$path_to_navigators" ]]; then
    mkdir -p "$path_to_navigators"
  fi

  local list_navigations(){
    # if navigators exist
    if [ -n "$(find $path_to_navigators -type f -mindepth 1 -maxdepth 1 2>/dev/null)" ]; then
      echo "[nav]:"
      echo "------------"
      max_length=$(ls -1 "$path_to_navigators"* | xargs -n 1 basename | awk '{ if (length > max) max = length } END { print max }')
      ls -1 "$path_to_navigators"* | while read -r navigator; do
        printf "↣ %-*s ⊣ %s\n" "$max_length" "$(basename "$navigator")" "$(sed 's/^cd "//; s/"$//' "$navigator")"
      done
      echo
    else
      echo "[nav] No navigators found."
      echo "----- Create a new navigator with 'nav --save [name]'"
    fi
  }

  #   default values
  # ------------------
  local new_navigation_path=$(PWD)
  local delete=false
  local save=false
  local navigator=""

  if [[ "$#" -eq 0 ]]; then
    list_navigations
    return 0
  fi

  while [[ "$#" -gt 0 ]]; do
    case $1 in

    -d | --delete )
      delete=true
      ;;

    -s | --save )
      save=true
      ;;

    -r | --rename )
      local old_navigator=$2
      local new_name=$3
      if [ ! -f $path_to_navigators$old_navigator ]; then
        echo "[nav] '$old_navigator' Does not exist!"
        return 1
      else
        # old_navigator does exist
        if [ -f $path_to_navigators$new_name ]; then
          echo "[nav] '$new_name' already exists."
          echo "----- Remove it with 'nav --delete $new_name'"
          return 1
        else
          mv $path_to_navigators$old_navigator $path_to_navigators$new_name && \
          echo "[nav] '$old_navigator' renamed to '$new_name'"
          return 0
        fi
      fi
      return 0
      ;;

    -p | --path )
      local provided_path=$2:P
      if [[ ! -d $provided_path ]]; then
        echo "[nav] '$2' Does not exist!"
        return
      else
        new_navigation_path=$provided_path
        shift
      fi
      ;;

    -h | --help )
      echo "[nav]"
      echo "-----| Usage: nav [options][filepath][name]"
      echo "-----| *no options*  ⊣ Use [name]"
      echo "-----| -s|--save     ⊣ Save [name]"
      echo "-----| -r|--rename   ⊣ Rename [name]"
      echo "-----| -d|--delete   ⊣ Delete [name]"
      echo "-----| -p|--path     ⊣ Provide a [filepath] for [name] when saving"
      echo
      return 0
      ;;

    *)
      if [[ "$navigator" == "" ]]; then
        navigator="$1"
      fi
      ;;

    esac
    shift
  done

  if [[ "$navigator" != "" ]]; then

      # if the file exists
    if [ -f $path_to_navigators$navigator ]; then

      if [[ "$save" == true ]]; then
        echo "[nav] '$navigator' already exists."
        echo "----- Remove it with 'nav --delete $navigator'"

      elif [[ "$delete" == true ]]; then
        # delete the navigator
        rm $path_to_navigators$navigator
        echo "[nav] '$navigator' deleted."

      else

        #   use the file to do the thing!
        # ---------------------------------
        source "$path_to_navigators$navigator"
        # ---------------------------------

      fi
    else # the file does not exist

      if [[ "$save" == true ]]; then
        # save the new navigator
        echo "cd \"$new_navigation_path\"" > "$path_to_navigators$navigator"

      else
        echo "[nav] '$navigator' does not exist."
        list_navigations
        return 0
      fi
    fi

  else
    # no navigator was provided
  fi
}


#   autocomplete navigations
# ----------------------------
_nav_autocomplete() {

  local -a args=("${(@)words[2,-1]}")
  local current_arg=${words[$CURRENT]}
  local -a current_arg_array=($current_arg)
  local -a other_args=(${args:|current_arg_array})

  if [[ "${words[$CURRENT-1]}" == "-p" || "${words[$CURRENT-1]}" == "--path" ]]; then
    #   Filepath
    # ------------
    _directories

  elif [[ "$current_arg" == -* ]]; then
    #   Flag
    # --------

    local -a all_options=(-s --save -d --delete -p --path -h --help)
    # if any args start with "-"
    if [[ ${(M)other_args:#-*} ]]; then
      # that arg is a flag
      if [[ " ${other_args[@]} " == *" -s "* || " ${other_args[@]} " == *" --save "* ]]; then
        # if the flag is [--save]
        if [[ " ${other_args[@]} " == *" -p "* || " ${other_args[@]} " == *" --path "* ]]; then
          # [--path] option was already passed
          return 0
        else
          _values 'options' '-p' '--path'
        fi
      else
        return 0
      fi
    else
      _values 'options' "${all_options[@]}"
    fi

  else
    #   Navigator
    # -------------
    if [[
      " ${other_args[@]} " == *" -s "* ||
      " ${other_args[@]} " == *" --save "* ||
      " ${other_args[@]} " == *" -p "* ||
      " ${other_args[@]} " == *" --path "* ||
      "${words[$CURRENT-2]}" == "-r" ||
      "${words[$CURRENT-2]}" == "--rename"
    ]]; then
      # providing a name for new navigator
      return 0
    else
      # looking for an existing navigator
      if [ -n "$(find $path_to_navigators -type f -mindepth 1 -maxdepth 1 2>/dev/null)" ]; then
        _values 'navigators' $(ls -1 "$path_to_navigators" 2>/dev/null | xargs -n 1 basename)
      fi
    fi
  fi
}

compdef _nav_autocomplete nav
