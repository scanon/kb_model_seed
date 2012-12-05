kb_model_seed
=============

This repository contains wrapper code to integrate the
ModelSEED Perl libraries into KBase. This wrapper code
consists of a Makefile and the necessary Git metadata
to initialize a Git submodule for the ModelSEED code.

For documentation on the ModelSEED, see the [wiki][1].

* Authors: Chris Henry, Paul Frybarger, Scott Devoid
* Last Updated:  2 August, 2012

[1]: http://github.com/ModelSEED/ModelSEED/wiki "ModelSEED wiki" 


Development
-----------

### Add a new submodule

This is for adding a new git repository as a submodule. The
following command must be done at the top level of this git repository.

    git submodule add <repo-url> <path>
    # where repo-url is a valid Git repo URL and path is the path to where you want the repo:
    git submodule add git://github.com/ModelSEED/MFAToolkit.git submodules/MFAToolkit

### Update an existing submodule with changes

    cd submodules/MFAToolkit
    git checkout master
    git pull origin/master
    # Assume no conflicts
    cd ..
    git status
    # Should show the submodule with "new commits"
    # if there were any changes
    git add submodules/MFAToolkit
    git commit -m "Updated MFAToolkit"

That's it!
