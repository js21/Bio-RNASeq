#!/bin/bash

set -x
set -e

start_dir=$(pwd)

SELF_LIB=${start_dir}'/lib'
SELF_BIN=${start_dir}'/bin'
TEST_LIB=${start_dir}'/t/lib'

export PERL5LIB=${SELF_LIB}:${TEST_LIB}:$PERL5LIB
export PATH=${SELF_BIN}:$PATH
export SAMTOOLS=/usr/include/samtools/

cpanm Dist::Zilla
dzil authordeps --missing | cpanm
cpanm Bio::Tools::GFF Net::FTP::Robust Test::Output Parallel::ForkManager Text::CSV Inline Filesys::DfPortable Filesys::DiskUsage File::Rsync Time::Format IO::Capture::Stderr Inline::C Inline::Filters

set +eu
set +x
