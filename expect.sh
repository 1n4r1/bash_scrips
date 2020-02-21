#!/bin/bash

### Get value from expect command

expect -c '
spawn bash
expect "$ "
send "grep \^root /etc/passwd\n"
expect -re "root:.*:0:0:.*:(.*):(.*)"
set roothome $expect_out(1,string)
send "echo $roothome\r"
expect "$ "
send "exit\n"
interact
'
