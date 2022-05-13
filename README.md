# Docker image for the BKG Ntrip Client (BNC)

## Run the BKG Ntrip Client (BNC)

This image allows running the [BKG Ntrip Client](https://igs.bkg.bund.de/ntrip/bnc).

### On GNU/Linux host machines

  Install the X11 server utilities in the host machine:

  - Debian: `apt-get install x11-xserver-utils`
  - Ubuntu: `apt-get install x11-xserver-utils`
  - Arch Linux: `pacman -S xorg-xhost`
  - Kali Linux: `apt-get install x11-xserver-utils`
  - CentOS: `yum install xorg-xhost`
  - Fedora: `dnf install xorg-xhost`
  - Raspbian: `apt-get install x11-xserver-utils`

  Each time you want to use the graphical environment, adjust the permission of
  the X server in the host by the following command:

      $ xhost +local:root

  Then run the container with:

      $ sudo docker run -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority \
      --net=host -it --rm -d carlesfernandez/bnc

  In case you want to revoke the granted permission:

      $ xhost -local:root

### On macOS host machines

  Do this once:

  - Install the latest [XQuartz](https://www.xquartz.org/) version and run it.
  - Activate the option
    "[Allow connections from network clients](https://blogs.oracle.com/oraclewebcentersuite/running-gui-applications-on-native-docker-containers-for-mac)"
    in XQuartz settings.
  - Quit and restart XQuartz to activate the setting.

  Each time you want to use the graphical environment, type in the host machine
  (with XQuartz already running):

      $ xhost + 127.0.0.1

  Then run the container with:

      $ docker run -e DISPLAY=host.docker.internal:0 -v $HOME/.Xauthority:/root/.Xauthority \
      --net=host -it --rm -d carlesfernandez/bnc

## Run the container with shared folders

The container has the `/inputs` and `/outputs` folders, that can be mounted to
local folders when instantiating the image, _e.g._:

      $ sudo docker run -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority \
      -v $MY_INPUT_FOLDER:/inputs \
      -v $MY_OUTPUT_FOLDER:/outputs \
      --net=host -it --rm -d carlesfernandez/bnc

## BNC Documentation

The BKG Ntrip Client (BNC) manual is available by doing:

      $ sudo docker run -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority \
      --net=host -it --rm -d carlesfernandez/bnc evince bnchelp.pdf

## Build docker image

This step is not needed if you have pulled the docker image. If you want to
build the Docker image on your own, go to the repository root folder and run the
following command:

     $ docker build -t carlesfernandez/bnc .

You can change the tag name `carlesfernandez/bnc` at your own
preference.


## Copyright

Copyright: &copy; 2022 Carles Fern&aacute;ndez-Prades,
[CTTC](https://www.cttc.cat). All rights reserved.
