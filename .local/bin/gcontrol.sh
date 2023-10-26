#!/bin/sh

file=$HOME/Documentos/tokengit.txt

# adds everything and makes a commit
adding() {
    git add .
    read -p "Mensaje para el commit: " commit_message
    read -p "Archivo para el commit: " commit_file
    git commit -m "$commit_message" $commit_file
}

addMsg() {
    git add .
    read -p "Archivo para el commit: " commit_file
    git commit -C $commit_file
}

updating() {
  git add .
  # read -p "Archivo para el commit: " commit_file
  git commit --amend --no-edit
}

pushing() {
    cat $file | xargs -I '{}' echo -n {} | xclip -sel clip
    git push
    echo "" | xclip -sel clip # empties xclip for safety
}

ask() {
    choice=$(printf "Add\\nAddCommitC\\nUpdate\\nPush" | dmenu -i -p "Qué opción desea ejecutar?")
    case "$choice" in
        Add) adding ;;
        AddCommitC) addMsg ;;
        Update) updating ;;
        Push) pushing ;;
    esac
}

ask
