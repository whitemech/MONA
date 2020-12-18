#!/usr/bin/env bash

./configure && make && sudo make install-strip

rm -rf release
mkdir release
cp README release/
cp COPYING release/

mkdir release/bin
cp Front/mona release/bin

mkdir release/lib
cp -P GTA/.libs/libmonagta.a release/lib   
cp -P GTA/.libs/libmonagta.so release/lib   
cp -P GTA/.libs/libmonagta.so.1 release/lib   
cp -P GTA/.libs/libmonagta.so.1.0.4 release/lib   
cp -P DFA/.libs/libmonadfa.a release/lib   
cp -P DFA/.libs/libmonadfa.so release/lib   
cp -P DFA/.libs/libmonadfa.so.1 release/lib   
cp -P DFA/.libs/libmonadfa.so.1.0.4 release/lib   
cp -P BDD/.libs/libmonabdd.a release/lib   
cp -P BDD/.libs/libmonabdd.so release/lib   
cp -P BDD/.libs/libmonabdd.so.1 release/lib   
cp -P BDD/.libs/libmonabdd.so.1.0.4 release/lib   
cp -P Mem/.libs/libmonamem.a release/lib   
cp -P Mem/.libs/libmonamem.so release/lib   
cp -P Mem/.libs/libmonamem.so.1 release/lib   
cp -P Mem/.libs/libmonamem.so.1.0.4 release/lib   
for i in release/lib/*;
do
    strip $i;
done

mkdir release/include
mkdir release/include/mona
cp Mem/mem.h release/include/mona
cp Mem/gnuc.h release/include/mona
cp Mem/dlmalloc.h release/include/mona
cp BDD/bdd_external.h release/include/mona
cp BDD/bdd_dump.h release/include/mona
cp BDD/bdd_internal.h release/include/mona
cp BDD/bdd.h release/include/mona
cp BDD/hash.h release/include/mona
cp DFA/dfa.h release/include/mona
cp GTA/gta.h release/include/mona
cp config.h release/include/mona
