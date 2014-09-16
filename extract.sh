#!/bin/bash

if ls game/Save*.rxdata &> /dev/null;
then
    echo 'Deleted save files.'
    rm game/Save*.rxdata
fi

rvpacker -a unpack -d ./game -t xp
echo 'Done extracting the project binaries into text files.'
