#!/bin/sh

# this is a work in progress
readonly BACKUP_DIRS=($HOME/Documentos/duanland.neocities.org $HOME/Documentos/UTN $HOME/Documentos/Cosas-japo $HOME/Descargas/PruebaTraduccion-IVREA $HOME/Imagenes $XDG_DATA_HOME/vimwiki)
readonly RSYNC_DEFAULTS="-Pavz"
readonly NOMBRE="$1"
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
    # rsync $RSYNC_DEFAULTS --delete --exclude={'Series','Mega-Programacion','node_modules','.angular','.vscode','.git'} "$XDG_DATA_HOME/vimwiki" "$HOME/Descargas" "$HOME/Documentos" "$HOME/Imagenes" --exclude={'Emulation','ISO','Images','Cosas-Windows'} "$HOME/Escritorio" "$DESTINO"
    rsync $RSYNC_DEFAULTS --delete --exclude-from='/home/utane/Documentos/excluir.txt' --include-from='/home/utane/Documentos/incluir.txt' "$XDG_DATA_HOME/vimwiki" "$HOME/Descargas" "$HOME/Monero" "$HOME/Documentos" "$HOME/Imagenes" "$HOME/Escritorio" "$DESTINO"
    notify-send "Los archivos se terminaron de mandar a $DESTINO"
}

backup_files
