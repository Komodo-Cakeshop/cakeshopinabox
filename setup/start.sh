#!/bin/bash
# This is the entry point for configuring the system.
#####################################################
INSTALL_DIR=`pwd`
#sudo apt-get update
#sudo apt-get -y install libgomp1 jq dialog
export NCURSES_NO_UTF8_ACS=1
source setup/functions.sh # load our functions
mkdir -p ~/bin

# Put a start script in a global location. We tell the user to run 'komodoinabox'
# in the first dialog prompt, so we should do this before that starts.
cat > ~/bin/komodoinabox << EOF;
#!/bin/bash
cd `pwd`
source setup/start.sh
EOF
chmod +x ~/bin/komodoinabox

source setup/console.sh 
echo
echo "-----------------------------------------------"
echo
echo Your komodo-in-a-box is running with these blockchains 1 per line
echo
ps aux | grep komodod | grep -v grep | awk -F " " '{$1=$2=$3=$4=$5=$6=$7=$8=$9=$10=""; print $0 }'
ps aux | grep hushd | grep -v grep | awk -F " " '{$1=$2=$3=$4=$5=$6=$7=$8=$9=$10=""; print $0 }'
