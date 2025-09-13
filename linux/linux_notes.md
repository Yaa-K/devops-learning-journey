# Linux File System
<img width="950" height="450" alt="image" src="https://github.com/user-attachments/assets/35861e58-9f07-4ce1-8c53-8142c8b226a0" />
The Linux file system is the structure Linux uses to organize and manage all files, with everything starting from the root /. It exists so data isn’t just raw 1s and 0s but stored in an orderly, secure, and accessible way.

You need to know it because it helps you navigate the system, troubleshoot problems, manage permissions, and run services

Here are some of the of the linux files and their purpose:
- /bin= contains essential user commands
- /sbin= contains system admin commands
- /etc= configuration files like system configs and network files
- /home = home directories for users
- usr=user system resourses
- /var=Variable data. It contails files that change while the system is running
- /dev=device files like usb,keyboard,etc
- /mnt & /media= mont points for external drives
- /boot =Bootloader files

## Root user Vs Normal User
Normal user is is like an everyday account with limited permissions. Prompt in linux ends with $
Root user is the superuser in Linux and has full control over the system. Prompt in linux ends with #

Use sudo to temporarily become root for a command.

# Some Linux Commands
`pwd` #print working directory: It is useful when you get lost in a system\
`cd <dir name>` #change directory\
`cd ` #change to home directory\
`cd ~` #change to home directory\
`cd /` change to home directory\
`cd /home/username` #change to home directory\
`su` #Switch User\
`whoami` #prints the current logged in user\

`cat` #concatenate. to read and display contents of files. It can also be used to create files or join multiple files together\
`cat > notes.txt`#To create new file with cat\
`cat >>notes.txt` append text to an existing file \
`cat file1.txt file2.txt >combined.txt` #join files into a new file\
`sudo useradd` #useradd is to create a new user and sudo lets you run the command as root user. Note that useradd doesn't  create a home directory.\
`sudo adduser` #adduser also creates a new user and creates a home directory, and prompts for password.\
`sudo passwd` #to set or change a password\
`hostname` #to show the name of your machine on the network\
`sudo hostname newname` #to temporarily change hostname\
`sudo hostnamectl set-hostname newname` #Permanently change hostname to newname\
`nano /etc/hostname` #to permanently change hostname using text editor. you type sudo reboot to reboot and see the changes\
`sudo -i` #gives you full root shell until you exit\
`sudo apt` #advanced package tool. It's how you install,remove, update and manage software on Ubuntu\
`sudo nmtui` #network manager's text interface. It is  also used to edit hostname\
`uptime` #shows how longthe system has been running since last reboot.\
`uptime-s` #shows you the exact date and time the system was started\
`history` #Shows a list of commands you have run on the shell. If you want to run any of the commands in the list, you just type a bang(!) followed by the number. EG:!12\
`env` #prints all environment variables
`echo $HISTSIZE` #Displays history size( last number of commands the shell remembers)
`man <command>` #shows documentation for a command










