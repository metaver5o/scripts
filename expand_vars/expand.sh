#!/bin/bash

# USAGE:
# cat FILE.tpl | expand.sh > FILE.xml

eval "cat <<EOF
$(cat)
EOF
" 2> /dev/null
