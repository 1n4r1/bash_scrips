#!/bin/bash

### Auto SSH

PW="Password"
expect -c "
set timeout 5
spawn env LANG=C ssh root@server
expect \"password:\"
send \"${PW}\n\"
expect \"$\"
exit 0
"
