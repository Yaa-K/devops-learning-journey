## 🎯 Project Goal

This mini project demonstrates how to use **shell scripting** and **cron jobs** for basic automation on Linux.  
The goal is to create a script that moves files from one folder to another and logs the cleanup process with a timestamp.

---

## 📝 Description
The script performs the following tasks:
* Moves files from a folder called `old\_files` into another folder called `archive\_files`.
* Appends a line such as `Cleanup ran on <date>` into a log file named `cleanup.log`.
* Runs automatically once per day using a scheduled cron job.

This project was given as part of the Women Techsters Fellowship – September 2025 mini projects.

---

## ⚙️ Project Files

* `cleanup.sh` → Main shell script.
* `crontab.txt` → Cron job entry to schedule the script.
* `cleanup.log` → Log file showing cleanup records.
* `screenshot.png` → Screenshot of the project running.

---

## 🚀 Method

1. I created a directory(`old\_files`) in my home directory using the mkdir command.
<p align="center">
<img width="1019" height="434" alt="Screenshot 2025-09-26 003150" src="https://github.com/user-attachments/assets/8fc40aef-0315-4349-b19a-924be5a55167" />
</p>

2. I created another directory(archive\_files) also in my home directory.

4. Then I created some dummy files in `old\_files` dir so I would see the results when I run the code. I used the touch command and brace expansion to create 5 files at once
 <p align="center">
  <img width="1170" height="786" alt="Screenshot 2025-09-26 003937" src="https://github.com/user-attachments/assets/97c98af5-f16b-42f1-b542-d94c10ff8283" />
</p>
6. I moved forward to create a script file(`cleanup.sh`) using nano. This would open the nano file editor almost immediately so I can make 

7. In the first line, I wrote `#!/bin/bash` so that the bash interpreter can recognize that this is a script file.
   
8.We needed to iterate the files so they would be moved to the new file so I choose the for loop because we know the number of times the loop needs to iterate through the files. When the iteration is over, "Cleanup run on <date>" would be printed in cleanup.log file. I saved my changes by pressing ctrl+O and ctrl+x
  <p align="center">
 <img width="1920" height="1008" alt="Screenshot 2025-09-26 011141" src="https://github.com/user-attachments/assets/944b0a01-c8f2-4f56-a3ec-1fdea2919c3e" />
</p>
9. To make this script executable, I used the chmod command to modify the permissions on the file
  <p align="center">
  <img width="974" height="473" alt="Screenshot 2025-09-26 004142" src="https://github.com/user-attachments/assets/3526fdf9-3637-4194-b782-2c8c5367f81d" />
</p>
10. I opened a crontab using this command crontab -e

11. I made changes to the crontab by setting a time it is to run. This cronjob would run at 1:09am everyday and also included the file path of the cleanup.sh file. The cronjob has been scheduled
  <p align="center">
  <img width="1920" height="1008" alt="Screenshot 2025-09-26 011400" src="https://github.com/user-attachments/assets/a9daab3c-a9d8-417d-9cbc-03757773a8fa" />
</p>
12. The files were moved to archive\_files directory and the log recorded the print statement
<p align="center">
  <img width="1082" height="445" alt="Screenshot 2025-09-26 004850" src="https://github.com/user-attachments/assets/68732cd6-f95c-4457-9b75-699fe4a76cc7" />
</p>

## Challenges I faced
1. On my first try, I wrote the command in my for loop like this: mv "$FILE" "~/archive\_files". Quotes around "~" stopped it from expanding to my home directory. This would work file instead mv "$FILE" ~/archive\_files
2. In the script, i wrote:
```
FILE=$(ls ~/old\_files)
for FILE in $FILES
do
mv "$FILE" ~/archive\_files
```
`ls ~/old\_files` would just print the file names and that would be problematic if I am not running the script in my working directory.

So this approach would be better if I don't create a variable for files. I would rather quote the `old\_files` directory directly in my for loop. 

The code would therefore look like this:
```
for FILE in ~/old\_files/\*
do
mv "$FILE" ~/archive\_files
```
`~` = expands to my home directory
`~/old\_files/`= means that the old\_files are in my home directory
`\*`=matches all the files and folders inside `old\_files` directory.

So if `old-files` has these files:
```
file1.txt file2.txt file3.txt
```
The `~/old\_files/\*` expands into:
```
/home/yaa/old\_files/file1.txt
/home/yaa/old\_files/file2.txt
/home/yaa/old\_files/file3.txt
```
So the loop would pick the file locations instead of the filename and so it wouldn't e a problem running the script in a different directory instead of the old\_files directory.

3.I forgot to make my script executable on the first try: `chmod +x cleanup.sh`  \
4.`echo "cleanup run on $DATE" >> cleanup.log` \
`cleanup.log` would be created in whatever directory you are currently in which is not good and can get confusing. So instead, I wrote the full path so that it would be consistent. No matter where I run the script, it would always go to the file path I have defined.
Also, the cronjob run well but the date didn't print in the log, so instead of defining a variable and calling it, I used the date function directly 
```
echo "cleanup ran on $(date)" >> ~/cleanup.log
```
## Future improvements
1. Instead of using the for loop I could simply use the mv command to just move all the files in the archive files\[`mv ~/old\_files/\* ~/archive\_files/`]



















