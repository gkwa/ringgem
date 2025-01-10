#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

max_attempts=3
attempts=0
until lxd init --auto || [ "$attempts" -ge "$max_attempts" ]; do
    ((attempts++))
    echo "lxd init failed, retrying..."
done

if [ $? -eq 0 ]; then
    echo "lxd init successful"
elif [ "$attempts" -eq "$max_attempts" ]; then
    echo "lxd init failed after $max_attempts attempts"
fi
