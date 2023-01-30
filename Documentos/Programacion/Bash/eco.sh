#!/bin/sh

readonly BACKUP_DIRS=(/home/utane/Descargas /home/utane/Imagenes)

for dir in ${BACKUP_DIRS[@]}; do
    target=${dir/#\//}
    # equivalent sed expression would be
    # TARGET=$(echo $DIR | sed 's/^\///')
    target=${target//\//_}
    # equivalent sed expression would be
    # TARGET=$(echo $TARGET | sed 's/\//_/g')
    echo $target
done

# This part of the code is a loop that iterates over each directory specified in the BACKUP_DIRS array. For each iteration, it performs the following operations:
#
#     TARGET=${DIR/#\//}: This line uses parameter expansion to remove the leading "/" from the DIR variable, if pr esent.
#
#     TARGET=${TARGET//\//_}: This line uses parameter expansion to replace all "/" characters in the TARGET variable with "_".
#
#     rsync $RSYNC_DEFAULTS $DIR/ $RSYNC_PROFILE/$TARGET: This line uses rsync to transfer the contents of the current directory specified in DIR to
# the remote server specified in RSYNC_PROFILE with the target directory being the transformed version of the original directory path specified in
# TARGET. The $RSYNC_DEFAULTS options are passed to rsync to specify how the data should be transferred.
#
# So, the overall purpose of this loop is to transfer each of the directories specified in BACKUP_DIRS to
# the remote server, with each transferred directory having a transformed name based on the original directory path.

# In shell parameter expansion, the # symbol is used for pattern deletion.
# It removes the shortest match of the pattern on the left side of the expression.
# For example, ${var#pattern} would remove the pattern pattern from the beginning of the value of var.
