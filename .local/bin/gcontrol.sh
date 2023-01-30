#!/bin/sh

file=$HOME/Documentos/tokengit.txt

# adds everything and makes a commit
adding() {
    git add .
    read -p "Enter a commit message: " commit_message
    read -p "Enter the file you want to commit: " commit_file
    git commit -m "$commit_message" $commit_file
}

pushing() {
    cat $file | xargs -I '{}' echo -n {} | xclip -sel clip
    git push
    echo "" | xclip -sel clip #emtpies xclip for safety
}

ask() {
    choice=$(printf "Add\\nPush" | dmenu -i -p "Qué opción desea ejecutar?")
    case "$choice" in
        Add) adding;;
        Push) pushing;;
    esac
}

ask
