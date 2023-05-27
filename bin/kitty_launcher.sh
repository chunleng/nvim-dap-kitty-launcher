#!/usr/bin/env sh

launchid=nvim-${1}
cwd=$2
shift;shift

if [ "$(kitty @ ls | grep -c "\"title\": \"${launchid}\"")" -eq 0 ];
then
  kitty @ --to "$KITTY_LISTEN_ON" launch --keep-focus --title "${launchid}" "$SHELL"
fi

kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"${launchid}" "cd $cwd\x0d"


# Currently only support python
python=$1
debugger=$2
pid="$3"
flag_break=$4
shift;shift;shift;shift

if [[ "$*" == -* ]]; then
  # code or module
  flag=$1
  shift
  others=$(echo "$*"|sed 's/"/\\\\"/g')
  kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"${launchid}" "$python $debugger $pid $flag_break $flag \"$others\"\x0d"
else
  kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"${launchid}" "$python $debugger $pid $flag_break $*\x0d"
fi
