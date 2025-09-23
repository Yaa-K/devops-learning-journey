  ## Job and Process control in linux

  ### Job and Process in Layman terms
**Process (in simple terms)** \
**A process** is just something your computer is doing right now. \
Example:
- When you open Chrome, your computer starts a process for Chrome.
- When you run ls in the terminal, that’s a tiny process.
  
-Every process has a name (what it’s doing) and a PID (its ID so the system can keep track).
_Think of it like a worker in a factory: each worker (process) is assigned a task._

**A job** is a process that your terminal knows about.
Example:
- If you run a program normally, it’s a foreground job (it blocks the terminal until it finishes).
- If you add & at the end, it runs in the background, so your terminal is free while it keeps running.
  
Think of it like:
- You ask a worker to do a task in front of you (foreground job).
- Or you send a worker to do a task in another room and keep working yourself (background job).
Key idea

- Process = anything running on your computer. This is started by the user or the shell.
- Job = a process that your shell (terminal) started and is tracking. This is started by the shell.
  
So:
- Every job is a process, because it’s something running.
- But not every process is a job, because some processes are started by the system or other programs, and your shell doesn’t know about them.
  
  `jobs` Lists all the jobs started in the current terminal session.
  
 ` ps` stands for process status. It shows you a snapshot of the processes running on your system.
  `ps -aux` lists running processes. Let’s break it down:
- `ps` → process status (shows processes).
- `-a` → all users’ processes (not just yours).
- `-u` → show the user/owner of each process.
- `-x `→ include processes not attached to a terminal (like daemons).

  `ps -ef`
- `-e` → show every process (system-wide, not just your shell).
- `-f` → full-format, meaning you get extra details like parent PID, command arguments, etc.
Typical output:
```
UID   PID  PPID  C STIME TTY          TIME CMD
root    1     0  0 Sep21 ?        00:01:45 /sbin/init
user 2345  1234  1 10:03 pts/0    00:00:02 python app.py
```

- UID → user owning the process
- PID → process ID
- PPID → parent process ID (who started it)
- C → CPU utilization
- STIME → start time of process
- TTY → terminal associated (or ? if none)
- TIME → total CPU time used
- CMD → command/program that started the process

- `kill -9 PID` → sends the SIGKILL signal to a process.This immediately forces the process to stop — no cleanup, no chance to save data.
- `killall<process_name>` → kills processes by name instead of PID.
- `kill -l` → lists all available signals you can send to processes.So kill -l is basically your cheat sheet of signals.

Most common signals:
- 1 (SIGHUP) → hangup (restart/reload a process, often used for daemons).
- 2 (SIGINT) → interrupt (same as Ctrl+C).
- 9 (SIGKILL) → force kill (immediate).
- 15 (SIGTERM) → terminate gracefully (default for kill).
- 18 (SIGCONT) → continue a stopped process.
- 19 (SIGSTOP) → stop (pause) a process, can’t be ignored.
- 20 (SIGTSTP) → stop from terminal (like Ctrl+Z).

### Parent and Child Processes
Every process in Linux is created by another process (except the very first one, init or systemd).

The process that creates another process is called the **parent process**(PPID).
The created process is called the **child process**.

Example:
```
bash (PPID=1000)
 ├─ python script.py (PID=1234)
 └─ sleep 60 (PID=1235)
bash is the parent process.

python and sleep are child processes.
```
### Killing Processes
1. Killing a child process first
- Usually safe; parent may continue running.
- But sometimes the parent respawns the child automatically. \
Example: some service managers or scripts automatically restart child processes.

2. Killing the parent process first
- The parent stops, so it won’t restart or manage the child anymore.
- After that, killing child processes is final.
- 
### Why DevOps Engineers Care
- Many servers run services with parent-child hierarchies: web servers, worker processes, cron jobs.
- If you just kill the child process, it might come back automatically.
- Killing the parent first ensures clean shutdown of the whole process tree.
```
ps -ef | grep <process_name>
```
Columns: UID PID PPID CMD → PPID = parent process ID.

Kill parent first, then child (if needed):
```
kill <PPID>
kill <PID>
```
----------------------------------------------------------------------

- `top` → built-in Linux command to monitor processes, CPU, and memory in real time.
- `htop` → advanced, interactive version of top with colors, scrolling, and easier controls.
### Why `top` and `htop` matter for DevOps
- On servers, processes can misbehave: a service might hang, or a script might eat 100% CPU.
- With top/htop, you can spot the culprit immediately.
- You can decide to restart a service, kill a runaway process, or optimize resource usage.

----------------------------------------------------------------
## Job
- `sleep 90` → pauses execution for 90 seconds.
- You can run the` sleep `command in the background by adding `&` at the end

After you run something in the background (with &), you can bring it back to the foreground using:
`fg<job number>`
- If you have multiple background jobs, you can specify which one with the job number:
```
fg %1   # brings job 1 to foreground
fg %2   # brings job 2 to foreground
```

👉 `jobs` will show you the job numbers `([1], [2], etc.).`

**Ctrl+Z** → suspends (pauses) the current foreground job and puts it into the background in a stopped state.
`bg` → resumes a job in the background instead of the foreground.
**Ctrl+C** - kills the bg process


To check the total memory your system has:
```
free -h
```

Output example:
```
              total        used        free      shared  buff/cache   available
Mem:           8G         6G         1G         0.1G        1G          1.5G
Swap:          2G         0.5G       1.5G

```
- total → how much RAM the system has
- used → currently in use by processes
- free → completely unused memory
- available → memory available for new applications

### Free Up Memory on a Linux Server
- Check total memory → `free -h`
- List running processes sorted by memory → `ps aux --sort=-%mem` or` top `(press M)
- Identify unnecessary processes
- Stop unneeded processes →` kill <PID> `or `killall <process_name>`
- Verify freed memory → `free -h`

VDI- Virtual Disk image

## As a devops engineer, why do I need to know about Jobs and processes
**Jobs and processes** are basically the heartbeat of a Linux server. If you don’t understand them, you can’t reliably manage, debug, or automate servers — and that’s exactly what DevOps engineers do every day.

1️⃣ Managing running programs \
- On servers, multiple programs run simultaneously: web servers, databases, scripts, background tasks.
- You need to know which processes are running, how much resources they use, and how to stop or restart them.
- Example: a runaway process eating all CPU → you need to find it and kill it.

2️⃣ Debugging issues \
If something breaks on a server, you check processes to see:
- Is the service running? (ps, systemctl status)
- Did it crash?
- Is a background script still running?

3️⃣ Running tasks efficiently
- Some scripts or commands can run in foreground (blocking) or background (non-blocking).
- You might want to run nightly backups, monitoring scripts, or deployments in the background so the terminal stays free.
Commands you’ll use a lot:
- jobs → see background jobs
- fg → bring a background job to foreground
- bg → send a stopped job to background
- ps, top, htop → monitor all processes
- kill, killall → stop processes

4️⃣ Automating server tasks
- DevOps often involves scripts, cron jobs, and monitoring.
- You need to know how to start, stop, and monitor processes automatically.
- Example: if a critical service stops unexpectedly, you can detect it and restart it automatically.



