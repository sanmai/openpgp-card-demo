#!/bin/bash

git clone https://github.com/frankmorgner/vsmartcard.git
cd vsmartcard/virtualsmartcard
autoreconf -vis && ./configure && make install
cd

git clone https://github.com/martinpaljak/oracle_javacard_sdks.git;
export JC_HOME=$PWD/oracle_javacard_sdks/jc222_kit;
export JC_CLASSIC_HOME=$PWD/oracle_javacard_sdks/jc305u3_kit;

git clone https://github.com/arekinath/jcardsim.git;
cd jcardsim;
mvn initialize && mvn clean install
cd

git clone --recursive https://github.com/Yubico/ykneo-openpgp.git;
cd ykneo-openpgp;
ant -DJAVACARD_HOME=${JC_HOME};
cd

echo "com.licel.jcardsim.card.applet.0.AID=D2760001240102000000000000010000" > openpgp_jcardsim.cfg;
echo "com.licel.jcardsim.card.applet.0.Class=openpgpcard.OpenPGPApplet" >> openpgp_jcardsim.cfg;
echo "com.licel.jcardsim.card.ATR=3B80800101" >> openpgp_jcardsim.cfg;
echo "com.licel.jcardsim.vsmartcard.host=localhost" >> openpgp_jcardsim.cfg;
echo "com.licel.jcardsim.vsmartcard.port=35963" >> openpgp_jcardsim.cfg;
