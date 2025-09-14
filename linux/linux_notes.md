# Linux File System
<img width="950" height="450" alt="image" src="https://github.com/user-attachments/assets/35861e58-9f07-4ce1-8c53-8142c8b226a0" />
The Linux file system is the structure Linux uses to organize and manage all files, with everything starting from the root /. It exists so data isn’t just raw 1s and 0s but stored in an orderly, secure, and accessible way.\

You need to know it because it helps you navigate the system, troubleshoot problems, manage permissions, and run services\

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
  
### Host name VS Username
`alice@server1:~$`
alice → username (the account you logged in as). \
server1 → hostname (the computer you connected to).


## Root user Vs Normal User
Regular/Normal user is is like an everyday account with limited permissions. Prompt in linux ends with $
Root/Administrative user is the superuser in Linux and has full control over the system. Prompt in linux ends with #

Use sudo to temporarily become root for a command.

# Some Linux Commands
`pwd` #print working directory: It is useful when you get lost in a system 
`cd <dir name>` #change directory \
`cd ` #change to home directory\
`cd ~` #change to home directory\
`cd /` change to home directory\
`cd /home/username` #change to home directory\
`cd ..` to  go a step back to previous directory\
`cd ../..` to go back two steps
`su` #Switch User\
`whoami` #prints the current logged in user 

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
`env` #prints all environment variables\
`echo $HISTSIZE` #Displays history size( last number of commands the shell remembers)\
`man <command>` #shows documentation for a command\
`mv<oldname> <newname>` #to rename a file\
`mv<file> <new directory>` #to move a file\
`rm` #to delete a file. This alone cannot be used to remove a directory\
`rm -r` # r means recursive. So it would delete the directory and its content\
`rm -i`# i means interactive. So it would ask for confirmation before deletion \
`rm -f` # f means force \
`rm -ir` # recursive and interactive. for directories \
`rm -d` #to delete an empty directory \
`&&` #to run multiple commands in a line EG: `mkdir tuesday && cd tuesday` \
`rmdir` to remove empty directory \
`nano <newfilename>` to create a new file by opening the GNU nana editor for you to make changes \
`touch <file name>` It is used to create empty files and edit timestamp of a file \
`ls -l` shows details of the files in a directory. So It would help us know if a file is a file, directory, symbolic link, socket, etc.\
`nano <filename>` opens text based editor. ie: A new file has been created \
`vi <file.txt>` to open file.txt in text editor 

## File Descriptors
File descriptor is a number that represents an open file, device, socket or pipe.\
When you run any program in Linux, the system automatically gives it three 'communication channels' to work with:
1. stdin(0)- a channel for input. eg. your keyboard
2. stdout(1)-a channel for normal output. eg. your screen
3. stderr(2)- a channel for error output. eg. your screen but kept separate from stdout

   So for example when you run `ls /etc` , the ls process is created.\
   Linux gives it 3 file descriptors\
   ls uses stdout(1) to print the list of files

   If you run `ls /fakepath`, this would file. This time, it sends the error message to stderr(2) instead of stdout.


### Redirection with file descriptors

You can redirect input output streams using file descriptors:
- redirect stdout(1) to a file:\
`ls > out.txt`\
- redirect stdout(2) to a file:\
  `ls /fakepath 2> errors.txt`\
## Why redirection with file descriptors is Important for DevOps
- Logging → send normal logs to one file, errors to another.\
- Automation → scripts can run without you typing input every time.\
- Debugging → check only errors when something breaks.
  
  Imagine you run a big script that processes thousands of files. Without file descriptors, normal results and error messages would all be mixed together on your screen — super messy. With descriptors, you can neatly separate them into different files.\

`>` overwrite file\
`>>` append to file\
`<` take input from file\
`2>` redirect errors

 ### ways of viewing file content
 `cat` shows the entire file content at once\
 `head <filename.txt>` shows the first 10 lines of a file by default. \
 `head -n 5 file.txt` shows you the 1st 5\
 `tail` shows the last lines of a file. You can also specify the number of lines you want to see by using the `-n` flag.\
 `tail -f` (“follow”) lets you continuously monitor a file in real time.As new lines are added, they immediately appear in your terminal.\
 `more` opens the file page by page(page down only). Press Space → next page, Enter → next line, q → quit.\
 `less` You can scroll up/down, search inside a the file,etc. (Preferred for big files)

 `clear` clears the screen as well as all the commands you have used previously\
 `clear -x` clears the screen but you can still find the commands you used previously

 `cp` to copy a file\
 `ehco` prints text or variable values to the terminal.

 `type` tells you what a command is and where it comes from.\
 It helps you know if a command is:\
- a shell builtin (built into bash, e.g. cd)
- an alias (a shortcut you or the system defined)
- an executable file (like /bin/ls)
 type is useful because it lets you quickly check whether a command is a built-in, an alias, or an external program, helping you understand and debug how your shell runs commands.

 `file <file/directory>` helps you know if an item is a file or a directory 

 ### Symbols for file types in linux
-rw-r--r-- → - means regular file.\
drwxr-xr-x → d means directory.\
lrwxrwxrwx → l means symbolic link.

`base64`It encodes and decodes data using Base64 representation.

## System Administration
In Linux, every user must belong to at least one group.\
A group is a collection of users.\
Groups make it easier to manage permissions (read, write, execute) for multiple users at once.

### User and Group Relationship
When you create a new user, Linux automatically creates a primary group with the same name as the user.
Example:
`sudo adduser alice`\
→ user = alice, primary group = alice.

`groups` to check group of the user\
`cat etc/group` to print all the groups in your system\
`sudo groupmod -n newgroup oldgroup` to change the groupname/
`cat etc/passwd` It’s a text file that stores information about all users on the system.\
`useradd -u 2020` the -u flage helps you customize the user iD\
`id<username>` Shows your user ID (UID), group ID (GID), and groups you belong to \
`deluser` to delete a user \
`sudo password <username>` to change or set new password.\
`sudo !!` also used to change password\
`sudo usermod` to change the username\
`sudo usermod -l new_username old_username` to modify an existing user account in Linux.\
`sudo usermod -aG <groupname> <username>`\
-a → append (otherwise the user will be removed from all other groups not listed).\
-G → specify one or more supplementary groups (comma-separated).\
`groupadd` to add a new group\
`deluser` to delete a user\
`sudo userdel alex` Removes the user account. Leaves the user’s home directory and files behind.
deluser leaves a notification while userdel runs silently.

###Difference between `su -username` and `sudo su username`
`su - username`\
Switch User: Changes you to username.\
Prompts you for that user’s password (not your own).

`sudo su - username`\
Uses sudo first: Runs the su - username command with root privileges.\
Prompts you for your password (the sudo user’s password).

`sudo passwd` to assign password to already created user

### Symbolic link
symbolic link (also called a symlink or soft link) is basically a shortcut to another file or directory in Linux.\
A symlink is a special file that points to another file or folder\
A symbolic link is like a Windows desktop shortcut — it makes accessing files easier without duplicating them.

- `ln <original file> <hard like name>`*Hard link* :A hard link is another name for the same inode (same data).
- `ln -s <directory> <softlinkname>` *Soft link*:A soft link is just a pointer/shortcut to another file.

#### Hard Link 
`echo "Hello" > file1.txt`\
`ln file1.txt file2.txt`\
Now `file1.txt` and `file2.txt` both point to the same inode.\
If you edit `file1.txt`, changes appear in `file2.txt`.\
If you delete `file1.txt`, the data is still safe because `file2.txt` still points to it.\
✅ Both are equal — no "original" or "shortcut."\
It doesn't span directories.

#### Soft Link
`ln -s file1.txt link1.txt`\
`link1.txt` → points to `file1.txt.`\
If you open link1.txt, you’re redirected to file1.txt.\
If you delete file1.txt, then link1.txt becomes broken (dangling link).\
✅ Think of it like a Windows shortcut or macOS alias.



`visudo` is used to edit the sudoers file safely.`sudo visudo`\
The sudoers file controls which users can run sudo and with what permissions.\
Running it via sudo gives you root privileges to edit it.\

`sudo nano /etc/sudoers` Opens the sudoers file in the nano editor\
You can make changes directly.It’s risky because editing /etc/sudoers directly with nano can introduce syntax errors that might break sudo access, leaving you unable to run any administrative commands.

#### User Privilege Specification
A User Privilege Specification defines which users can run which commands as which users using sudo.\
A User Privilege Specification is a line in sudoers that defines what a user can do with sudo.\
Each line in the sudoers file that gives a user permission is a User Privilege Specification.\
Syntax:\
`username  host=(run-as-user)  commands`

🔹 Breakdown of Fields
username → the user being granted privileges \
host → the system where this applies (ALL for all hosts) \
run-as-user → which user they can act as (usually ALL or root) \
commands → which commands they can execute (ALL = any command) 

Example
Give user alex full sudo access:\
`alex ALL=(ALL:ALL) ALL`

Explanation:\
alex → the user\
ALL → any host\
(ALL:ALL) → can run commands as any user or group\
ALL → all commands


`rwx` in Linux refers to file permissions:\
- r → read (view contents of a file, or list a directory)
- w → write (modify a file, or create/delete files in a directory)
- x → execute (run a file as a program, or enter a directory)

These three permissions are usually shown for:
- Owner (user who owns the file)
- Group (users in the file’s group)
- Others (everyone else)

  `-rwxr-xr--`
Breakdown:
rwx → owner has read, write, execute\
r-x → group has read and execute\
r-- → others have read only\
👉 In short: rwx defines who can do what with a file or directory.


*When you run ls -l, it lists files and directories in long format. Let’s break down what each part means.*\
`-rwxr-xr--  1 alice devs   2456 Sep 14 10:30 script.sh` \
Breakdown: \
`-rwxr-xr--` → File type + permissions \
First character: file type \
`-` = regular file \
`d`= directory \
`l` = symbolic link \
Next 9 chars: permissions (rwx for owner, r-x for group, r-- for others).

1 → Link count; Number of hard links to the file.\
alice → Owner ;User who owns the file.\
devs → Group; Group associated with the file.\
2456 → File size in bytes; How large the file is.
Sep 14 10:30 → Modification time: Last time the file was modified.\
script.sh → File name \
`ls -l` gives you permissions, owner, group, size, time, and name of each file. 

`chmod` is one of the most important Linux commands because it lets you change file or directory permissions.\
#### Two Ways to Use chmod
1. Symbolic Mode
You specify who and what permissions to add/remove/change.\
Who:\
u = user (owner)\
g = group\
o = others\
a = all (user + group + others)

What:
`+` = add permission \
`-` = remove permission \
`=` = set exact permission 

Example:
`chmod u+x script.sh `  # add execute for user \
`chmod g-w file.txt `   # remove write for group \
`chmod o=r file.txt  `  # set others to read only \
`chmod a+rw data.log `  # give read/write to everyone 


2. Numeric (Octal) Mode \
Uses numbers to represent permissions: \
Permission	Number \
read (r)	4 \
write (w)	2 \
execute (x)	1 

You add them up per category (user, group, others). 

Example:\
`rwx` = 7 (4+2+1) \
`rw-` = 6 (4+2+0) \
`r--` = 4 (4+0+0) 

So:\
`chmod 755 script.sh`   # rwx for user, r-x for group, r-x for others \
`chmod 644 file.txt`    # rw- for user, r-- for group, r-- for others \
`chmod 600 secret.key`  # rw- for user only

