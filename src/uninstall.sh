#! /bin/bash

INSTALL_DIR="/usr/bin"
UTILITY_NAME=""

UTILITY_NAME_FILE="./util.txt"
 STATUS_STR="[ status    ]"
SUCCESS_STR="[ success   ]"
FAILURE_STR="[ failure   ]"
  ERROR_STR="[ error     ]"

get_installation_directory(){
    echo "$STATUS_STR Identifying Host System"
    linux_system=`uname -srm | grep -i "linux"`
    mac_system=`uname -srm | grep -i "darwin"`

    if [ ! -z "$linux_system" ]; then
        echo "$STATUS_STR LinuxOS System "
        INSTALL_DIR="/usr/bin"
    fi

    if [ ! -z "$mac_system" ]; then
        echo "$STATUS_STR MacOS System"
        INSTALL_DIR="/opt/local/bin"
    fi
}

uninstall_package(){
    rm $INSTALL_DIR/$UTILITY_NAME &> /dev/null
}

check_uninstall_status(){
    if [ $1 -eq 0 ]; then
        echo "$SUCCESS_STR Utility ( $UTILITY_NAME ) uninstall successful"
    else
        echo "$FAILURE_STR Utility ( $UTILITY_NAME ) uninstall failed"
	echo "$FAILURE_STR You should have sudo or root access to uninstall this package"
    fi
}

usage(){
   echo ""
   echo "-----------------------------------------------------------"
   echo ""
   echo "Usage:"
   echo ""
   echo "	./installer.sh <utility_name>"
   echo ""
   echo "-----------------------------------------------------------"
   echo ""
}

is_file_exist(){
    if [ ! -f $1 ]; then
	echo
	echo "$ERROR_STR package file '$1' not installed at default dir"
	echo "$ERROR_STR Uninstall failed!"
    	exit 1
    fi
}

#Read utility name from util.txt 
if [ $# -lt 1 ]; then
    if [ -f $UTILITY_NAME_FILE ]; then
    	UTILITY_NAME="`cat $UTILITY_NAME_FILE`"	
    fi
fi

#Read utility name from arguments 
if [ -z "$UTILITY_NAME" ]; then
    if [ $# -lt 1 ]; then
    	echo
    	echo "$ERROR_STR usage "
    	usage
    	exit 1
    fi
    
    UTILITY_NAME="$1"
fi

get_installation_directory
is_file_exist $INSTALL_DIR/$UTILITY_NAME
uninstall_package
check_uninstall_status $?

