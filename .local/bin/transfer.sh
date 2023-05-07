#!/bin/sh
# fuck rtransfer, this is the true oneliner script
# that will actually transfer things right
# cat rlist.txt | xargs -I{} rsync --ignore-existing -Paz {} /run/media/utane/GAUCHOPODER/ && notify-send "Done"
rsync --ignore-existing -Paz /home/utane/Documentos/Cosas-japo /home/utane/Documentos/DocTrinity /home/utane/Documentos/duanland.neocities.org /home/utane/Documentos/Programacion /home/utane/Documentos/UTN /run/media/utane/GAUCHOPODER/Documentos;
rsync --ignore-existing -Paz /home/utane/Descargas/PruebaTraduccion-IVREA /run/media/utane/GAUCHOPODER/Descargas;
rsync --ignore-existing -Paz /home/utane/Imagenes/ /run/media/utane/GAUCHOPODER/Imagenes;
rsync --ignore-existing -Paz /home/utane/.local/share/vimwiki /run/media/utane/GAUCHOPODER
notify-send "Done"
