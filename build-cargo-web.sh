#!/bin/sh

PROJECTDIR=${PROJECTDIR:?Requires environment variable PROJECTDIR. Directory containing project to be built (containing Cargo.toml), should be relative e.g. PROJECTDIR=examples/todomvc}
BUILDDIR=/usr/src/myapp

mkdir -p /out/js ${BUILDDIR}
cp -r /project/. ${BUILDDIR}/

cd ${BUILDDIR}/${PROJECTDIR}
cargo web build --release --target-webasm-emscripten

# Copy out artifacts
cp -r ${BUILDDIR}/${PROJECTDIR}/static/. /out/
cp ${BUILDDIR}/${PROJECTDIR}/target/wasm32-unknown-emscripten/release/*.js /out/js/app.js
cp ${BUILDDIR}/${PROJECTDIR}/target/wasm32-unknown-emscripten/release/*.wasm /out/
