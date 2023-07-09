---
title: 'Configuring git'
teaching: 10
exercises: 5
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you configure `git`?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to set up a global configuration for git

::::::::::::::::::::::::::::::::::::::::::::::::

## Starting with git

First, let's check that `git` is installed:

```sh
git --version
```

If this does not work, make sure to have follow the [setup instructions](../setup.md) 


### Global configuration of git

Before starting to use `git` is a good idea to set up some global configuration parameters. 

1. Check our initial global configuration with the following command:

```sh
git config --global --list
```

2. Provide our name, which will be included with every snapshot that is recorded with `git`. This helps to distinguish who has made what changes in collaborative projects:

```sh
git config --global user.name "FIRST_NAME LAST_NAME"
```

3. Provide an email:

```sh
git config --global user.email "email@example.com"
```

4. Set up a default code editor:

```sh
git config --global core.editor "EDITOR_NAME"
```

See the following table to decide the editor to set up:

| Editor                                | Configuration command | 
| :-----------                          | :------------------------------ |
| Atom                                  | `$ git config --global core.editor "atom --wait"`                      | 
| nano                                  | `$ git config --global core.editor "nano -w"`                      | 
| BBEdit (Mac, with command line tools) | `$ git config --global core.editor "bbedit -w"`                      | 
| Sublime Text (Mac)                    | `$ git config --global core.editor "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -n -w"`                      | 
| Sublime Text (Win, 32-bit install)    | `$ git config --global core.editor "'c:/program files (x86)/sublime text 3/sublime_text.exe' -w"`                      | 
| Sublime Text (Win, 64-bit install)    | `$ git config --global core.editor "'c:/program files/sublime text 3/sublime_text.exe' -w"`                      | 
| Notepad (Win)                         | `$ git config --global core.editor "c:/Windows/System32/notepad.exe"`                      | 
| Notepad++ (Win, 32-bit install)       | `$ git config --global core.editor "'c:/program files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`                      | 
| Notepad++ (Win, 64-bit install)       | `$ git config --global core.editor "'c:/program files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`                      | 
| Kate (Linux)                          | `$ git config --global core.editor "kate"`                      | 
| Gedit (Linux)                         | `$ git config --global core.editor "gedit --wait --new-window"`                      | 
| Scratch (Linux)                       | `$ git config --global core.editor "scratch-text-editor"`                      | 
| Emacs                                 | `$ git config --global core.editor "emacs"`                      | 
| Vim                                   | `$ git config --global core.editor "vim"`                      | 
| VS Code                               | `$ git config --global core.editor "code --wait"`                      | 

Source: [Software carpentry](https://swcarpentry.github.io/git-novice/02-setup.html)

:::::::::::::::::: callout

If you are not familiar with using a text editor in the terminal, the easiest one to start with is `nano`. To start `nano`, you can type:

```sh
nano FILE_NAME
```

Then you will see a couple of bottom lines indicating the options, such as `^X Exit` (the "^" means to press Ctrl).

::::::::::::::::::::::::

::::::::::::::::::::: testimonial

### N.B.

All this configuration can be re-set at any time point with the same commands (e.g., change the email or the default code editor)
::::::::::::::::::::::::::::::::::


::::::::::::::::::: challenge

### Configure your `git`

Use the above commands to configure your `git`.

:::::::::::: solution

### My example

```sh
git config --global user.name "Sara Ll"
git config --global user.email "SLl@email.com"
git config --global core.editor "vim"
```

Checking my global configuration set up:

```sh
git config --global --list
```

Output:
```
user.email=SLl@email.com
user.name=Sara Ll
core.editor=vim
```

:::::::::::::::::::::

:::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: keypoints 

- `git config --global --list` to see your current global configuration
- `git config --global [<options>]` 

::::::::::::::::::::::::::::::::::::::::::::::::

