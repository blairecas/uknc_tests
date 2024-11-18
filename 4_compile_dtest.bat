rt11 macro dtest.mac
rt11 link /nobitmap /stack:0 /top:50000 dtest
del dtest.obj
move/y dtest.sav dtest.dsk
start ..\..\ukncbtl\ukncbtl /autostart /disk0:..\uknc_tests\dtest.dsk /boot1
