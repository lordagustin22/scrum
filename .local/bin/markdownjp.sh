#!/bin/sh
# fuente="/home/utane/.local/share/mincho.tex"
fuente="/home/utane/.local/share/NotoSansCJK.ttc"

archivo=$1
destino=$2
salida=$3

pandoc $archivo -s -t $destino --pdf-engine=xelatex -H $fuente -o $salida
