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




