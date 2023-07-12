---
title: 'Rewriting the history'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you discard changes?
- How do you restore a previous version of your file?
- How do you undo previous commits?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain which commands to use to discard or undo changes.

::::::::::::::::::::::::::::::::::::::::::::::::


## Discarding changes

Let's see how we can undo changes we made to our files in the local working directory or in the staging area.

:::::::::::::::::::::::::::::::: challenge

## Exercise

1. Change the greeting in 'english.txt' to a more informal one (e.g. 'Hey!'). Check the status and the change (difference).

2. Now that we think about it, the greeting looks too informal. Can you find a `git` command to go back to the previous version of the 'english.txt' file?  


:::::::::::::::::::::::: hint

Check the tip from `git status` to see which command you can use to go back to the previous version of the file.

:::::::::::::::::::::::::::::::

:::::::::::::::::::::::: solution

1. Change the greeting in 'english.txt' to a more informal one (e.g. 'Hey!'). Check the status and the change (difference).

english.txt
```
Hey!
```

Check the status of the repository
```sh
git status
```

Output
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   english.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Check the difference
```sh
git diff
```

Output

```
diff --git a/english.txt b/english.txt
index 663adb0..4c5477a 100644
--- a/english.txt
+++ b/english.txt
@@ -1 +1 @@
-Hi!
+Hey!
```

2. Now that we think about it, the greeting looks too informal. Can you find a `git` command to go back to the previous version of the 'english.txt' file?  

```sh
git restore english.txt
```

If we check now the 'english.txt' file (e.g., `cat english.txt`), we will see that the greeting is back to 'Hi!'.

::::::::::::::::: callout

Be careful when using `git restore` as none of the changes will be tracked by `git`, and therefore, we will not be able to recover them at a later point. 

In this example, it is easy to manually remake the change we did if we change our mind again. However, if we have many changes, it might be difficult to remember all of them.

:::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::: challenge

## Exercise

1. Change again the greeting in 'english.txt' to a more informal one (e.g. 'Hey!'), and this time add the file to the staging area. Check the status and the change (difference).

2. We regret the change again. Can we move the file from the staging area back to our local working directory?


:::::::::::::::::::::::: hint

Check the tip from `git status` to see which command you can use to move the file from the staging area back to the local working directory.

:::::::::::::::::::::::::::::::

:::::::::::::::::::::::: solution

1. Change again the greeting in 'english.txt' to a more informal one (e.g. 'Hey!'), and this time add the file to the staging area. Check the status and the change (difference).

english.txt
```
Hey!
```

Add the file to the staging area and check the status of the repository
```sh
git add english.txt
git status
```

Output
```
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   english.txt
```

Check the difference
```sh
git diff --staged
```

Output

```
diff --git a/english.txt b/english.txt
index 663adb0..4c5477a 100644
--- a/english.txt
+++ b/english.txt
@@ -1 +1 @@
-Hi!
+Hey!
```

::::::::::::::::: callout
Remember the difference between `git diff` and `git diff --staged`. See the lesson ["Exploring the changes with `git`"](exploring-the-changes-with-git.Rmd).

:::::::::::::::::::::::::::

2. We regret the change again. Can we move the file from the staging area back to our local working directory?

```sh
git restore --staged english.txt
```

If we check the status of the repository now, we will see that the file is not longer in the staging area. 

```sh
git status
```

Output
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   english.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

If we check the content of the file (e.g., `cat english.txt`), we will see that the greeting is still 'Hey!'. We could do `git restore english.txt` to go back to the previous version of the file with the greeting 'Hi!' as we did in the previous exercise.

::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::


## Undoing previous commits

Let's see now how we can undo changes when we have already committed them to the local `git` repository.

:::::::::::::::::::::::::::::::: challenge

## Exercise

1. Add and commit the change we did to the 'english.txt' file in the previous exercise (from 'Hi!' to 'Hey!'). Check the status and history of the repository.

2. We regret the change once more. Can we undo the previous commit without leaving any trace in the history of the repository? Apply the corresponding `git` command and check the status and the history of the repository.

3. Can you see some disadvantages to undoing commits without leaving any trace in the history of the repository?

4. Is there a way to undo the previous commit and leave a trace in the history of the repository?

:::::::::::::::::::::::: solution

1. Add and commit the change we did to the 'english.txt' file in the previous exercise (from 'Hi!' to 'Hey!'). Check the status and history of the repository.

```sh
git add english.txt
git commit -m "Change english greeting to a more informal one"
```

```
[main 07ad373] Change english greeting to a more informal one
 1 file changed, 1 insertion(+), 1 deletion(-)
```

```sh
git status
```

Output

```
On branch main
nothing to commit, working tree clean
```

```sh
git log --oneline
```

Output

```
07ad373 (HEAD -> main) Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```


2. We regret the change once more. Can we undo the previous commit without leaving any trace in the history of the repository?

```sh
git reset --soft HEAD^
```

```sh
git status
```

Output

```
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   english.txt
```
    
```sh
git log --oneline
```

Output

```
f41333b (HEAD -> main) Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

We can see that the last commit "Change english greeting to a more informal one" is not longer in the history of the repository. However, the changes are still in the staging area.


3. Can you see some disadvantages to undoing commits without leaving any trace in the history of the repository?

This approach is good to rewrite the commmit message or to add other files we might have forgotten to commit together.

::::::::::::: callout

However, we should avoid this `git reset --soft HEAD^` approach if we are working in a collaborative project and we have already pushed the commit to the remote repository (we will see this in a later section (put reference here)). If we do, we might cause problems as our collaborators might already be working in these versions of the files. 

:::::::::::::::::::::

4. Is there a way to undo the previous commit and leave a trace in the history of the repository?

Yes, we can use `git revert` to create a new commit which undoes the changes of the the specified commit and reflects this in the history of the repository.

First, we redo the commit and check the history.

```sh
git commit -m "Change english greeting to a more informal one"
git log --oneline
```

Output

```
183b4a4 (HEAD -> main) Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

Now, we revert the previous commit with `git revert --no-edit <commit-hash>`. Remember what the commit hash is (see the section ["The history of our local `git` repository"](the-history-of-our-local-git-repository.Rmd)).

```sh
git revert --no-edit 183b4a4
```

Output

```
[main 93c425c] Revert "Change english greeting to a more informal one"
 Date: Wed Jul 12 19:28:58 2023 +0100
 1 file changed, 1 insertion(+), 1 deletion(-)
```

Check the history. Is the reverted commit reflected in the history?

```sh
git log --oneline
```

Output

```
93c425c (HEAD -> main) Revert "Change english greeting to a more informal one"
183b4a4 Change english greeting to a more informal one
f41333b Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

Yes, the commit with the change to a more informal greeting is still in the history of the repository, and there is an additional commit (the last one) which undoes the changes of the previous commit.

If we check the content of the file (e.g., `cat english.txt`), we will see that the greeting is 'Hi!' again, and with `git status` we will see that there are no changes to commit.

::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: keypoints 

- `git restore [--staged] <file>` to discard changes in working directory or to unstage files
- `git reset --soft HEAD^` to remove the previous commit from the history
- `git revert [--no-edit] <commit-hash>` to create a new commit which undoes the changes of the the specified commit

::::::::::::::::::::::::::::::::::::::::::::::::

