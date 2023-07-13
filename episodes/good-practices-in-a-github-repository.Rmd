---
title: 'Good practices in a GitHub repository'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- Which files should be included in a GitHub repository?
- Which files might be relevant to include in a public GitHub repository?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain the type of files that are important to include in a GitHub repository
- Show how to create these files
- Provide resources such as templates for these files

::::::::::::::::::::::::::::::::::::::::::::::::

## Important files for a public GitHub repository

You can see examples for these files in the remote repository you cloned in the [last section](getting-changes-from-a-remote-repository.Rmd).


### README.md

- [Markdown (.md) format](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

- Resources
   - https://www.makeareadme.com/
   - [Template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)


::::::: testimonial

## Extra

To make your README file prettier, you can add badges to it using [shields.io](https://shields.io/).

Badges are small images that provide information about the status of your project. For example, you can add a badge to show the version of your software, or the number of downloads of your software 

::::::::::::::::::::


### LICENSE

- [Adding a license to a repository](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository)
   - Add file ▾ → Create new file → type: LICENSE or LICENSE.md → ⚖️ Chose a license template

- Resources:
   - https://opensource.org/licenses/
   - https://choosealicense.com/


:::::::::::::::::::: dicussion
\* Imperial College's preferred licence is the permissive BSD 2- or 3-clause. You can check the details at Imperial website: Open Source Software Licences.
::::::::::::::::::::::::::::::


### CITATION.cff

- cff = [Citation File Format](https://citation-file-format.github.io/)

- Resources:
   - [Initializer](https://citation-file-format.github.io/cff-initializer-javascript/#/)
   - [Converter](https://github.com/citation-file-format/cff-converter-python) from .cff to other formats (BibTeX, EndNote, …)

- Digital Object Identifier (DOI) allows you to create a unique identifier for your repository and make it citable. You can get a DOI from:
   - [Zenodo](https://zenodo.org/) 
   - [Figshare](https://figshare.com/)


### INSTALLATION.md

If your repository contains software that people will want to install and use, it is important to provide instructions on how to install it.

It is important that these instructions are:
- complete (i.e. they include all the steps needed to install the software)
- detailed (i.e. they include all the commands that need to be run)
- specify the operating system that it was tested on, or provide instructions for different operating systems (e.g. Linux, Mac, Windows)


### CONTRIBUTING.md

If you expect people to contribute to your repository or want to encourage them to do so, you might want to include some contributing guidelines.

GitHub Help provides information on how to do this: [Setting guidelines for repository contributors](https://help.github.com/en/github/building-a-strong-community/setting-guidelines-for-repository-contributors).



::::::::::::::::::::::::::::::::::::: keypoints 

- Important files for a public GitHub repository:
   - README.md
   - LICENSE
   - CITATION.cff
   - INSTALLATION.md (if applicable)
   - CONTRIBUTING.md (if applicable)
   
::::::::::::::::::::::::::::::::::::::::::::::::

