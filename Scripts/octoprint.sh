echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
COUNT=0
export IMAGE_PATH=/home/octoprint/.octoprint
for dir in $(ls /srv/octoprint); do
  sudo docker stop octoprint-$dir
  sudo docker rm octoprint-$dir
  sudo docker run -d -p 500$COUNT:5000  --name octoprint-$dir --device=/dev/ttyUSB$COUNT:/dev/ttyUSB0 -v /srv/octoprint/$dir:$IMAGE_PATH -v /srv/hive/slicingProfiles:$IMAGE_PATH/slicingProfiles -v   /srv/hive/uploads:$IMAGE_PATH/uploads  test/octoprint
  COUNT=$(($COUNT+1))
done;
