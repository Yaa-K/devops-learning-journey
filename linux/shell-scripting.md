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

