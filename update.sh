#!/bin/sh

set -e

PKG="petname"

for f in adverbs adjectives names; do
	rm -f "$f".txt.list
	for w in $(cat "$f".txt); do
		printf '"%s", ' "$w" >> "$f".txt.list
	done
	sed -i -e "s/, $//" "$f".txt.list
	sed -i -e "s/    $f = [/$(cat ${f}.list)/" ${PKG}/${PKG}.py
	rm -f "$f".txt.list
done
