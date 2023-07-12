---
title: 'Creating branches'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you modify files in a repository while keeping the original files intact?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to use branches.

::::::::::::::::::::::::::::::::::::::::::::::::

## Creating branches

Sometimes you want to keep the original files in a repository intact, while:
- you try and test to add new features
- you fix bugs (without breaking the original code)
- you and your collaborators work on different parts of the code at the same time

Here, `git` becomes very handy, as you can create branches.

Let's understand a bit more how the branching works.

Does it sound familiar "On branch main" and "(HEAD -> main)"? We can see these messages when we run `git status` and `git log` commands.
in a repository.

By default, our work is commited on the `main` branch. 

![Main branch (Source: [The Turing Way](https://the-turing-way.netlify.app/reproducible-research/vcs.html)](fig/TW-main-branch.png)

::::::::::::::::: callout

N.B., originally the main branch was called `master`. However, the term `master` has been replaced by `main` to be less offensive, see [here](https://www.theserverside.com/feature/Why-GitHub-renamed-its-master-branch-to-main) for a longer explanation.

::::::::::::::::::::::::::

We can create a new branch to work on a new feature or to fix a bug that might go in parallel with the main branch and when our new feature is ready or the bug is fixed, we can merge the new branch with the main branch.

![Create a new branch parallel to the main branch (Source: [The Turing Way](https://the-turing-way.netlify.app/reproducible-research/vcs.html)](fig/TW-one-branch.png)


Let's try this out! 


:::::::::::::::::::::::::::::::::::::: challenge

1. Let's add another language for our `greeetings.py` script. But let's do this in a new branch. Create a new branch and switch to it.

2. Let's add the new language. Create a text file for the language with the greeting in that language and modify the `greetings.py` script accordingly.

3. Add the new files to the staging area and commit them one by one (make sure to be on the new branch).

4. Check the status and the history of the repository.

5. Check the files of your working directory. Now, change back to the `main` branch, check the files and run the `greetings.py` script asking for a greeting in the new language. What happens?


::::::::::::::::::::::::: solution

1. Let's add another language for our `greeetings.py` script. But let's do this in a new branch. Create a new branch and switch to it.

First, we can check the branch we are currently on with `git branch`:

```sh
git branch
```

Output

```
* main
```

We can see that we are on the `main` branch. Let's create a new branch called 'new_language':

```sh
git branch new_language
git branch
```

Output

```
* main
  new_language
```

The command `git branch` shows that there are two branches now, and it indicates with an asterisk the current branch we are on.

Let's switch to the new branch:

```sh
git checkout new_language
```

Output

```
Switched to branch 'new_language'
```

```sh
git branch
```

Output

```
  main
* new_language
```

Now, we can see that we are on the `new_language` branch.

We can also create a new branch and switch to it at once with the `-b` option of `git checkout`:

```sh
git checkout -b new_language
```

Output

```
Switched to a new branch 'new_language'
```

:::::::::::::: callout

`git log` also shows the branches and points to the branch we are currently on with `HEAD ->`:

```sh
git log --oneline
```

Output

```
93c425c (HEAD -> new_language, main) Revert "Change english greeting to a more informal one"
183b4a4 Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

:::::::::::::::::::::::::::


2. Let's add the new language. Create a text file for the language with the greeting in that language and modify the `greetings.py` script accordingly.

Let's add spanish:

spanish.txt

```
Hola
```

Let's modify the `greetings.py` script to take more than one language:

greeetings.py

```python

# Greetings script

language = input("Language?: ")

filename = language + ".txt"

with open(filename, "r") as file:
   greeting = file.read()
   print(greeting)
```

Test the script:

```sh
python3 greetings.py
```

Output

```
Language?: spanish
Hola
```


3. Add the new files to the staging area and commit them one by one (make sure to be on the new branch).

```sh
git add spanish.txt
git commit -m "Add spanish language"

git add greetings.py
git commit -m "Modify greetings.py script to take more than one language"
```


4. Check the status and the history of the repository.

```sh
git status
```

Output

```
On branch new_language
nothing to commit, working tree clean
```

```sh
git log --oneline
```

Output

```
c597724 (HEAD -> new_language) Modify greetings.py script to take more than one language
4ce45c2 Add spanish language
93c425c (main) Revert "Change english greeting to a more informal one"
183b4a4 Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

We can see now that the `new_language` branch has two commits, and the `main` branch is behind these commits, in the last commit we did on the `main` branch.

5. Check the files in your working directory. Now, change back to the `main` branch, check the files and run the `greetings.py` script asking for a greeting in the new language. What happens?

Check the files in your working directory:

```sh
ls
```

Output

```
data         english.txt  greetings.py notes.txt    spanish.txt
```

Change back to the `main` branch:

```sh
git checkout main
```

Output

```
Switched to branch 'main'
```

Check the files again in your working directory:

```sh
ls
```

Output

```
data         english.txt  greetings.py notes.txt
```

Try to run the `greetings.py` script asking for a greeting in the new language:

```sh
python3 greetings.py
```

Output

```
Language?: spanish
Hi!

```

What happens?

The main branch doesn't have the new language text file ('spanish.txt') nor the modified script ('greetings.py'). 

You can see that it stills works as the old version without having the implemented changes to add the new language.


:::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::


## Merging branches

Now that we have implemented the new language in the `new_language` branch and the script works, we want to merge it into the `main` branch.

:::::::::::::::::::::::::::::::::::::: challenge

1. Before merging the `new_language` branch into the `main` branch, let's make a change in the `main` branch. Change the title of the `greeetings.py` script, add and commit the change on the `main` branch.

2. Check the history of the repository. Do you miss something?

3. Merge the `new_language` branch into the `main` branch.

4. Check the history of the repository.

5. Clean the `new_language` branch.


:::::::::::::::::::::::: solution


1. Before merging the `new_language` branch into the `main` branch, let's make a change in the `main` branch. Change the title of the `greeetings.py` script. Add and commit the change on the `main` branch.

First, make sure to be on the `main` branch:

```sh
git branch
```

Output

```
* main
  new_language
```

If you are not on the `main` branch, switch to it:

```sh
git checkout main
```

Output

```
Switched to branch 'main'
```

Now, let's change the title of the `greetings.py` script:

greetings.py

```python
# Script for greetings in different languages

language = input("Language?: ")

with open("english.txt", "r") as file:
    greeting = file.read()
    print(greeting)
```

Add and commit the change on the `main` branch:

```sh
git add greetings.py
git commit -m "Change title of greetings.py script"
```

2. Check the history of the repository. Do you miss something?

```sh
git log --oneline
```

Output

```
4bbb246 (HEAD -> main) Change title of greetings.py script
93c425c Revert "Change english greeting to a more informal one"
183b4a4 Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

The `new_language` branch is not in the history of the `main` branch.

Is there a way to see the history of the `new_language` branch from the `main` branch?

Yes, we can use the `--all` flag:

```sh
git log --oneline --all
```

Output

```
4bbb246 (HEAD -> main) Change title of greetings.py script
c597724 (new_language) Modify greetings.py script to take more than one language
4ce45c2 Add spanish language
93c425c Revert "Change english greeting to a more informal one"
183b4a4 Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

However, this representation is a bit confusing. We don't know which commits belong to which branch.

We can use the `--graph` flag to see the history of the repository in a more visual way including a representation of the branches:

```sh
git log --oneline --all --graph
```

Output

```
* 4bbb246 (HEAD -> main) Change title of greetings.py script
| * c597724 (new_language) Modify greetings.py script to take more than one language
| * 4ce45c2 Add spanish language
|/  
* 93c425c Revert "Change english greeting to a more informal one"
* 183b4a4 Change english greeting to a more informal one
* f41333b Change english greeting to a shorter one
* 77d1ea1 Ignore data folder
* 745383c Add .gitignore file
* 4f8ab7d Add greetings.py script
* bf0b837 Add english.txt file
```


3. Merge the `new_language` branch into the `main` branch.

Make sure to be on the `main` branch, and merge the `new_language` branch into the `main` branch with the command: `git merge <branch_to_merge>`.

```sh
git merge --no-edit new_language
```

Output

```
Auto-merging greetings.py
Merge made by the 'ort' strategy.
 greetings.py | 8 +++++---
 spanish.txt  | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 spanish.txt
```

4. Check the history of the repository.

```sh
git log --oneline --all --graph
```

Output

```
*   55792b8 (HEAD -> main) Merge branch 'new_language'
|\  
| * c597724 (new_language) Modify greetings.py script to take more than one language
| * 4ce45c2 Add spanish language
* | 4bbb246 Change title of greetings.py script
|/  
* 93c425c Revert "Change english greeting to a more informal one"
* 183b4a4 Change english greeting to a more informal one
* f41333b Change english greeting to a shorter one
* 77d1ea1 Ignore data folder
* 745383c Add .gitignore file
* 4f8ab7d Add greetings.py script
* bf0b837 Add english.txt file
```

We can see the representation of the merging of the `new_language` branch into the `main` branch.


5. Clean the `new_language` branch.

It is a good practice to delete branches that are not needed anymore.

```sh
git branch -d new_language
```

Output

```
Deleted branch new_language (was c597724).
```

If we check branches with `git branch` or the history with `git log --oneline --all --graph`, we can see that the `new_language` branch is not there anymore.


::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::


## Branches can get very complex

A `git` repository might have many branches when working to implement different features at the same time, especially when working in a team. Branches can even have sub-branches.

![Branches can become very complex. (Source: [The Turing Way](https://the-turing-way.netlify.app/reproducible-research/vcs/vcs-branching.png)](fig/TW-sub-branch.png)


As more complex the branching structure and more changes are happening at the same time, more coordination and good managing is needed. Otherwise, merging conflicts will most likely happen:

```
CONFLICT (content): Merge conflict in <file>
Automatic merge failed; fix conflicts and then commit the result.
```

For example, if a file is modified in two different branches in the same lines, `git` will not know which version to keep and will ask the user to solve the conflict.

![Merging conflict. Which line/s to keep? (Source: [The Software Carpentry](https://swcarpentry.github.io/git-novice/index.html))](fig/SC-merge-conflict.svg)


:::::::::::::: callout

## Solve your merging conflicts

Merge conflicts might be very annoying and time consuming to solve. 

![Annoying merging conflict. (Source: [Artwork by Allison Horst](https://allisonhorst.com/git-github))](fig/AH-gitHug.png)

It is recommended to avoid them as much as possible. However, if you encounter one, this ["choose your own adventure" guide](https://sethrobertson.github.io/GitFixUm/fixup.html) by [Seth Robertson](https://github.com/SethRobertson) might help you to solve it.

:::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: keypoints 

- `git branch [-d] [<new_branch_name]` to list, create or delete branches
- `git checkout <branch_name>` to switch to a branch
- `git checkout <commit_hash>` to go back to a past commit to check it out
- `git checkout -b <new_branch_name>` to create a new branch and switch to it at once
- `git merge <branch_to_merge>` to merge the specified branch into the current branch (usually main)

::::::::::::::::::::::::::::::::::::::::::::::::

