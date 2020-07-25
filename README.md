## Utility to upload only diffs to remote server

 Utility to upload only difference between local directory/file and remote directory/file. 
 This utility uses rsync utility under the hood.

## Download and Install Utility

  1. Clone this repo
  2. cd src
  3. chmod +x install.sh uninstall.sh
  4. ./install.sh

## Usage

#### SYNTAX

	diff_upload <username> @ <remote_ip / domain_name> : <remote_ssh_port> <local file/dir> <remote file/dir>

#### Example

	diff_download  test@192.168.1.1:22 ./ remote_dir 
  
## Uninstall
	
   To uninstall the utility execute

 	./uninstall.sh

## Tested Systems

	1. Linux
	2. MacOS
