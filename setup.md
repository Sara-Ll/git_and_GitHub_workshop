---
title: Setup
---

<!--
FIXME: Setup instructions live in this document. Please specify the tools and
the data sets the Learner needs to have installed.
-->

<!--
## Data Sets
-->

<!--
FIXME: place any data you want learners to use in `episodes/data` and then use
       a relative link ( [data zip file](data/lesson-data.zip) ) to provide a
       link to it, replacing the example.com link.
-->

<!--
Download the [data zip file](https://example.com/FIXME) and unzip it to your Desktop
-->

## Software Setup

This workshop requires to have `git` installed and a GitHub account. Follow the instructions below if you don't.

::::::::::::::::::::::::::: checklist
- [ ] Install git
- [ ] Create an account in GitHub
- [ ] Authorize your computer to access GitHub
:::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::::: challenge

### Install git

Installation for different systems. Choose your operating system from the dropdown menus below and follow the instructions*.

\* Source: [Imperial College Londong Grad School](https://imperialcollegelondon.github.io/introductory_grad_school_git_course/setup.html) 

:::::::::::::::: solution

### Windows


1. Download the Git for Windows [installer](https://git-for-windows.github.io/).
2. Run the installer and follow the steps below:
    1. Click on “Next” four times (two times if you’ve previously installed Git). You don’t need to change anything in the Information, location, components, and start menu screens.
    2. From the dropdown menu select “Use the nano editor by default” and click on “Next”.
    3. Ensure that “Git from the command line and also from 3rd-party software” is selected and click on “Next”. (If you don’t do this Git Bash will not work properly, requiring you to remove the Git Bash installation, re-run the installer and to select the “Git from the command line and also from 3rd-party software” option.)
    4. Ensure that “Use the native Windows Secure Channel library” is selected and click on “Next”.
    5. Ensure that “Checkout Windows-style, commit Unix-style line endings” is selected and click on “Next”.
    6. Ensure that “Use Windows’ default console window” is selected and click on “Next”.
    7. Ensure that “Enable file system caching” and “Enable Git Credential Manager” are selected and click on “Next”.
    8. Click on “Install”.
    9. Click on “Finish”.
3. If your “HOME” environment variable is not set (or you don’t know what this is):
    1. Open command prompt (Open Start Menu then type `cmd` and press [Enter])
    2. Type the following line into the command prompt window exactly as shown:
    3. `setx HOME "%USERPROFILE%"`
    4. Press [Enter], you should see `SUCCESS: Specified value was saved`.
    5. Quit command prompt by typing `exit` then pressing [Enter]

This will provide you with both Git and Bash via the program Git Bash. You should be able to launch Git Bash from the Start Menu. Within the window that launches enter the command `git --version` and press enter. You should see output similar to the below:

```
git version 2.40.0.windows-1
```

:::::::::::::::::::::::::

:::::::::::::::: solution

### MacOS

Apple provide a suite of UNIX-style command line tools that includes git. Install them by opening the “Terminal” app and running:

```sh
$ xcode-select **--install**
```

This will open dialog that asks for your confirmation to install the tools. If it does not open a dialog, it may be because it is already installed (the error message will be clear).

To check the installation was successful open the “Terminal” app. In the window that launches enter the command `git --version` and press enter. You should see output similar to the below:

```
git version 2.39.2 (Apple Git-143)
```

**If the above does not work**, you may have and older version of MacOS. Try the following: install Git for Mac by downloading and running the most recent “mavericks” installer from [this list](http://sourceforge.net/projects/git-osx-installer/files/). Because this installer is not signed by the developer, you may have to right click (control click) on the .pkg file, click Open, and click Open on the pop up window. After installing Git, there will not be anything in your `/Applications` folder, as Git is a command line program. **For older versions of OS X (10.5-10.8)** use the most recent available installer labelled “snow-leopard” [available here](http://sourceforge.net/projects/git-osx-installer/files/).

:::::::::::::::::::::::::


:::::::::::::::: solution

### Linux

If Git is not already available on your machine you can try to install it via your distributions package manager. For Debian/Ubuntu run `sudo apt-get install git` and for Fedora run `sudo dnf install git`.

To check the installation was successful open a new terminal. In the window that launches enter the command `git --version` and press enter. You should see output similar to the below:

```
git version 2.40.0
```

:::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::: challenge

### Create an account in GitHub

Set up your free github account:

1. Go to [www.github.com/join](www.github.com/join).
2. Enter your details and click “Create an account”. You can use your Imperial e-mail address, but this is not mandatory.
3. Choose the Free plan.
4. Check your e-mail and click “Verify email address”.
5. You can fill out the questionnaire or click “skip this step”.


:::::::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::::: challenge

### Authorize your computer to access GitHub

[Check if you have a key that is being used](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey#make-sure-you-have-a-key-that-is-being-used)

If you have one:

 1. [Add your SSH key to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)

If you don't have one:

1. [Generate a new ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
2. [Add your SSH key to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)

:::::::::::::::::::::::::::::::::::::::::::::::::::