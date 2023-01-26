#!/bin/sh
fuente="/home/utane/.local/share/mincho.tex"

archivo=$1
destino=$2
salida=$3

pandoc $archivo -s -t $destino --pdf-engine=xelatex -H $fuente -o $salida
