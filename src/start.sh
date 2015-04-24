# Make sudo actually work
HOSTNAME=$(cat /etc/hostname)
echo "127.0.1.1 $HOSTNAME" >> /etc/hosts
hostname $HOSTNAME

modprobe i2c-dev
udevd && udevadm trigger

# Copy calibration file to /data so it persists
# cd /RTIMULib/Linux/RTIMULibCal/Output && ./RTIMULibCal
# cp /RTIMULib/Linux/RTIMULibCal/Output/RTIMULib.ini /data

python /usr/src/app/main.py