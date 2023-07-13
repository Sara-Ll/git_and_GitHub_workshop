---
title: 'Creating a remote repository in GitHub'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- Can you access your project from another computer?
- How do you work with others on the same project?
- How do you share and publish your project?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Show how to create a remote repository with GitHub
- Demonstrate how to synchronize a local repository with a remote repository

::::::::::::::::::::::::::::::::::::::::::::::::

## Creating a remote repository

In the previous episode, we created a local repository on our computer. Sometimes we want to access our project from another computer, or we want to share our project with others for publication or to collaborate. 

We can create a remote repository hosted on a server. Here, we will show how to use [GitHub](https://github.com/), as it is a popular platform for hosting repositories.

The difference between a local and a remote repository is that the remote repository is hosted on a server, and can be accessed from anywhere. The local repository is stored on your computer, and can only be accessed from your computer. In both cases, the changes you make to the files are tracked by `git`.

Let's make a remote repository on GitHub for our local repository of the project `greetings`.

::::::::::::::::::::::::::::::::::::: challenge

1. Log in to your GitHub account. If you don't have one, create one as indicated in the [setup instructions](../learners/setup.md).

2. Create a new repository. 

3. Give it a name (e.g.: 'greetings'), a description, and choose if you want to make it public or private. Ignore the other options and click on 'Create repository'.

4. Synchronize your local repository with the remote repository.

5. Refresh the page of the remote repository on GitHub. What do you see?

:::::::::::::::::::::::::: hint

After giving the details for the remote repository and clicking on 'Create repository', you will see a page with instructions on how to synchronize your local repository with the remote repository in different cases.

Make sure to follow the correct instructions!

When pushing your remote repository, you might get an error message saying that the access to the repository is denied. Make sure to follow the [setup instructions](../learners/setup.md).

::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::: solution

1. Log in to your GitHub account. If you don't have one, create one as indicated in the [setup instructions](../learners/setup.md).

Go to the loging page of GitHub: https://github.com/login, enter your username or email address, and your password.

2. Create a new repository.

There are several ways to create a new repository. 

  - On the home page ([Dashboard](https://github.com/dashboard)), click on the green button 'New'.

  - On the home page ([Dashboard](https://github.com/dashboard)), click on the '+' sign in the top right corner of the page, and select 'New repository'.

  - Go to your repositories page, and click on the green button 'New'.

![Creating a new repository. On the home page (Dashboard), click on the green button 'New' or on the '+' sign in the top right corner of the page, and select 'New repository'.](fig/Screenshot_GitHub_NewRepository.png)

3. Give it a name (e.g.: 'greetings'), a description, and choose if you want to make it public or private. Ignore the other options and click on 'Create repository'.

![Add the details of the new repository.](fig/Screenshot_GitHub_NewRepositoryAllDetails.png)

4. Synchronize your local repository with the remote repository.

A page with instructions on how to synchronize your local repository with the remote repository will appear.

![Synchronize your local repository with the remote repository.](fig/Screenshot_GitHub_addRemote.png)

Follow the instructions for the case where you already have a local repository: "...or push an existing repository from the command line".

Open a terminal, and go to the directory of your local repository.

Add the remote repository to your local repository:

```sh
git remote add origin git@github.com:Sara-Ll/greetings.git
git branch -M main
git push -u origin main
```

::::::::: callout

When doing `git push -u origin main`, you might get an error message saying that the access to the repository is denied. This is because you need to authenticate your computer with GitHub. Make sure to follow the [setup instructions](../learners/setup.md).

::::::::::::::::::

5. Refresh the page of the remote repository on GitHub. What do you see?

You should see the files of your local repository in the remote repository. 

![The remote repository on GitHub.](fig/Screenshot_GitHub_RemoteRepository.png)


:::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: keypoints 

- `git remote add origin <URL>` to link a local repository and a remote repository at the specified URL
- `git push -u origin main` to push local changes to the specified branch of the remote repository

::::::::::::::::::::::::::::::::::::::::::::::::

