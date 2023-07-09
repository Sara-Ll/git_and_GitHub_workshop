---
title: 'Exploring the changes with git'
teaching: 5
exercises: 5
---

:::::::::::::::::::::::::::::::::::::: questions 

- How to see the changes in our files with `git`?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Demonstrate how to see the changes we made in our files

::::::::::::::::::::::::::::::::::::::::::::::::

## Exploring changes

:::::::::::::::::::::::::: challenge

1. Change "Hello!" in 'english.txt' by "Hi!".

2. Check difference with `git`.

3. Add changes of 'english.txt' (without committing)

4. Check difference. Can you see the difference? Is there an option to see the differences of a file in the staging area?

5. Commit change and see if any difference is detected. Why?

:::::::::::::::::: hint

### Hint

Check options in `git` with `git -h` to find a `git` command to show the differences.

Use `git <command> -h` to check the options of the specific command.

::::::::::::::::::::::::

::::::::::::::::::: solution

### Solution

1. Change "Hello!" in 'english.txt' by "Hi!".

Open file with a text editor in the local computer or in the terminal (e.g.: `nano english.txt`), and modify the line:

english.txt

```
Hi!
```


2. Check difference with `git`.

```sh
git diff
```

Output

```
diff --git a/english.txt b/english.txt
index 10ddd6d..663adb0 100644
--- a/english.txt
+++ b/english.txt
@@ -1 +1 @@
-Hello!
+Hi!
```

The output of `git diff` might be a bit complex to understand and even more, with more complex changes. 

Here, we can easily understand the 'english.txt' file has change from a version "a" to a version "b" where the word "Hello!" has been erased (indicated by the minus symbol: -) and the word "Hi!" has been added in its place (indicated by the plus symbol: +).


3. Add changes of 'english.txt' (without committing)

```sh
git add english.txt
```

4. Check difference. Can you see the difference? Is there an option to see the differences of a file in the staging area?

```sh
git diff
```

It does not give any output, as it does not find any difference between our local file and the file in the local git repository, which is already added to the staging area.

However, the file change has not been committed, so could we see the difference between the previous commited file and the changed file that is now in the staging area?

```sh
git diff --staged
```

Output

```
diff --git a/english.txt b/english.txt
index 10ddd6d..663adb0 100644
--- a/english.txt
+++ b/english.txt
@@ -1 +1 @@
-Hello!
+Hi!
```

The option `--staged` allows us to see the file changes that we have included in the staging area but not committed yet.


5. Commit change and see if any difference is detected. Why?

```sh
git commit -m "Change english greeting to a shorter one"
git diff
git diff --staged
```

Neither `git diff` or `git diff --staged` give any ouput. Why?

Because there is no files in our local folder or the git staging area that differ from the files in the git repository. 

:::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: keypoints 

- `git diff [--staged]` to see the differences between the files in the local git repository and our local files before or after adding them to the staging area.

::::::::::::::::::::::::::::::::::::::::::::::::

