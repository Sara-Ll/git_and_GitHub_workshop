---
title: 'Tracking our files with git'
teaching: 10
exercises: 5
---

:::::::::::::::::::::::::::::::::::::: questions 

- How to track your files with `git`?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Track the files with `git`
- Explain the framework and working mechanism of `git` repositories

::::::::::::::::::::::::::::::::::::::::::::::::

## Tracking our files

Let's follow the hint from `git status` to add our files to `git` for tracking their changes.

:::::::::::::::::::::::: challenge

### Exercise

1. Add the 'english.txt' file for tracking with `git`.

2. Check the status of the local git repository. Is there an additional step to track the file with `git`?

3. Do the same with the script 'greetings.py'.

4. Check the status of the local git repository.

::::::::::::::::::::: hint

### Hints

How is the name of the section where the 'english.txt' file appears after doing `git add`? 

Is there a `git` command that can help here to finish tracking the changes? See `git -h`.


:::::::::::::::::::::::::::::


:::::::::::::::::::::::::: solution

### Solution

1. Add the 'english.txt' file for tracking with `git`.

```sh
git add english.txt
```

2. Check the status of the local git repository. Is there an additional step to track the file with `git`?

```sh
git status
```

Output

```
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   english.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	greetings.py

```

The 'english.txt' file appears now in the section "Changes to be committed".

We need to commit the added file to finish tracking it with `git`. If we see the `git -h`, there is a command for commit a change:

```sh
git commit -m "Add english.txt file"
```

Output

```
[main (root-commit) bf0b837] Add english.txt file
 1 file changed, 1 insertion(+)
 create mode 100644 english.txt
```

The option `-m` is equivalent to `--message` and it needs to be follow by a short sentence indicating the change we are tracking. 

Checking again the status of our repository shows that only the 'greetings.py' script is missing to track.

```sh
git status
```

Output

```
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	greetings.py

nothing added to commit but untracked files present (use "git add" to track)
```

3. Do the same with the script 'greetings.py'.

```sh
git add greetings.py
git commit -m "Add greetings.py script"
```

4. Check the status of the local git repository.

Now we should have no more files or changes to track.

```sh
git status
```

Output

```
On branch main
nothing to commit, working tree clean
```

:::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::



## The framework and working mechanism of `git`

### Explanation with climbing analogy

Let's go back to the climbing analogy to further understand the difference between `git add` and `git commit`.

Once, we have check the climbing routes, we decide to go for one, we tie the rope to our harness, check our belayer partner and start climbing. We start doing moves, grabbing to holds with our hands, stepping onto ledges of the wall. We are adding moves in a sequence as we climb: `git add <movement`. It is like making changes to our files and adding them for tracking. 

![Adding movements while you climb: `git add` ([Artwork][AH_artwork_git] by [Allison Horst][AH_twitter])](episodes/fig/AH-gitAdd.png)

The route is quite long, so we probably don't want to fall all way down to the ground. We want to secure our progress after several movements by clipping our rope in a quickdraw in the wall: `git commit -m "First section of the route"`. It is like committing our files to secure the changes we have done until some point.

![Secure your movements (file changes) by clipping (`git commit`) ([Artwork][AH_artwork_git] by [Allison Horst][AH_twitter])](episodes/fig/AH-gitCommitClick.png)

If we slip and fall, we don't loose all our progress but we are back to our last clip (commit). The same way as if we mess it up with our files or scripts and broke our code, we can go back to our last commit where everything was working fine. 

![Fall only to the last clip (commit) ([Artwork][AH_artwork_git] by [Allison Horst][AH_twitter])](episodes/fig/AH-gitCommitFall.png)

:::::::::::::::::::::::: callout

Make sure to often track your changes to avoid having to redo many files or lines that were working fine. 

:::::::::::::::::::::::::::::::::


### More technical explanation 

Let's explain the commands `git add` and `git commit` in a more technical way. 

`git` has two areas:
- **staging area** where files are added with `git add` and get prepared to be committed.
- **local repository** where files are saved with `git commit` and the progress is secured allowing us to go back to this version of the files in a later point.

![Staging area and local git repository. Source: [Software Carpentry][SC_git])](episodes/fig/SC-git-staging-area.svg)



## Additional useful tricks 

### `git add`

If we have a bunch of files to add and don't want to write them one by one we can write with patterns or even use `git add .` to add all of them. 

However, we should use patterns and `git add .` with caution, as we can end up including files that we don't want to add at that point. It is then useful to use the option `--dry-run` to have a preview of the files that are going to be added before really adding them to the staging area:

```sh
git add . --dry-run
```

Output

```
add 'english.txt'
add 'greetings.py'
```


### '.gitignore'

There might be some files that we don't want to track at all. We can make `git` to ignore these files, so they are not listed all the time as untracked files. To do this, we need to create a _'.gitignore'_ file that contains files and folders we don't want to include in our git repository.

:::::::::::::::::::::::: challenge

### Exercise

1. Create a file name 'notes.txt' and make `git` to ignore it.

2. Create a folder name 'data' with a couple of files: 'data_A.txt', 'data_B.txt', and make `git` to ignore them.


:::::::::::::::::::::::::: solution

### Solution

1. Create a file name 'notes.txt' and make `git` to ignore it.

```sh
# Create 'notes.txt' file
touch notes.txt

# Check repository status
git status
```

Output

```
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	notes.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Make `git` to ignore tracking this file.

Create a '.gitignore' file (`nano .gitignore`) with the name of the file on it:

```
notes.txt
```

Check repository status:

```sh
git status
```

Output

```
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	.gitignore

nothing added to commit but untracked files present (use "git add" to track)
```

Now, the 'notes.txt' file does not appear in "Untracked files".

The .gitignore file appears as an untracked file and we can add it to our repository:

```sh
git add .gitignore
git commit -m "Add .gitignore file"
```

2. Create a folder name 'data' with a couple of files: 'data_A.txt', 'data_B.txt', and make `git` to ignore them.

```sh
mkdir data
touch data/data_A.txt data/data_B.txt
```

```sh
git status
```

Output
```
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	data/

nothing added to commit but untracked files present (use "git add" to track)
```

.gitignore
```
notes.txt
data/
```

When doing `git status`, .gitignore file appears again as an untracked file as we have modified it. We can add the changes to our repository:

```sh
git add .gitignore
git commit -m "Ignore data folder"
```

\* Patterns with asterisks can also be written into the .gitignore file (e.g.: *.png to avoid tracking any image with the .png extension)

:::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::


### `git commit` 

We sometimes need to include more information of the additions and changes to our files in the commit message. Indeed, it is a good strategy to have informative messages in our commits, because it will make easier to understand the history of our changes and to find in which commit are the changes we are looking for if we need to go back.

For example, in the case of the climbing: `git commit -m "First section of the route"`, the message is not really informative. We might want to include the specifics movements. Luckily, `git commit` allows us to make commit messages with more than one line.

If we don't include the option `-m` with `git commit`, when pressing enter, the text editor that we set it up for git (see [configuration of git][configuring-git.Rmd]) will open. There, we can write several lines, for example:

```
First section of the route

Left hand to big hold, cross right hand, left foot to the small ledge at the knee height.

Other notes: Clean well the climbing shoes before starting to climb, or you will slip. 
```


::::::::::::::::::::::::::::::::::::: keypoints 

- `git add <file> [--dry-run]` to add file/s to the staging area, use the `--dry-run` option to have a preview of the files to add before adding them.

- `git commit [-m "MESSAGE"]` to record chagnes to the repository, use the `-m` option to include a short message

::::::::::::::::::::::::::::::::::::::::::::::::

