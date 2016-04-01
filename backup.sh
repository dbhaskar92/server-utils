#!/bin/sh

#
# Author: Dhananjay Bhaskar
# Last Modified: 30 Aug, 2012
# Description: This script makes a backup (preserving mode, owner) of the file or directory specified
# in the argument. It does not backup directories under / (root), or large directories (for example /usr/lib64). 
# License: GPL_v3
#

if [ -n "$1" ]; then                            # check for null argument

  if [ -f $1 ]; then                            # check that the argument is a regular file
    filename=$1
    filetime=$(date +%Y-%m-%d__%H_%M)
    cp -p ${filename} ${filename}.${filetime}  # preserve mode, ownership, timestamps on copy
  
  elif [ -d $1 ]; then
    parent=`dirname $1`
    if [ "$parent" = "/" ]; then                # do not backup directories under / (root)
      echo "Warning: System root directory. Please backup manually."
    else
      size=`du -s $1 | awk '{print $1}'`        # get directory size in K
      if [ "$size" -gt "204800" ]; then         # if directory is bigger than 200 MB
        echo "Warning: Directory is too big - $size K. Please backup manually."
      else
        freespace=`df -k $1 | sed 1d | awk '{print $4}'`	# get free space available for backup
        if [ "$freespace" -gt "$size" ]; then
          dirname=$1
          dirtime=$(date +%Y-%m-%d__%H_%M)
          tar -cjf ${dirname}.tar.bz2.${dirtime} ${dirname} # create tarball
          # rsync -avz ${dirname}.tar.bz2.${dirtime} admin@server:~/Backups/
        else
          echo "Warning: Not enough space available for backup."
        fi
      fi
    fi

  else
    echo "Invalid arguement. Usage: $0  path_to_file_or_directory"
  fi

else
  echo "Invalid usage. Please provide a file or directory as arguement."
fi

exit
