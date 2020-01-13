#!/bin/bash
set -m

/etc/init.d/pcscd restart
cd
java -noverify -cp ykneo-openpgp/applet/bin:jcardsim/target/jcardsim-3.0.5-SNAPSHOT.jar com.licel.jcardsim.remote.VSmartCard openpgp_jcardsim.cfg &
sleep 5
opensc-tool --card-driver default --send-apdu 80b800002210D276000124010200000000000001000010D276000124010200000000000001000000
opensc-tool -n

fg
