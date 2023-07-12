# Working example for sandpaper issue 490

This will demonstrates a non-interactive message received with the hydrate,
restore, snapshot workflow that is used in the {sandpaper} package to
auto-provision packages. 

As described in [carpentries/sandpaper#490](https://github.com/carpentries/sandpaper/issues/490),
this issue appears during the `restore()` step with this message:

```
  Packages must first be installed before renv can snapshot them.
  Use `renv::dependencies()` to see where this package is used in your project.
  
  Not interactive. Will:
  Snapshot, just using the currently installed packages.
```

This repository strips away all sandpaper components and leaves the workflow
that is used in
[`sandpaper::manage_deps()`](https://carpentries.github.io/sandpaper/reference/dependency_management.html)
while controlling the version of {renv} used.


This issue setup was taken from [zkamvar/renv-issue-1177](https://github.com/zkamvar/renv-issue-1177),
which demonstrated a more complex issue. 

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
lockfile](https://raw.githubusercontent.com/carpentries/workbench-template-rmd/3b4e68e904e1fd9185362b5a117b8c69108f81cf/renv/profiles/lesson-requirements/renv.lock)
(in the `test/` directory).


INSIDE this project is a script called [`script.R`](script.R), which
will do the following:

1. remove and re-create the test directory with a [`renv.lock` file](https://raw.githubusercontent.com/carpentries/workbench-template-rmd/3b4e68e904e1fd9185362b5a117b8c69108f81cf/renv/profiles/lesson-requirements/renv.lock) that is tuned to rendering R Markdown documents
2. initialize the project **from callr**
3. add a test file that contains `library('reprex')`
4. run hydrate + restore + snapshot **from callr** in that test directory

## Findings

## Reproducing

to reproduce, use `run.sh`

```bash
bash run.sh
```
