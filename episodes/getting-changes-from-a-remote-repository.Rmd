---
title: 'Getting changes from a remote repository'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you keep update the remote and local repository?
- Can you get a local repository from a remote repository?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain `git` commands to synchronise local and remote repositories
- Demonstrate how to obtain a copy of a remote repository in your local computer

::::::::::::::::::::::::::::::::::::::::::::::::

## Pushing and pulling

We have now a remote repository of our local repository. Let's see how we can interact between the local and remote repositories and keep them synchronised.

![This nice schematic shows the `git` commands to interact between our working directory, local repository and remote repository to ensure the tracking of changes. (Source: [Artwork by Allison Horst][AH_artwork_git])](fig/AH-overviewGit2.png)

:::::::::::::::::::::::::::::::::::::::::::: challenge

## Exercise

1. Add a new language for our greetings.

2. Add and commit the changes to the local repository.

3. Check the status. Do you see something different from before?

4. Update the remote repository. 

::::::::::::::::::::::::: hint

The command `git status` will give you a hint of the command to use for updating the remote repository.

:::::::::::::::::::::::::::::::

:::::::::::::::::::::::::: solution  

1. Add a new language for our greetings.

swedish.txt
```
Hej!
```

Text greetings in Swedish:

```sh
python3 greetings.py
```

Output

```
Language?: swedish
Hej!
```


2. Add and commit the changes to the local repository.

```sh
git add swedish.txt
git commit -m "Add Swedish language"
```

3. Check the status. Do you see something different from before?

```sh
git status
```

Output

```
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

Now, between the indication of the branch we are on and the message to indicate that there is nothing to commit to our local repository, there is a couple of lines that tell us if our remote repository is up to date with our local repository. In this case, it is telling us that our local repository is one commit ahead of our remote repository, and the command to update the remote repository.

4. Update the remote repository.

```sh
git push
```

Output

```
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 307 bytes | 307.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:username/greetings.git
   1a2b3c4..5d6e7f8  main -> main
```

::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

We know now how to update the remote repository with the changes we have made in our local repository. 

Let's see know how to make changes directly in the remote repository and synchronise them with our local repository.


:::::::::::::::::::::::::::::::: challenge

## Exercise

1. Add another language directly in the remote repository (see hint if needed)

2. Check the status of the local repository.

3. Update the local repository with the changes in the remote repository.


::::::::::::::::::::::::: hint

You can add a new file directly in the remote repository by clicking on the `Add file` button and then `Create new file`.

:::::::::::::::::::::::::::::::


:::::::::::::::::::::::::: solution

1. Add another language directly in the remote repository (see hint if needed)

Go to the remote repository that we created in GitHub, click on the `Add file` button and then `Create new file`. 

Let's add a greeting in german:

german.txt
```
Hallo!
```

2. Check the status of the local repository.

```sh
git status
```

Output

```
On branch main
Your branch is behind 'origin/main' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

nothing to commit, working tree clean
```

Now, between the indication of the branch we are on and the message to indicate that there is nothing to commit to our local repository, there is a couple of lines that tell us if our local repository is up to date with our remote repository. In this case, it is telling us that our local repository is one commit behind of our remote repository, and the command to update the local repository.

3. Update the local repository with the changes in the remote repository.

```sh
git pull
```

Output

```
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 2), reused 3 (delta 1), pack-reused 0
Unpacking objects: 100% (3/3), 307 bytes | 307.00 KiB/s, done.
From github.com:username/greetings
   5d6e7f8..9a8b7c6  main       -> origin/main
Updating 5d6e7f8..9a8b7c6
Fast-forward
 german.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 german.txt
```

::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::


In summary, we have seen how to update the remote repository with the changes in the local repository with `git push` and how to update the local repository with the changes in the remote repository with `git pull`.


## Cloning a repository

There might be cases where we want to get a copy of a remote repository in our local computer. For example:
- if we create a remote repository directly in GitHub
- if we see a public repository in GitHub that we are interested in
- if we are collaborating with other people in a project and they have created the remote repository

:::::::::::::::::::::::::::::::: challenge

## Exercise

Check this repository in GitHub: https://github.com/Sara-Ll/git_GitHub_basics

Can you obtain a local copy of it?

::::::::::::::::::::::::: solution

Yes, we can obtain a local copy of it by cloning it.

Go to a folder in your computer where you want to have the local copy of the repository and run the following command:

```sh
git clone https://github.com/Sara-Ll/git_GitHub_basics.git
```

Output

```
Cloning into 'git_GitHub_basics'...
remote: Enumerating objects: 19, done.
remote: Counting objects: 100% (19/19), done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 19 (delta 3), reused 19 (delta 3), pack-reused 0
Unpacking objects: 100% (19/19), 4.16 KiB | 1.04 MiB/s, done.
```

Now, if we check the content of the folder, we will see that there is a new folder called `git_GitHub_basics` with the content of the repository.

```sh 
ls git_GitHub_basics
```

Output

```
README.md
...

```

:::::: callout

The content of this repository will make sense in the next section.

:::::::::::::::

::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::

Now you can get a local copy of any public repository that you see in GitHub!


::::::::::::::::::::::::::::::::::::: keypoints 

- `git push` to update remote repository and synchronise it with local repository
- `git pull` to update local repository and synchronise it with remote repository
- `git clone` to create a local copy of a remote repository

::::::::::::::::::::::::::::::::::::::::::::::::

