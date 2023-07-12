# Working example for sandpaper issue 490

This will demonstrates quirk with the hydrate, restore, snapshot workflow that
is used in the {sandpaper} package to auto-provision packages. 

## Setup


This folder contains the following structure

```sh
.
├── .renvignore
├── .Rprofile
├── lockfile
├── out.txt
├── renv
│   ├── activate.R
│   ├── library
│   ├── sandbox
│   ├── settings.json
│   └── staging
├── renv-16.txt
├── renv.lock
├── script.R
└── test
    ├── renv
    ├── renv.lock
    └── test.R
```

The folder structure is designed so that it will attempt to control a
test project that attempts to add the {reprex} package to [an existing
lockfile](https://raw.githubusercontent.com/carpentries/workbench-template-rmd/f6ea6bca196ecd127d4e550afa6e940513419d1c/renv/profiles/lesson-requirements/renv.lock)
(in the `test/` directory).


INSIDE this project is a script called [`script.R`](script.R), which
will do the following:

1. remove and re-create the test directory with a [`renv.lock` file](https://raw.githubusercontent.com/carpentries/workbench-template-rmd/f6ea6bca196ecd127d4e550afa6e940513419d1c/renv/profiles/lesson-requirements/renv.lock) that is tuned to rendering R Markdown documents
2. initialize the project **from callr**
3. add a test file that contains `library('reprex')`
4. run hydrate + restore + snapshot **from callr** in that test directory

## Findings

## Reproducing

to reproduce, use `run.sh`

```bash
bash run.sh
```
