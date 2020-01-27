#!/bin/sh

weston --backend=drm-backend.so --use-pixman --tty=51 --log=/root/weston.log --config=${XDG_RUNTIME_DIR}/weston.ini -i 0 &
