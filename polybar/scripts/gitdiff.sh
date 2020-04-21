#!/bin/bash
BRANCH=$(cd $1 ; git rev-parse --abbrev-ref HEAD)
RAWDIFF=$(cd $1 ; git diff --shortstat)
RAWDIFF="${RAWDIFF/files changed}"
RAWDIFF="${RAWDIFF/file changed}"
RAWDIFF="${RAWDIFF/ insertions}"
RAWDIFF="${RAWDIFF/ insertions}"
RAWDIFF="${RAWDIFF/ insertion}"
RAWDIFF="${RAWDIFF/ deletions}"
RAWDIFF="${RAWDIFF/ deletion}"
RAWDIFF="${RAWDIFF/(+)/ "%{F#00FF00}%{F-}  "}"
RAWDIFF="${RAWDIFF/(-)/ "%{F#F00C00}%{F-}  "}"
RAWDIFF="${RAWDIFF/,/"%{F#FFF}%{F-}  "}"
RAWDIFF="${RAWDIFF//,}"
echo "%{A1:~/.config/polybar/scripts/rofiGit.sh:}%{F#FFF}%{F-} ${BRANCH}%{A} ${RAWDIFF}"


