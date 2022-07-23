#!/usr/bin/env zsh
###############################################################################
#
# Dominic Gomez
#
# Inspired by this article: https://www.atlassian.com/git/tutorials/dotfiles
#
###############################################################################

# don't overwrite any user files
DOTSDIR="${HOME}/.dots"
if [[ -d "${DOTSDIR}" ]]; then
    echo "${DOTSDIR}" already exists; exit 1;
fi
# don't redefine any user aliases
DOTSALIAS='dots'
if [[ ! -z `alias dots 2>/dev/null` ]]; then
    echo "${DOTSALIAS}" already exists; exit 1;
fi

git init --bare ${HOME}/.dots 1>/dev/null
dots="/usr/bin/git --git-dir=${DOTSDIR} --work-tree=${HOME}"
eval ${dots} config --local status.showUntrackedFiles no
