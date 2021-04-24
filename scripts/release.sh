#!/usr/bin/env bash


PLATFORM="linux"
ARCH="amd64"
VERSION="1.4-19.dev0"
RELEASE_NAME="mona_${VERSION}_${PLATFORM}-${ARCH}"
prefix="/usr/local"
includedir="${prefix}/include/"

OUTPUT_DIR="${RELEASE_NAME}"
OUTPUT_TAR="${RELEASE_NAME}.tar.gz"

./configure && make -j4

rm -rf "${OUTPUT_DIR}"
mkdir "${OUTPUT_DIR}"
cp README "${OUTPUT_DIR}"
cp COPYING  "${OUTPUT_DIR}"

mkdir ${OUTPUT_DIR}/bin
cp Front/.libs/mona ${OUTPUT_DIR}/bin

mkdir ${OUTPUT_DIR}/lib
cp -P GTA/.libs/libmonagta.a ${OUTPUT_DIR}/lib   
cp -P GTA/.libs/libmonagta.so ${OUTPUT_DIR}/lib   
cp -P GTA/.libs/libmonagta.so.1 ${OUTPUT_DIR}/lib   
cp -P GTA/.libs/libmonagta.so.1.0.4 ${OUTPUT_DIR}/lib   
cp -P DFA/.libs/libmonadfa.a ${OUTPUT_DIR}/lib   
cp -P DFA/.libs/libmonadfa.so ${OUTPUT_DIR}/lib   
cp -P DFA/.libs/libmonadfa.so.1 ${OUTPUT_DIR}/lib   
cp -P DFA/.libs/libmonadfa.so.1.0.4 ${OUTPUT_DIR}/lib   
cp -P BDD/.libs/libmonabdd.a ${OUTPUT_DIR}/lib   
cp -P BDD/.libs/libmonabdd.so ${OUTPUT_DIR}/lib   
cp -P BDD/.libs/libmonabdd.so.1 ${OUTPUT_DIR}/lib   
cp -P BDD/.libs/libmonabdd.so.1.0.4 ${OUTPUT_DIR}/lib   
cp -P Mem/.libs/libmonamem.a ${OUTPUT_DIR}/lib   
cp -P Mem/.libs/libmonamem.so ${OUTPUT_DIR}/lib   
cp -P Mem/.libs/libmonamem.so.1 ${OUTPUT_DIR}/lib   
cp -P Mem/.libs/libmonamem.so.1.0.4 ${OUTPUT_DIR}/lib   
for i in ${OUTPUT_DIR}/lib/*;
do
    strip $i;
done

mkdir ${OUTPUT_DIR}/include
mkdir ${OUTPUT_DIR}/include/mona
cp Mem/mem.h ${OUTPUT_DIR}/include/mona
cp Mem/gnuc.h ${OUTPUT_DIR}/include/mona
cp Mem/dlmalloc.h ${OUTPUT_DIR}/include/mona
cp BDD/bdd_external.h ${OUTPUT_DIR}/include/mona
cp BDD/bdd_dump.h ${OUTPUT_DIR}/include/mona
cp BDD/bdd_internal.h ${OUTPUT_DIR}/include/mona
cp BDD/bdd.h ${OUTPUT_DIR}/include/mona
cp BDD/hash.h ${OUTPUT_DIR}/include/mona
cp DFA/dfa.h ${OUTPUT_DIR}/include/mona
cp GTA/gta.h ${OUTPUT_DIR}/include/mona
cp config.h ${OUTPUT_DIR}/include/mona

tar -c "${OUTPUT_DIR}" -f "${OUTPUT_TAR}"
rm -r "${OUTPUT_DIR}"

echo "Output in ${OUTPUT_TAR}"

