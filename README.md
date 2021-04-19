# PyCharm IDE containerized with docker

Prereq is a Linux X11-enabled host (Gnome/KDE/fvwm/twm/etc) with docker engine.

(For more and better examples of running a GUI from docker, look [here](
https://blog.jessfraz.com/post/docker-containers-on-the-desktop/ ))

## Building / Running


   1. You must first enable local X display calls
   On the host, type
   ```
   $ xhost +local:
   ```
   (This may have to be repeated on every login to re-authorize the X11 display for docker applications.)
   1. Build and run the container
   ```
   $ docker build -t pycharm_ide .
   $ docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix pycharm_ide
   ```
   1. (Optionally work as another user, can be your host UID/GID):
   In the container:
   ```
   # groupadd -g 1000 myuser
   # useradd -g 1000 -u 1000 myuser -m -s "/bin/bash"
   # su - myuser
   ```
   1. type
   ```
   # cd /
   # tar xvzf pycharm-community-2020.2.tar.gz
   # su - myuser ## if desired (see above)
   # /pycharm-community-2020.2/bin/pycharm.sh
   ```
   1. Click through the user agreement to configure the GUI.
      and click `Skip remaining and set defaults`
      When the main dialog appears, click configure/settings at the lower right menu.
      Under "appearance", change theme to light ("Intellij light"), dark ("Darcula"), etc
   1. start writing and debugging Python
