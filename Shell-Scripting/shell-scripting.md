# Shell Scripting
All Shell Script files when creating, you must add the `.sh` extention. Why?`.sh` tells humans (and sometimes tools) that the file is a shell script.

*A script* is a text file containing a list of commands that the computer can execute in order, automatically, instead of typing them one by one in the terminal.
- Think of it like a recipe: a list of steps that the computer follows.
- Scripts are used to automate repetitive tasks.

`sleep` pauses execution for a specified amount of time.
Often used in scripts to wait before running the next command.

### Ways to run a shell script
1. Using bash (or sh):\
 `bash script.sh`
- Runs the script using the bash interpreter.
- The script doesn’t need execute permission (chmod +x) when using this method.

2. Using ./ (direct execution)
`./script.sh`
- Runs the script directly as a program.
- The script must be executable

####  #!/bin/bash
`#!/bin/bash` tells the system which interpreter should run the script — in this case, the Bash shell. \
You indicate the shebang (#!) on the very first line of your script file. \
Example: \
`#!/bin/bash` \
`echo "Hello, world!"`

The characters `#!` at the very start of a script file are called a shebang. \
Everything after it is *the path to the interpreter* that should run the script. \
So #! /bin/bash means: “use the Bash program located at /bin/bash to run this script.”       

#### Package Manager
A package manager is a tool in Linux (and other OSes) that automates the process of installing, upgrading, configuring, and removing software. Instead of manually downloading software from websites, you use a package manager to fetch it from a trusted repository.

##### Why It’s Important?
- Saves time (one command instead of manual downloads).
- Handles dependencies (installs other packages your software needs).
- Keeps software updated.
- Ensures you install software from trusted sources.

##### Examples of Package managers
*Debian/Ubuntu (and derivatives):*  \
- `apt` (newer, user-friendly) → `sudo apt install nginx` advanced package manager \ 
- `dpkg` (low-level) → `sudo dpkg -i package.deb` dpkg means debian package manager

 *Red Hat/CentOS/Fedora:* \
- `yum` (older, still used) → `sudo yum install nginx` Yellowdog Updater Modified:Handles installation, updates, dependency resolution automatically.
- `dnf` (newer, replacement for yum) → `sudo dnf install nginx`Dandified YUM:Newer replacement for yum (Fedora 22+, RHEL 8+). Faster, better dependency handling, improved performance.
- `rpm` (low-level) → `sudo rpm -ivh package.rpm` Red Hat Package Manager:Low-level tool, works with .rpm files directly. Does not resolve dependencies automatically

*Dependencies* are the extra software (libraries/packages) that a program needs to run, and package managers like `apt` automatically install them for you, while `dpkg` does not.

##### Differences between apt and apt-get
`apt` is essentially a more user-friendly, human-oriented interface for package management, while `apt-get` is the original, script-friendly, low-level tool; both use the same backend (`dpkg`) and repositories.
`apt` → shows a cleaner, colored output with a progress bar, which makes it easier to see what’s happening during installation or upgrade. \
`apt-get` → more basic, text-only output, no progress bar, less user-friendly, but still works perfectly.

`sudo apt update` checks the internet for the latest versions of all software your system can install and updates your local list so your system knows what’s available — it doesn’t actually install or upgrade anything yet.

you should always run:`sudo apt update` before installing anything with apt because this ensures your system knows about the latest available versions of packages.

`sudo apt install tree` installs the tree utility so you can see directories and files in a structured, visual format in the terminal.

`sudo apt-get install tree -y`

Use the `-y` flag whenever you want the system to automatically accept all prompts during package operations, which is especially useful in scripts or batch installs.

`which bash` shows the full path to the bash executable that your system will use when you run the shell. In other words it shows the path where the bash command is. It would return: `/bin/bash`

`#`comment is used to write notes in scripts or configs so Linux ignores that line.

*A variable* in Linux is just a name that holds a value so you can reuse it in commands or scripts\
Make your variables UPPERCASE always.

### Practice Script from Class

<figure>
  <img width="1193" height="754" alt="image" src="https://github.com/user-attachments/assets/8a3625f6-b5ce-4bd7-a87e-f02e1dbb28ad" />
  <figcaption>Figure 1: This is a simple script that contains some comments(what is in blue) and an echo command that would print the string once this script is run.</figcaption>
</figure> 


<br><br>

 <figure>
  <img width="1193" height="767" alt="image" src="https://github.com/user-attachments/assets/d519b11b-cf20-4625-a5d2-2d49f12d133e" />
  <figcaption>Figure 2:This is a modification from the 1st image. This time, a variable 'NAME' was defined and placed in the string as $NAME </figcaption>
</figure>

In Linux shell scripting (bash, zsh, etc.), the dollar sign `$` is used to tell the shell "this is a variable, not just plain text."

To make the script a bit dynamic we would want to take input from the user. We can do that by using the `read` command.

`read -p "Prompt message: " VARIABLE`
- `read` → command to take input from the user.
- `-p` → lets you display a prompt message before waiting for input.
- `"What's your name?:"` → the prompt that will show to the user.
- `VARIABLE `→ the variable where the input is stored.

  You would see `read` in action from the below image.

  <img width="1194" height="767" alt="image" src="https://github.com/user-attachments/assets/b5c4b2ed-04df-4157-b4cc-3d82a818c519" />

#### Conditional Statements
```
if [ condition ]; then
    # commands if condition is true
elif [ another_condition ]; then
    # commands if the elif condition is true
else
    # commands if none of the conditions are true
fi
```
- `if` starts the block.
- `elif` means "else if" (you can have many of them).
- `else` runs if none of the above are true.
- `fi` closes the block (like endif in other languages).

Pro tip: In VS code, to comment multiple lines, this is the shortcut `Ctrl + /`

### Comparison Operators in Bash
1. Numeric Comparisons
These are for comparing numbers (integers).
They only work inside [ ] or (( )) — not with normal operators like > or < (those are for strings).
Operators:
- `-eq` → equal to
- `-ne` → not equal to
- `-gt` → greater than
- `-ge` → greater than or equal to
- `-lt` → less than
- `-le` → less than or equal to

✅ Example:
```
x=10
y=20

if [ $x -lt $y ]; then
    echo "$x is less than $y"
fi
```

Or with (( )) (cleaner syntax):

```
if (( x < y )); then
    echo "$x is less than $y"
fi
```

Note : Inside double parentheses (( )), < and > are treated as numeric comparison operators, because (( )) is an arithmetic context.

2. String Comparisons
These are for comparing text values.
Operators:

- `=` → equal to (basic, works in [ ] or [[ ]])
- `==` → equal to (extra features in [[ ]])
- `!=` → not equal
- `<` → less than, lexicographically (like alphabetical order)
- `>` → greater than, lexicographically
- `=~` → regex match (**only works inside [[ ]])
- `-z` → string is empty (zero length)
- `-n` → string is not empty

✅ Example:
```
name="Alice"

if [[ $name == "Alice" ]]; then
    echo "Hello, Alice!"
fi

if [[ -z $name ]]; then
    echo "Name is empty"
fi
```
3. File Comparisons
These check properties of files or directories.
Operators:
- `-e file `→ file exists
- `-f file` → file is a regular file (not a directory, not a device)
- `-d file `→ file is a directory
- `-r file` → file is readable
- `-w file` → file is writable
- `-x file `→ file is executable
- `-s file` → file exists and is not empty
- `file1 -nt file2` → file1 is newer than file2
- `file1 -ot file2` → file1 is older than file2
- `file1 -ef file2 `→ both refer to the same file (same inode)

✅ Example:
```
file="notes.txt"

if [ -e $file ]; then
    echo "$file exists"
fi

if [ -s $file ]; then
    echo "$file is not empty"
fi
```

In shell scripting, `case` is like a more powerful version of `if-elif-else` — it lets you match a variable or expression against multiple patterns.

```
Syntax:
case WORD in
    PATTERN_1)
        commands
        ;;
    PATTERN_2)
        commands
        ;;
    *)
        default_commands
        ;;
esac
```
Explanation:
- `WORD` → the variable or value you’re checking.
- `PATTERN` → can be literal values (yes, no) or even wildcards (*.txt, file[0-9]).
- `;;` → marks the end of a block.
- `*) `→ is the default (like else).
- `esac` → ends the case block (notice it’s case spelled backwards).

```
#!/bin/bash

read -p "Do you want to continue? " answer

case $answer in
    yes|Yes|Y|y)
        echo "You chose YES ✅"
        ;;
    no|No|N|n)
        echo "You chose NO ❌"
        ;;
    *)
        echo "Invalid response 🤔"
        ;;
esac

```
`case` lets you separate multiple acceptable values with `|`

#### When to use if and when to use case
- Use `if` for numeric comparisons, ranges, and simple true/false checks.
- Use `case` when you have many string or pattern-based options.

#### For loop and While loop
`For` Loop \
Best for: when you know how many times you want to run something.

Syntax:
```
for VARIABLE in item1 item2 item3
do
   # commands using $VARIABLE
done
```
- `VARIABLE` → takes each value in the list, one at a time.
- `in item1 item2 item3` → the list of items you want to loop through.
- `The do ... done block` → runs once for each item.
```
for i in 1 2 3 4 5
do
    echo "Number: $i"
done

```

Example use: iterating through a list of files, numbers, or users.
```
for file in *.txt
do
    echo "Processing $file"
done
```

`While` loop
Best for: when you don’t know how many times it will run — it keeps going *as long as a condition is true*.

Syntax:
```
count=1
while [ $count -le 5 ]
do
    echo "Number: $count"
    ((count++))
done
```

Until Loop
Works like a while loop, but the condition is the opposite.
A `while` loop runs while the condition is true.
An `until` loop runs until the condition becomes true (i.e., it keeps looping while the condition is false
```
until [ condition ]
do
    # commands
done
```
Memory Trick
- `While` = true loop → keeps running while the condition is true. 
- `Until` = false loop → keeps running until the condition becomes true (so while it’s false).

`-- ` decrement \
`++` incremental

---------------------------------------------------------------------------------------------------------------
#### While loop example
```
while IFS=: read -r USERNAME
do
    echo "User: $USERNAME"
done < /etc/passwd
```
**What is IFS?**
IFS stands for *Internal Field Separator*.

**It’s not a command** — it’s a special shell variable that tells the shell:
👉 “When splitting text into words, use this character as the separator.” 

By default, IFS = space, tab, newline. \
If you set IFS=: then the shell splits text using : instead of spaces. \
IFS is like telling Bash: “Hey, don’t cut text at spaces, cut it at colons (or commas, or whatever I choose)

- `read -r USERNAME` → reads the first field of each line into the variable USERNAME.

- `/etc/passwd `is a system file with user account info, formatted like this:
```
root:x:0:0:root:/root:/bin/bash
user1:x:1000:1000:User One:/home/user1:/bin/bash
```
- In each line, the first field is the username (root, user1, etc.).

 `read` read takes input (from the keyboard, a file, or a pipe) and stores it in variables. \
Example:
```
read name
```

If you type: \
`Yaa` \
Then $name = Yaa. ✅

`read -r` this tells Bash to read input exactly as it is, without interpreting backslashes (\) as escape characters. This is important because without -r, backslashes in file paths, strings, or text could be misinterpreted or removed, leading to incorrect values.

`done` → closes the while (or until) loop.
`< /etc/passwd `→ this is called input redirection. \
It tells the loop: “Take your input from the file /etc/passwd instead of the keyboard.”

- `read`  reads only one line at a time from its input.
- So even though `< /etc/passwd` feeds the entire file into the loop, each iteration of the while loop only consumes one line.
- After processing that line (running the commands inside the loop), read automatically moves to the next line.
------------------------------------------------------------------------------------
#### Brace Expansion
What is Brace Expansion? \
Brace expansion is a way to generate multiple strings or sequences using {}. \
The shell expands it before executing the command, so you don’t have to type everything manually.\
Brace expansion is just text generation, the shell expands it before running the command.

- Example 1: Creating multiple directories
```
mkdir project/{src,bin,doc}
```

Expands to:
```
mkdir project/src project/bin project/doc
```
Creates three directories in one command.

- ✅ Example 2: Number sequences
 ```
echo file{1..5}.txt
```
Output:
```
file1.txt file2.txt file3.txt file4.txt file5.txt
```

- ✅ Example 3: Combining letters and numbers
```
echo user{A..C}{1..2}
```
Output:
```
userA1 userA2 userB1 userB2 userC1 userC2
```

Example 4: To create multiple files at once
`````
touch file{1..5}.docs
````````
----------------------------------------------------------------------

For Loop example:
```
FILE=$(ls *.docs)     # No spaces around =
NEW="new"

for SINGLE_FILE in $FILE
do
   echo "Renaming $SINGLE_FILE to $NEW-$SINGLE_FILE"
    mv "$SINGLE_FILE" "$NEW-$SINGLE_FILE"
done
```
- `FILE=$(ls *.docs)` → stores all .docs files (space-separated) in the variable FILE. If you run this without the $(..), bash would not recognize ls as a command. \
- `for SINGLE_FILE in $FILE` → loops through each filename in FILE. \
- `echo` → prints what will be renamed (safe to check first). \
- `mv "$SINGLE_FILE" "$NEW-$SINGLE_FILE"` → renames the file, quotes handle spaces in filenames.

  
#### Fuctions
**Functions** are a core part of shell scripting, because they let you reuse code instead of repeating yourself. \
A function is a block of reusable code that can be called multiple times from different part of a script.

**DRY** stands for Don’t Repeat Yourself.
In programming (and in Bash scripting too), it means: Instead of writing the same code again and again, put it in a function (or a reusable block), and just call it whenever you need it.

```
my_function() {
    echo "This is my function"
}
```

When you run the above, you will not see any output. You would therefore have to call the function.
You call the function by just typing out the fuction name
```
my function
```

Functions can take arguments just like scripts do.

```
greet_user() {
    echo "Hello, $1!"
    echo "You are learning $2."
    echo "You are $3 years old."
}

greet_user "Yaa" "Linux" "23"
```

`$1`, `$2`, `$3` … represent positional arguments.

#### Parameter vrs Argument
- Parameter = variable (defined in function/script header).
- Argument = actual value (provided when calling the function/script).

## CronJob
**A cron job** is a scheduled task in Unix-like operating systems (Linux, macOS, etc.) that runs automatically at specified times and intervals.

It’s managed by the **cron daemon** (crond), which constantly runs in the background and checks if there are any tasks (jobs) to execute at the scheduled times.


- **Cron** = a time-based job scheduler.Cron is the system that schedules and runs tasks automatically.
- **Cron job** = the actual command or script you schedule.A cron job is one specific task (a line inside the crontab) that tells cron what to run and when.
- **Crontab (cron table)** = the configuration file where you define your cron jobs.
- **The cron daemon (crond)** is always running in the background, checking every minute if a task should be executed.

#### Some tasks cronjob can do
<img width="808" height="384" alt="image" src="https://github.com/user-attachments/assets/c288552d-7553-4eb0-9da7-ba2161387562" />

### Cron and At
These are both schedulers in linux. \
`Cron`
- Purpose: Repeated, recurring tasks.
- How it works: Runs jobs at fixed times/intervals (daily, weekly, every 5 minutes, etc.).
- Configured in: crontab file.

`At`
- Purpose: One-time tasks.
- How it works: Run a job once at a specified time.
- Configured with: `at `command (not a file).
- Basic Syntax
`at [time]`
Then you type the command(s) you want to run, press Enter, and finish with CTRL+D

`Anacron` is a Linux service used to run jobs periodically (daily, weekly, monthly) just like cron.
- Main difference: It doesn’t require the computer to be running all the time.
- If your machine was off when the job was scheduled, anacron will run it the next time the computer is on.

### Cron installation
```
sudo apt install cron
```
 ### How to set a Crontab
 A:Using a cron file:prepare jobs in a separate file, then load it. \
`touch cronfile`Create a file with your cron jobs: \
`crontab cronfile` Load it into cron\

B:Editing directly with `crontab -e`: edit the crontab interactively. \
`crontab -e` to edit the crontab
`crontab -l` Check your jobs

```
* * * * * command-to-run or path/to/your/script
| | | | |
| | | | └── Day of week (0–7) (Sunday = 0 or 7)
| | | └──── Month (1–12)
| | └────── Day of month (1–31)
| └──────── Hour (0–23)
└────────── Minute (0–59)
```
#### Example Cron Jobs

1. Run a script every day at 2:30 AM:
```
30 2 * * * /home/user/backup.sh
```


By default, when a cron job runs, any output (stdout or stderr) is sent to the user’s local mail inbox on the system.

So if you schedule something like:
```
* * * * * echo "Hello from cron"
```
Cron will capture `"Hello from cron"` and send it to your system mailbox (you can check it with the `mail` command).

When you run the mail command, type the mail number you want to open and press enter.

Instead of letting output go to mail, you can redirect it to a file. For example:
```
echo "Hello from cron" >> /home/user/output.log
```
➝ This saves the message in output.log (either overwriting with > or appending with >>).

#### Using Ranges in cron
Format: X-Y (from X up to Y)  \
Applies to any field.
Examples:
Run every minute between 1 AM and 5 AM
```
* 1-5 * * * command
```

Run at 10:00 AM every day from Monday (1) to Friday (5)
```
0 10 * * 1-5 command
```

Run every day in January to March
```
0 8 * 1-3 * command
```

#### Ranges with Steps
You can combine ranges with `/` to skip values.
Format: `X-Y/step`
Examples:
Every 2 hours between 8 AM and 4 PM
```
0 8-16/2 * * * command
```
(Runs at 8, 10, 12, 14, 16)

Every 10 minutes from 0 to 50
```
0-50/10 * * * * command
```
(Runs at :00, :10, :20, :30, :40, :50)

✅ So:
- X-Y → continuous range
- X-Y/step → range with interval steps

  
```
*/2 11,12 * * * command
```

🔹 Field by field
- `*/2` → every 2 minutes (0, 2, 4, …, 58)
- `11,12` → only during hours 11 AM and 12 PM
- `* (day of month)` → every day
- `* (month)` → every month
- `* (day of week`) → every day of the week

#### What is /dev/null?
- It’s called the null device or the bit bucket.
- Anything written to /dev/null just disappears — it’s discarded.
- If you read from it, it’s always empty (like an empty file).
- Think of it as a black hole for data 🕳️ — whatever you send there is gone forever.

#### Text editors in Linux
They’re all text editors in Linux:
- `nano` → simple, beginner-friendly.
- `pico` → older version of nano.
- `vi` → classic, powerful but tricky.
- `vim` → “Vi Improved” (modern vi, with more features).
- `emacs` → very powerful, customizable, almost like an IDE. \
👉 Basically: use nano if you’re new, vim if you want power, emacs if you want a full toolbox.

#### vi -text editor
🔹 Basics
- vi filename → open/create a file
Modes:
- Command mode (default, for navigation/commands)
- Insert mode (for typing text)

🔹 Common Keys
- `i` → switch to insert mode (start typing)
- `I` - Would allow you to start typing at the beginning of the file
- `a` → append → puts you in insert mode after the cursor.
- `A` → append at end of line → jumps to the end of the current line and puts you in insert mode.
- `o` → opens a new line below the current one and puts you in insert mode.
- `O` → opens a new line above the current one and puts you in insert mode.
- `gg` = go to top
- `G` = go to bottom
- `h` → move left by one character.
- `l` → move right by one character.
- `j` → move down one line.
- `k` → move up one line.
- `^` → moves the cursor to the first non-blank character of the current line. This doesn't put you in insert mode.
- `$` → moves the cursor to the end of the current line (last character).This doesn't put you in insert mode.
- `w` → jump to the beginning of the next word.
- `e` → jump to the end of the current or next word.
- `r` → replace the character under the cursor with the next key you type.
- `cw` → change word.
- `S` (uppercase S) → substitute entire line.
- `CC` → delete the whole line and start typing.
- `s` → delete 1 character and start typing.
- `yy` → yank (copy) the whole line in vi/vim.
- `p` → paste after/below the cursor (or line).
- `P` → paste before/above the cursor (or line).
- `dd` → delete the current line (cuts it).
- `dw` → delete from the cursor to the start of the next word.
- `D` (uppercase) → delete from the cursor position to the end of the current line.
- `b` → jump backward to the beginning of a word
- `B` → jump backward to the beginning of a WORD
- `x` → delete the character under the cursor (like backspace but forward).
- `X` → deletes the character before the cursor (like a true backspace).
- `Esc` → go back to command mode
- `:w` → save (write)
- `:q` → quit
- `:wq` → save & quit
- `:q!` → quit without saving

#### To search in the vi
- `/` → start a forward search.
- `?` → start a backward search in vi/vim.
Type the word/pattern you want and press Enter → the cursor jumps to the first match after your position.
👉 Extras:
- `n` → jump to the next match.
- `N` → jump to the previous match.

- `:%s/old/new/g`→ replaces all occurrences in the whole file.
- `:s/old/new/g`→ replaces all old with new in that line.
-` :%s/old/new/gc` = Search the entire file for "old", and for every occurrence, ask me if I want to replace it with "new".
- `u` → undo
- `Ctrl+r `→ Redo
- `:set number` → shows line numbers on the left.
- `:set nonumber` → hides the line numbers.

- `V` (uppercase V) = Visual Line mode.It selects the entire line where the cursor is.You can move up/down (j/k) to select multiple full lines.

Open file
- Press `i` → type your text
- Press Esc :wq → save & exit
  
  ### Why DevOps Engineers Should Know Both Nano and Vi
- **Server reality**: On production servers, sometimes only vi is guaranteed to be installed. You don’t want to get stuck because nano isn’t there.
- **Speed & Power**: For small, quick edits → nano. For big config changes, regex search/replace, or debugging code → vi.
- **Collaboration**: Other engineers may use vi by default, so you should be comfortable with it.
- **Emergencies**v: If you’re fixing a live server issue at 2AM, and only vi is available, you’ll need to move fast and not panic.
--------------------------------------------------------------------






























  
