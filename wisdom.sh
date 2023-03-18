#!/bin/bash

# get the cowsay message
# do maths to get window size
# do maths to set window in corret positon? (yes, width const but height changes)

getNumRows() {

    num_row=$(echo "$1"| wc -l)
    num_row=$(( $num_row + 1 ))     # Adding 1 to account for the last 'read' row

    echo $num_row
}

getNumCol() {

    num_col=$(echo "$1" | head -1 | wc -m)

    echo $num_col
}

getRowShift() {

    row_size=$1
    total_row_size=550

    if (( $row_size >= $total_row_size ))
    then
        echo 0
    fi

    row_size=$(( row_size/2 ))
    total_row_size=$(( total_row_size/2 ))

    row_shift=$(( total_row_size-row_size ))
    row_shift=`python -c "print(round($row_shift))"`

    echo $row_shift
}

getColShift() {

    col_size=0
    total_col_size=1366

    echo 535
}

main() {

    message=$(cowsay $(fortune))

    num_row=$(getNumRows "$message")

    num_col=$(getNumCol "$message")

    row_shift=$(getRowShift $num_row)

    col_shift=$(getColShift $num_col)

    geometry=$num_col'x'$num_row'+'$col_shift'+'$row_shift

    st -g $geometry -i -e wisWrap.sh "$message"
}

main
