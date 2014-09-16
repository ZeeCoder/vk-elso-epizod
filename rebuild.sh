#!/bin/bash

# rm game/Save*.rxdata
rvpacker -a pack -d ./game -t xp
echo 'Done rebuilding the project into Data/ binaries.'
