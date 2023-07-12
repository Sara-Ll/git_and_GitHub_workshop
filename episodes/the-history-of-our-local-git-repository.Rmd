---
title: 'The history of our local git repository'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you see the history of the local `git` repository?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Check out the history of the local `git` repository
- Inspect the changes of previous commits
- Visualise previous versions of files

::::::::::::::::::::::::::::::::::::::::::::::::

## The history of the local `git` repository

::::::::::::::::::::::::::: challenge

Can you find a `git` command to check the commits we have done until now?

:::::::::::::::: hint

Check the possible `git` commands with `git -h`. 

:::::::::::::::::::::

::::::::::::::: solution

```sh
git log
```

Output

```
commit f41333befb44c0ea46952b9ddeb00aeb85e96bf0 (HEAD -> main)
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 23:14:20 2023 +0100

    Change english greeting to a shorter one

commit 77d1ea1918c02ecb2a302804c90f9d5011d5eedf
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 21:14:15 2023 +0100

    Ignore data folder

commit 745383c7ffc2c131392b657b9d1052a0894b8b4a
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 21:10:03 2023 +0100

    Add .gitignore file

commit 4f8ab7d267b5deab26f18bcd71ec613f0d43e7f4
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 19:39:50 2023 +0100

    Add greetings.py script

commit bf0b837d8a43b407e1536c9654c51e063cfe8456
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 19:37:40 2023 +0100

    Add english.txt file
```
::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::


Checking the history of our commits gives the following information for each commit we did in our repository:

```
commit f41333befb44c0ea46952b9ddeb00aeb85e96bf0 (HEAD -> main)
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 23:14:20 2023 +0100

    Change english greeting to a shorter one
```

1. A commit hash: a string of numbers and letters that uniquely identifies a specific commit. 

::::::::::::::::::: callout

Commit hash are important to refer to a specific commit and to check the files of that previous version.

Normally, it is enough to refer to the fist 5 or 6 elements of the hash, as it is very unlikely that two commit hashes of our repository have an identical start.

:::::::::::::::::::::::::::

2. Name and email (the ones we configure at the beginning, see [here](configuring-git.Rmd)). If it is a collaborative project where several people is making commits, it helps to keep track of who made each specific change.

3. Date and time of the commit.

4. The message of the commit.


Sometimes, we don't need to have all the information of each commit and so many lines of output per commit (especially when we have many commits in the history of our repository). We can have a shorter version of the history of our repository with just one line per commit by adding the option `--oneline`.

Output

```
f41333b (HEAD -> main) Change english greeting to a shorter one
77d1ea1 Ignore data folder
745383c Add .gitignore file
4f8ab7d Add greetings.py script
bf0b837 Add english.txt file
```

Here, we get the first 7 characters of the commit hash followed by the commit message.

:::::::: callout

You can see here the importance of providing meaningful messages to each commit, so that in case we need to go back and look for a specific change we did, we can easily locate the commit.

::::::::::::::::


::::::::: discussion

You might have notice the `(HEAD -> main)` string that appears in the history of our repository next to the last commit we did. We will explain what this means in our episode about branches (include ref here later).

::::::::::::::::::


## Inspect the changes and files of past commits

::::::::::::::::::::::::::: challenge

## Exercise

1. Show the difference between the last commit and the previous file version. 

2. Can you see the differences of more past commits?

3. Visualise the first version of the 'english.txt' file.

:::::::::::::::: hint

Check the possible `git` commands with `git -h`. (Notice the word I use in the exercise ;) )

:::::::::::::::::::::

::::::::::::::: solution

1. Show the difference between the last commit and the previous file version. 

```sh
git show
```

Output

```
commit f41333befb44c0ea46952b9ddeb00aeb85e96bf0 (HEAD -> main)
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 23:14:20 2023 +0100

    Change english greeting to a shorter one

diff --git a/english.txt b/english.txt
index 10ddd6d..663adb0 100644
--- a/english.txt
+++ b/english.txt
@@ -1 +1 @@
-Hello!
+Hi!
```

2. Can you see the differences of more past commits?

Yes, we can give a commit hash to `git show` command. (Make sure to use your own commit hash)

```sh
git show 77d1ea1
```

Output

```
commit 77d1ea1918c02ecb2a302804c90f9d5011d5eedf
Author: Sara Llorente-Armijo <sl6820@ic.ac.uk>
Date:   Sun Jul 9 21:14:15 2023 +0100

    Ignore data folder

diff --git a/.gitignore b/.gitignore
index 99ed0d4..ea10e48 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1 +1,2 @@
 notes.txt
+data/
```


3. Visualise the first version of the 'english.txt' file.

We can even visualise the previous version of a file by following the commit hash with two colons and the filename: `[<commit-hash>][:<file>]`

```sh
git show bf0b837:english.txt
```

Output

```
Hello!
```

This is different from our current 'english.txt' file as you can see (e.g., use `cat english.txt`)

```
Hi!
```
:::::: callout

N.B., this works just with plain text files, but no other files like word files. Or at least, it won't be a meaningful output.
::::::::::::::

::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- `git log [--oneline]` to show the history of the commits of the local `git` repository
- `git show [<commit-hash>][:<file>]` to show changes and past files

::::::::::::::::::::::::::::::::::::::::::::::::

