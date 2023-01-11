#!/bin/sh

file=$HOME/Documentos/tokengit.txt

# adds everything and makes a commit
adding() {
    git add .
    git commit -m "Update"
}

pushing() {
    cat $file | xargs -I '{}' echo -n {} | xclip -sel clip
    git push
}

ask() {
    choice=$(printf "Add\\nPush" | rofi -dmenu -i -p "Qué opción desea ejecutar?")
    case "$choice" in
        Add) adding;;
        Push) pushing;;
    esac
}

ask
