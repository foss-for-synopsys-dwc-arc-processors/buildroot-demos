#!/bin/sh
#wget -O openarena.zip www.openarena.ws/request.php?4 
if [ $? -eq 0 ]
        then
                echo "Openarena files downloaded successfully"
        else
                echo "Error: Unable to download openarena zip archive" >&2
		echo "Manually download archive from www.openarena.ws and place it in buildroot directory"
		echo "Then run commands in board/synopsys/hsdk/openarena_download.sh below this message" 
		exit 1
        fi
# Run commands below if you download zip archive manually
unzip -o openarena.zip 
mkdir -p output/target/root/.q3a/baseq3/
cp openarena-0.8.8/baseoa/pak* output/target/root/.q3a/baseq3/
