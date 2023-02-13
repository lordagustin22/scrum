#!/bin/sh

# this is a work in progress
readonly BACKUP_DIRS=($HOME/Documentos/duanland.neocities.org $HOME/Documentos/UTN $HOME/Documentos/Cosas-japo $HOME/Descargas/PruebaTraduccion-IVREA $HOME/Imagenes $XDG_DATA_HOME/vimwiki)
readonly RSYNC_DEFAULTS="-Paz"
readonly DESTINO=/run/media/utane/GAUCHOPODER/

backup_folders() {
    local DIR TARGET
    for DIR in "${BACKUP_DIRS[@]}"; do
        TARGET=${DIR/#\//}
        # TARGET=${TARGET//\//_}
        TARGET=${TARGET##*\/}
        TARGET=$TARGET-$(date +"%d-%m-%Y_%T")
        rsync $RESYNC_DEFAULTS $DIR/ $DESTINO/$TARGET
    done
    notify-send "Los directorios se terminaron de mandar a $DESTINO"
}

backup_files() {
    find $HOME/Descargas -maxdepth 1 -mindepth 1 -type f -print -exec rsync -vz {} $DESTINO/Descargas \;
    find $HOME/Documentos -maxdepth 1 -mindepth 1 -type f -print -exec rsync -vz {} $DESTINO/Documentos \;
    notify-send "Los archivos se terminaron de mandar a $DESTINO"
}

main() {
    backup_folders
    backup_files
}

main

# This is here for demonstrative purposes only
# If we aren't transferring a DIRectory
# then just print out the file name
# if [ ! -d ${DIR##*/} ]; then
    # notify-send 'Transferencia de '${DIR##*/}' completa'
    # else
    # notify-send 'Transferencia en '${DIR##*/}' completa'
# fi
