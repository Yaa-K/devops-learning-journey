# Git and GitHub

Working Directory  →  Staging Area  →  Local Repository

   (edit files)        (git add)          (git commit)



#### 

#### Git init

`git init` creates a new empty Git repository in your current folder.

When you run git init,Git creates a hidden directory named .git inside that folder.



### Git branch

`git branch` deals with creating, listing, and deleting branches. git branch

Shows all local branches. The current one has \* next to it.



`git branch <branchname>` This creates the branch but does not switch to it.



`git checkout -b <branchname>` Create and switch in one step



`git branch -d <branchname>` To delete a branch



`git branch -M <new-branch-name>` is used to rename a branch, usually the current one. One common use case is to rename the current branch to main: `git branch -M main`.People often do this after git init, because older Git defaults to master but many teams now use main.



Branches are just pointers to commits. They let you work on new features without touching the main code.





A branch must point to an existing commit. If you run git branch <name> before making the first commit, Git has nothing to point the branch to, so it fails.



`git branch -v` shows each local branch plus its latest commit message and hash.

### Git status

`git status` Shows what’s going on in your working directory and staging area.

Example output tells you:

1. Which files changed but aren’t staged
2. Which files are staged and ready to commit
3. If you're ahead/behind a remote branch



* Files in working directory-red
* files in staging area-green

###  Git add

`git add` -Moves changes from working directory → staging area.



`git add -A` Adds everything across the entire repo to the staging area.

`git add .` Would Add all the files in the current directory to the staging area.



### Git commit

`git commit -m "message"` Takes everything in the staging area and saves it into your local repo.



`git commit` Git opens your default editor (like Vim or Nano). You type the commit message there. That’s considered interactive because you're manually entering the message.



`git commit -am "message"` It adds and commits in one step — but only for tracked files.You can’t skip staging for brand-new files — Git requires them to be staged at least once before they can be committed.



### Git log

`git log` Shows your commit history.You can see authors, dates, messages, and hashes.



HEAD -> master (or HEAD -> main) is Git telling you which branch you're currently on and where HEAD is pointing.





##### ✅ What is HEAD?

HEAD is a pointer to your current commit — usually the latest commit of your current branch.



So when you see something like:

```

HEAD -> master

````

It means:

* You're on the master branch
* HEAD is pointing to the latest commit on master



If you switch branches, HEAD moves with you.



---

`git cherry-pick <commit id>` lets you take one specific commit from another branch and apply it to your current branch — without merging the whole branch.





`git show <commit-id>` :Used to view details of a commit.

It displays:

* The commit message
* Author and date
* The exact changes (diff)



`git blame` (same as annotate):Line-by-line history of a file — who changed what.

Example:

* git blame app.py
* Output shows:
* Commit hash
* Author
* Line number
* Line content



Useful for tracing who edited a specific line.



`git annotate` is just an older alias for git blame (same behavior in most setups).





###### Git Diff

`git diff` Shows the differences between:

* working directory and staging area,
* staging area and last commit, OR two commits/branches.
* Use when: you want to see exactly what changed.



Command	Compares

git diff		Working dir ↔ Staging area

git diff --staged	Staging area ↔ Last commit

git diff HEAD		Working dir ↔ Last commit



Use `git diff` HEAD when you want to see everything that changed since your last commit, regardless of staging.



Start with a file that was already committed



Let's say your file app.py was last committed with this content:

```

print("Hello")

print("Welcome")

print("Bye")

```



✅ Now you edit the file (but don’t stage or commit yet)



You change it to:

```

print("Hello")

print("Welcome to Git")

print("Bye")

print("New line added")

```

✅ You run:

```

git diff

```



You will see something like:

```

diff --git a/app.py b/app.py

index 2a4e5f1..6bd9183 100644

--- a/app.py

+++ b/app.py

@@ -1,3 +1,4 @@

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&nbsp;print("Hello")

-print("Welcome")

+print("Welcome to Git")

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&nbsp;print("Bye")

+print("New line added")

```

✅ Break it down simply:

Symbol	Meaning

\-	Line that was in the last commit but got changed/deleted

\+	Line that is new or modified in your working directory



From the example:

```

-print("Welcome")



```

🔹 You changed or removed that line from the committed version.

```

+print("Welcome to Git")

+print("New line added")



```

🔹 These lines were added or modified.



If you like, I can give you another example with deleted lines, multiple files, or staged changes—

---

### Git restore

`git restore` Used to undo changes:



1. `git restore <file>` → discard changes in working directory.
2. `git restore --staged <file>` → unstage a file.
3. Use when: you want to revert uncommitted edits or remove a file from staging.

git restore --source=<commit-id> <file>

✅ What it means:

You take a specific file and replace its current version with the version from a past commit — without affecting the whole project.



✅ Example:

Let’s say you messed up index.html and want the version from a previous commit:

```

git restore --source=abc1234 index.html

```

This will:

* Pull the version of index.html from commit abc1234
* Overwrite the version in your working directory
* Not touch the rest of the files
* Not move HEAD
* Not change commit history



✅ Important:

* You must specify the file name
* git restore is for files, not entire commits
* It only changes your working directory and optionally staging
* If you don’t include a filename, nothing happens.



---



## Git Checkout

git checkout has two common uses:

✅ 1. Checkout a branch or a commit

You can switch to:

* a branch name → git checkout dev
* a commit hash → git checkout a1b2c3d

When you checkout a commit, you enter detached HEAD state, meaning you're not on any branch—just viewing that commit.



When you add additional commits to a commit you have checkout to, make sure you create a new branch so your changes can be saved successfully.

---



### Git reset



`git reset` can target both commits AND the staging area, depending on how you use it.



✅ 1. When the file is ALREADY COMMITTED



If you've already made a commit and want to undo it:



✅ Move the branch back but keep the code:

```

git reset --soft <commit-id>

```

* Removes the commit
* Keeps changes in the staging area



✅ Move back and unstage the changes:

```

git reset --mixed <commit-id>   # default

```



* Removes the commit
* Moves changes to the working directory (not staged)



✅ Completely discard everything:

```

git reset --hard <commit-id>

```

* Removes the commit
* Deletes all changes



🎯 These are used when commits already exist.





✅ 2. When the file is only in the STAGING AREA (not yet committed)



If you ran git add but haven’t committed yet:

✅ Unstage the file:



```

git reset HEAD <file>



```

or simply

```

git reset

```



* File moves from staging back to working directory
* Your changes are still in the code — just not staged



🎯 Used when you added something by mistake.



✅ So the answer:



`git reset` can be used in BOTH situations:



Scenario	How you use git reset

File is only staged	git reset HEAD <file> (unstage)

File is already committed	git reset --soft / --mixed / --hard



#### Reverting to a Previous HEAD with Hard Reset

```

git reset --hard HEAD@{1}

```

✅ What it does:

You are telling Git to take your entire project (working directory, staging area, and HEAD pointer) back to the state it was in one step ago — specifically to whatever HEAD@{1} refers to in the `reflog`.





✅ Breakdown:

`git reset` → move HEAD to another commit



`--hard `→ throw away any current changes in:

* working directory
* staging area



`HEAD@{1}` → the previous position of HEAD (as shown in git reflog)



✅ When to use it:

* If you made a mistake and want to undo your last commit + any changes
* If you ran a bad merge or reset and want to return to the previous state
* If your branch moved and you want to go back



⚠️ Warning:

--hard deletes uncommitted changes. After running this, your working directory will look exactly like it did at HEAD@{1}.









---



### Git reflog

`git reflog` is like Git’s history of where your HEAD has been — even if you moved, reset, or deleted things.





It shows a log of all actions that changed HEAD, such as:

* commits
* checkout
* resets
* rebases
* merges
* cherry-picks



Even if you reset or deleted a branch, reflog still remembers the commit so you can recover it.





---

### Git revert

`git revert` is used to undo a specific commit by creating a new commit that reverses the changes made in that earlier commit.It does NOT delete history — it adds a new “opposite” commit on top of the current one.



Use git revert when you want to undo a commit safely, especially when:

* The commit has already been pushed to a remote repo
* You're working on a shared project
* You don't want to change or rewrite history



Example Flow

You made a commit that broke something

You run:

```

git revert <bad-commit>

```



* Git opens an editor for the commit message
* After saving, a new commit is created that cancels the old one





##### ✅ Key Difference from git reset

Command	Affects History?	Deletes commits?	Safe for shared repos?

git reset	YES (rewrites)	Can delete		❌ No

git revert	NO (adds new)	No deletion		✅ Yes



---



#### Git init vs git clone

Use git init to start your own repo. Use git clone to copy someone else’s.

Core Difference (Short Version)

Command	When Used	Starts Empty?	Copies Existing Project?

git init	New project	✅ Yes	❌ No

git clone	Existing project	❌ No	✅ Yes



---

### Git remote add

When you create a project locally with git init, it has no connection to any remote repository (like GitHub or GitLab).



`git remote add` is used to link your local repo to a remote repo.



```

git remote add <name> <url>



git remote add origin https://github.com/user/repo.git

````



Here’s the deeper logic behind why “origin” is used and what it really means:Git needs a nickname for each remote

When you connect a local repo to a remote repo, Git doesn't store the full URL in every command. Instead, it assigns a short name (a label) to that URL.



Developers expect that: origin = the main remote repo (usually on GitHub).This avoids confusion when collaborating.



---

#### Git clone



`git clone <repository-url>`This creates a folder named project automatically and copies everything inside.





`git clone <repository-url> <folder-name>`This will clone into the folder specified instead of using the default name.



---



### Git remote -v

`git remote -v` shows the remotes linked to your local repository along with their URLs.



It tells you:

* Which remote(s) exist
* Their names (like origin)
* Whether each one is used for fetching or pushing





### Git push

send your local commits to a remote repository.



`git push <remote-name> <branch-name>`



`git push origin main`



Git pushes branches, not isolated commits.



To push a single commit:

* Create a branch at that commit → push it
* Or cherry-pick it onto a branch → push the branch





##### First-Time Push (after git init and commits)



If the branch doesn’t exist on the remote yet:

```

git push -u origin main

```

The `-u` (or `--set-upstream`) links your local branch to the remote branch, so next time you can just run:

```

git push



```



##### Why do we have to run git push -u origin main if we have already sshed the GitHub



When you SSH to GitHub, you are only telling Git:

➡️ "This is how I will authenticate when I connect to GitHub."



That means GitHub knows it’s really you when you try to interact with a repository (no need to type username/password each time).



But…



SSH ≠ Push



SSH handles authentication (who you are).



git push handles synchronization (what code to send).



So even though SSH is set up, Git still needs to know:



Which remote repo? (via git remote add origin <url>)



Which branch? (e.g., main, dev)



That’s why you run:



git push origin main





It says:

"Using SSH, send my local commits on main branch to the origin remote."



✅ Analogy:



SSH = your key to open the door of a house (GitHub).



git push = you deciding which items (commits) you want to carry into the house.



---



### What is an Access Token?



An access token is a secure alternative to using your password when connecting to a remote service like GitHub.



✅ In the context of Git and GitHub:



GitHub no longer allows you to use your account password for actions like:



git push



git pull



git clone (over HTTPS)



Instead, you must use either:



SSH keys ✅ (if you set that up), or



A Personal Access Token (PAT) ✅



✅ What an access token does:



It acts like a temporary password that gives your Git client permission to interact with your GitHub account or a repo.



You generate it from GitHub → then use it when Git asks for a password during HTTPS actions.



✅ Example (with HTTPS):

```

git clone https://github.com/user/repo.git

```



If Git asks:



Username: your\_github\_username

Password: <ENTER TOKEN HERE, NOT YOUR REAL PASSWORD>



✅ Why use tokens instead of passwords?



Safer



Can limit permissions



Can revoke anytime



Required by GitHub since 2021



If you're using SSH, you don’t need a token. But if you're using HTTPS, you do.





---

### Git remote remove

git remote remove origin deletes the connection between your local repository and the remote named origin.



When to use it:

* You added the wrong remote URL
* You want to connect to a different GitHub repo
* You cloned from one repo and want to push to another



---

If you really want everything to be “origin”…



You’d have to remove one before adding another, meaning only one can exist at a time:



git remote remove origin

git remote add origin <new-url>





But that defeats the whole purpose of having multiple remotes.

---

Your remote names are local only — not shared.



When anyone clones a repo, Git always calls the remote origin by default.



They won’t get the remote name your local system has unless they manually rename or add it themselves.



---





#### To rename your remote\[git remote rename origin backup]

```

git remote rename <old\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_name> <new\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_name>



```



---

### Git Fetch

`git fetch` — download updates to your local repo without merging

`git fetch <remote-name>`





---

#### Git Pull

git pull — download and merge

git pull <remote-name> <branch-name>





Example:

```

git pull origin main



```



* First does git fetch (download)
* Then merges the changes into your current branch
* Your working directory is updated automatically





##### Some git pull flags

Command			What it does

git pull --no-ff	Creates merge commit even when fast-forward is possible

git pull --ff-only	Only fast-forward; stops if merge is needed

git pull --merge	Forces a merge (default in many cases)

git pull --no-commit	Stops before committing merge

git pull --rebase	Rebases instead of merging







---

#### Why you need to fetch or pull before you push

it’s generally recommended to fetch or pull before pushing, and here’s why:



✅ Why



Avoid conflicts:

If someone else pushed commits to the remote branch after your last pull, your push will be rejected. Fetching/pulling first ensures you see and integrate those commits.



Keep your branch up to date:

Your local branch reflects the latest state of the remote, so you don’t accidentally overwrite others’ work.



Safe workflow:



git fetch → inspect remote changes



git merge or git rebase → integrate changes



git push → send your commits



---



#### Difference Between Merge and Rebase



Feature		Merge				Rebase

History		Preserves branch structure	Linear history(rewrites)

Merge commit	Creates a merge commit		No merge commit

Conflicts	Resolved once at merge		Resolved per commit

Readability	Can get messy with many branches Cleaner, straight-line history

Use case	Combine branches, collaboration	Update feature branch, clean history   Caution	Safe for shared branches	Avoid rebasing shared branches



Merge = keeps branch history intact, may create merge commits.



Rebase = moves your commits on top of another branch, creating a linear history.



Rebase rewrites commit history; merge does not.

---



git merge --squash lets you combine all the changes from another branch into your current branch as a single commit, instead of keeping the full commit history.



✅ What it does (in simple terms)



It brings in all the changes from another branch…

BUT it does NOT create a merge commit.

Instead, it stages all changes so you can create one clean commit yourself.



Use --squash when:

* You want a clean history.
* The feature branch has many small “WIP” commits.
* You don’t want the individual commit history merged in.

---



### Fast-Forward Merge (Summary)



A fast-forward merge happens when the target branch has not diverged from the source branch. Git doesn’t create a merge commit — it simply moves the branch pointer forward to the latest commit.



Example:

```

main → A → B



feature → A → B → C → D

```

If you merge feature into main, Git just advances main to D. No extra commit.



Key points:



Clean, linear history

No merge commit

Only works when there are no new commits on the target branch after branching off

Command to force a merge commit instead: git merge --no-ff branchname`





Nothing extra is created. Git just updates the pointer of main to point to commit C. That is the entire idea of a fast-forward merge.

---



### Here is what happens when we use the --no-ff flag



--no-ff gives you a separate merge commit, which:



✔ Keeps the feature work grouped

✔ Shows a clear merge point

✔ Useful in team collaboration / PR workflows



---

### Merge fastforward vs no ff



Case			Command used		Result

Fast-forward allowed	git merge feature	Pointer moves, no merge commit

Force a merge commit	git merge --no-ff feature	Git creates a merge commit



In a fast-forward merge, no merge commit is created, so there’s no clear record that a merge happened.

This makes it harder to:



See where the merge happened



Track which commits came from the feature branch



Undo or revert a merge as a single unit



#### What if both branches have new commits

If both branches have new commits, Git cannot do a fast-forward. It must create a merge commit, even if you don’t use --no-ff.





---

#### Git Stash

git stash lets you save your uncommitted changes temporarily without committing them — so you can switch branches or pull updates safely, and then come back to your work later.



Imagine this:



You're working on a file, you've made changes, but you're not ready to commit yet. Then:



You need to switch to another branch, OR



You need to pull updates, OR



Someone asks you to fix something quickly elsewhere.



Git won’t let you switch branches if you have uncommitted changes that might conflict.

This is where git stash comes in.



Saves your changes



It takes:



Modified tracked files



Staged changes



…and stores them away in a temporary “stash stack”, then resets your working directory to a clean state.



✅ Later, you can restore them.





Command	What it Does	When to Use

git stash	Saves uncommitted changes (tracked files) and cleans your working directory	When you need to switch branches but don’t want to commit yet

git stash list	Shows all saved stashes	To see what you’ve stashed before

git stash pop	Applies the most recent stash and removes it from stash list	When you're ready to continue working on stashed changes

git stash apply	Applies a stash but keeps it in the list	If you might reuse it or apply to multiple branches

git stash drop	Deletes a specific stash entry	To clean up stash list manually

git stash clear	Removes all stashes	When you're sure you don’t need any of them

---



#### .gitignore

What is .gitignore?



A .gitignore file tells Git which files or folders it should NOT track.

Anything listed there will be ignored by Git — it won’t show up in git status, won’t be added, and won’t be committed.





✅ Why use it?



To prevent committing:



Temporary files



Credentials/secrets



Build/output files



IDE/editor configs



Logs, caches, etc.



The .gitignore file must be in the root of your project (or any folder you want rules in).



If a file was already tracked before adding it to .gitignore, Git will still track it unless you remove it with:

`git rm --cached <file>`



---



#### Git can't track empty folders

 It only tracks files.So if you create a directory with nothing inside, Git ignores it automatically.



To make Git track that directory, people usually add a placeholder file inside it. Common ones are:



.gitkeep

.gitignore





These files don’t do anything by themselves — they just make the folder non-empty so Git can include it in commits.



So your statement is accurate when clarified as:



Git does not track directories unless there is at least one file inside (like .gitkeep).



---



#### Fork vs Git clone



Fork is a copy of someone else’s repository on your GitHub account, used to contribute without affecting the original.



Git clone creates a local copy of a repository on your computer so you can work on it.



You typically fork a repo, then clone your fork locally to make changes.



After committing and pushing to your fork, you can submit a pull request to the original repository.



Fork lives on the remote server; clone lives on your local machine.



---

#### GitHub Actions

GitHub Actions is a CI/CD (Continuous Integration / Continuous Deployment) tool built into GitHub that lets you automate tasks in your repository.

---

#### Git Tag

A tag is a label attached to a specific commit to mark an important point in the repository’s history.



You can think of it like bookmarking a commit so you can quickly reference or return to it.



##### Why it's useful?



1. Easy reference to a commit

Instead of using a long commit hash, a tag gives it a readable name.



2\. Deployment and rollback

You can deploy from a tag or roll back to a tagged version easily.



3\. Works well with CI/CD pipelines

Pipelines can trigger based on tags (e.g., deploy only when a version tag is created).



4\. Versioning software

Tags are commonly used to mark releases like:



v1.0.0

v2.1.3





##### Two types of tags



1. Lightweight tag

Just a simple label pointing to a commit.



git tag v1.0.0(This is semantic versioning.MAJOR.MINOR.PATCH (like 2.4.1) — where you increase the numbers based on the type of change: breaking changes bump MAJOR, new features bump MINOR, and bug fixes bump PATCH.)





2\. Annotated tag

Includes a message, tagger name, and date.



git tag -a v1.0.0 -m "First release"





`git tag` or `git tag --list` shows the tags in your local repo.



`git push origin --tags` sends all those local tags to the remote.



`git push origin <tag name>` sends tag to the remote



`git tag -d <tagname>` deletes a local tag — it removes the tag from your machine but does not touch the remote copy unless you delete it separately.



`git tag <tag name>` tags the latest commit in the current repo. If you want to tag a specific commit, you'd add the commit ID:



`git tag v1.0.0 3f5a8c2`



---



#### How to fork a repository on GitHub



To fork a repository on GitHub, follow these steps:



* Go to the repository page you want to fork (on GitHub).
* In the top-right corner, click the “Fork” button.
* Choose your GitHub account (or organization) as the destination.
* GitHub creates a copy of that repo under your account — that’s your fork.

If you want to work on it locally after forking:

```

git clone <your-fork-url>



```

That’s it. Fork = copy to your GitHub, clone = copy to your local.



---

#### Proposing changes from a fork

You do that by creating a pull request (PR) from your fork back to the original repo.

After forking and cloning, you make your changes, commit and push them to your fork, then go to GitHub and click “Pull Request” to propose those changes to the original repository.



If you’re already a collaborator on a repository, you can push changes directly without approval. If you’re not a collaborator and you contribute through a fork, your changes must be reviewed and approved through a pull request before they can be merged.

---



You can clone any public repo without a username or password, but if you try to push changes to a repo you don’t own or you're not a collaborator on, Git will require authentication — either SSH access or a personal access token (PAT). And if you don't have permission, the push will still be denied even if you enter credentials.



---

### Branch Protection

Branch protection = settings that stop direct, unsafe changes to important branches (usually main or master). It forces contributors to follow certain rules before code can land there.



Why does Branch Protection Matter?

Prevents:

* Accidental override of production code
* Unreviewed or failing changes
* Force-push history rewrites
* Unauthorized commits



How to set up a protected branch (GitHub)



Go to the repository on GitHub.



Click Settings.



In the left sidebar, select Branches.



Under "Branch protection rules," click Add rule.



Set the branch name or pattern (e.g., main or release/\*).



Enable the options you need (examples below).



Save.



Key rule options



You toggle any of these inside the rule:



✅ Require a pull request before merging



Blocks direct git push to the branch.



Optionally specify number of required approvals.



✅ Require status checks to pass



Pick which checks must succeed (CI pipelines).



Can force branch to be up-to-date with main before merging.



✅ Require approvals



Define minimum reviewer approvals (e.g., 1 or 2).



Optionally dismiss approvals when new commits are added.



✅ Require signed commits



Enforces GPG-signed commits only.



✅ Prevent force pushes



Stops git push --force on that branch.



✅ Prevent branch deletion



Useful for main, develop, etc.



✅ Restrict who can push



Add specific people, teams, or apps that bypass rules.



✅ Allow admins to bypass (optional)



You decide whether admins stick to rules or can override.



---



#### Add collaborators or team members



This gives people access to the repository in general.



For personal repos (not organization):



Go to the repo



Click Settings → Collaborators



Click Add people



Enter their GitHub username



Choose their permission level:



* Read – can only view
* Triage – can view + manage issues/PRs (no push)
* Write – can push to unprotected branches
* Maintain
* Admin – full control



They get an email invitation.



For organization repos:



Add users to a team



Assign the team to the repo with a permission level



2\. Combine with branch protection rules



Once people have access, branch protection rules dictate what they can or cannot do on specific branches.



Example:



You added someone with Write access.



If main is protected with “Require pull request,” they cannot push directly.



They must create a feature branch and open a PR.



---



#### How to create and test ssh key



Here is the full process for GitHub SSH keys: generate, add, and test.



1\. Check if you already have a key



Run in your terminal:



ls ~/.ssh





Look for id\_rsa, id\_ed25519, or similar.



If none exist, generate one.



2\. Generate SSH key (recommended: ED25519)

ssh-keygen -t ed25519 -C "your\_email@example.com"





If ED25519 is not supported:



ssh-keygen -t rsa -b 4096 -C "your\_email@example.com"





Press Enter to accept defaults. Optionally set a passphrase.





Copy the public key

cat ~/.ssh/id\_ed25519.pub





Copy the full output.



6\. Add to GitHub



Go to GitHub



Click your profile → Settings



Left sidebar: SSH and GPG keys



Click New SSH key



Title: something descriptive (e.g. “laptop”)



Key type: Authentication



Paste the key



Save



7\. Test connection



Run:

```

ssh -T git@github.com



```

Possible responses:



First time:



The authenticity of host 'github.com'... Are you sure you want to continue connecting (yes/no)?





Type:



yes





Then success message:



Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.





That confirms SSH works.



---

### Issues I had during class work

When I run git push, it kept asking me for my password. When I entered it I got an authentication failure error. How I solved this issue was in the following steps bellow:





1. *I run git remote -v and I realized that the the url uses HTTPS. I wanted SSH so I don't get asked for the password. I run this: `git remote set-url origin git@github.com:women-techsters-fellowship/wtf-repo.git`. This was to update the remote url.*



Also, I was not able to commit my newly created branch at first but then I realized that I had to run git push -u origin <branch> to commit new branches.-u is shorthand for --set-upstream. It establishes the remote branch as the upstream for your local branch. This saves you typing the remote and branch name on subsequent pushes and pulls.



2. *I also deleted some files in my working repo but I didn't commit those changes. I realized that I had to commit those changes so it reflects in the remote.*







