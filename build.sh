#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

for f in pluginrc.zsh p10k.zsh fzf.zsh
do
    cp $CDIR/$f $build_dir/
done

fzf_url='https://github.com/junegunn/fzf/releases/download/0.41.1/fzf-0.41.1-linux_amd64.tar.gz'
tarname=`basename $fzf_url`

cd $build_dir

[ $QUIET ] && arg_q='-q' || arg_q=''
[ $QUIET ] && arg_s='-s' || arg_s=''
[ $QUIET ] && arg_progress='' || arg_progress='--show-progress'

if [ -x "$(command -v wget)" ]; then
  wget $arg_q $arg_progress $fzf_url -O $tarname
elif [ -x "$(command -v curl)" ]; then
  curl $arg_s -L $fzf_url -o $tarname
else
  echo Install wget or curl
fi

tar -xzf $tarname
mkdir bin
mv fzf bin/
rm $tarname
