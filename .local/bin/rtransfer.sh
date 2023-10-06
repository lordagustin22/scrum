#!/bin/sh

# this is a work in progress
readonly BACKUP_DIRS=($HOME/Documentos/duanland.neocities.org $HOME/Documentos/UTN $HOME/Documentos/Cosas-japo $HOME/Descargas/PruebaTraduccion-IVREA $HOME/Imagenes $XDG_DATA_HOME/vimwiki)
readonly RSYNC_DEFAULTS="-Pavz"
readonly NOMBRE="$(cat ~/Documentos/nombre-pen.txt)"
readonly DESTINO=/run/media/utane/$NOMBRE

    if [[ ! -d "$DESTINO/Descargas" || ! -d "$DESTINO/Documentos" || ! -d "$DESTINO/Imagenes" || ! -d "$DESTINO/Musica" || ! -d "$DESTINO/Escritorio" || ! -d "$DESTINO/Videos" ]]; then
        mkdir -p "$DESTINO/Descargas" "$DESTINO/Documentos" "$DESTINO/Imagenes" "$DESTINO/Musica" "$DESTINO/Escritorio"
    fi

backup_folders() {
    local DIR TARGET
    for DIR in "${BACKUP_DIRS[@]}"; do
        TARGET=${DIR/#\//}
        # TARGET=${TARGET//\//_}
        TARGET=${TARGET##*\/}
        TARGET=$TARGET-$(date +"%d-%m-%Y_%T")
        rsync $RSYNC_DEFAULTS $DIR/ $DESTINO/$TARGET
    done
    notify-send "Los directorios se terminaron de mandar a $DESTINO"
}

backup_files() {
    rsync $RSYNC_DEFAULTS --delete --exclude={'Series','Mega-Programacion'} "$XDG_DATA_HOME/vimwiki" "$HOME/Descargas" "$HOME/Documentos" "$HOME/Imagenes" --exclude={'Emulation','ISO','Images','Cosas-Windows'} "$HOME/Escritorio" "$DESTINO"
    notify-send "Los archivos se terminaron de mandar a $DESTINO"
}

main() {
    backup_files
}

main

# This is still in testing
# yet to be implemented
# backup_files() {
#     local DESCARGAS_TARGET="$DESTINO/Descargas"
#     local DOCUMENTOS_TARGET="$DESTINO/Documentos"
#     local NOW=$(date +%s)
#     local THREE_DAYS_AGO=$((NOW - (3 * 24 * 3600)))  # 3 days ago in seconds since epoch
#
#     # Backup files in Descargas directory
#     find "$HOME/Descargas" -maxdepth 1 -mindepth 1 -type f -print | while read file; do
#         local filename=$(basename "$file")
#         local dest="$DESCARGAS_TARGET/$filename"
#         local mtime=$(stat -c %Y "$dest" 2>/dev/null || echo 0)
#         if [[ $mtime -lt $THREE_DAYS_AGO ]]; then
#             rsync -vz "$file" "$DESCARGAS_TARGET"
#         else
#             rsync -vz --ignore-existing "$file" "$DESCARGAS_TARGET"
#         fi
#     done
#
#     # Backup files in Documentos directory
#     find "$HOME/Documentos" -maxdepth 1 -mindepth 1 -type f -print | while read file; do
#         local filename=$(basename "$file")
#         local dest="$DOCUMENTOS_TARGET/$filename"
#         local mtime=$(stat -c %Y "$dest" 2>/dev/null || echo 0)
#         if [[ $mtime -lt $THREE_DAYS_AGO ]]; then
#             rsync -vz "$file" "$DOCUMENTOS_TARGET"
#         else
#             rsync -vz --ignore-existing "$file" "$DOCUMENTOS_TARGET"
#         fi
#     done
#
#     notify-send "Los archivos se terminaron de mandar a $DESTINO"
# }

# This is here for demonstrative purposes only
# If we aren't transferring a DIRectory
# then just print out the file name
# if [ ! -d ${DIR##*/} ]; then
    # notify-send 'Transferencia de '${DIR##*/}' completa'
    # else
    # notify-send 'Transferencia en '${DIR##*/}' completa'
# fi
