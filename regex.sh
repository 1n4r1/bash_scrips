#!/bin/bash


# grep log file
grep -E "^20[0-9]{2}/[0-9]{2}/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} \[[0-9]{4}\] .*'Message'$"  /var/log/any.log
