#!/bin/bash
if xmodmap -pke | awk '$3=="=" && $4=="q" {q=$2}
                        $3=="=" && $4=="w" {w=$2}
                        END {exit w-q==1}'; then
    setxkbmap -variant ','
else
    setxkbmap -variant 'dvorak,'
fi
