#!/bin/bash

# Some setup
pydir=../python
mdir=../mathematica
mu2e=mu2e_v2.py
export MU2E_MATH=$mdir
if [ -z "${MU2E_ELASTIC}" ]; then
	echo "Please set MU2E_ELASTIC to directory containing one body density matrices"
	echo "Obtain the directory from https://github.com/Berkeley-Electroweak-Physics/Elastic"
else
	if [ -d ${MU2E_ELASTIC} ]; then
		echo "Found Elastic one body density matrices from MU2E_ELASTIC env var"
	else
		echo "MU2E_ELASTIC set, but directory doesn't exist"
	fi
fi

# floating point regex.
regexp='[-+]?(([0-9]*[.]?[0-9]+([ed][-+]?[0-9]+)?)|(inf)|(nan))'
# Mathemtica number format - like 10.3*^7
mregexp='[-+]?(([0-9]*[.]?[0-9]+(\*.[-+]?[0-9]+)?))'

# first arg is pattern to find line
# second arg is the file to search
# output goes to stdout
getresult () {
	grep -i "$2" "$1" | grep -iEo "$regexp"
}
# version if number is in mathematica format
# like  10.3*^-3
# we convert to 10.3e-3
getmresult () {
	grep -i "$2" "$1" | grep -iEo "$mregexp" | sed s/\*^/e/
}

thresh=1.0e-5

# run one test case
runyaml () {
	echo "Running " $1
	prf=$(echo $1 | sed -e s/examples/results/  -e s/yaml/pyresults/)
	mrf=$(echo $1 | sed -e s/examples/results/  -e s/yaml/mresults/)
	mscript=$(echo $1 | sed -e s/yaml/wl/)
	time python3 $pydir/$mu2e -wl $1  >& $prf
	time MathKernel -script  "${mscript}" >& $mrf
	pdecayrate=$(getresult $prf "Decay rate =")
	mdecayrate=$(getmresult $mrf "Decay rate =")
	pbranch=$(getresult $prf   "Branching ratio relative to ordinary")
	mbranch=$(getmresult $mrf "Branching ratio relative to ordinary")
	echo pdecayrate=$pdecayrate mdecayrate=$mdecayrate
	echo pbranch=$pbranch mbranch=$mbranch
	ok=$(python3 -c "print(abs(($pdecayrate - $mdecayrate)/$mdecayrate)<${thresh})")
	if [ ${ok} != "True" ]; then
		echo $1 failed
		return 0
	fi
	ok=$(python3 -c "print(abs(($pbranch - $mbranch)/$mbranch)<${thresh})")
	if [ ${ok} != "True" ]; then
		echo $1 failed
		return 0
	fi
	echo $1 passed
}

mkdir -p results
runyaml examples/Ca40.yaml
runyaml examples/Fe56.yaml
runyaml examples/Ca40Rel.yaml
