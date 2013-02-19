gitstrap
========

[![build status](https://secure.travis-ci.org/WebReflection/gitstrap.png)](http://travis-ci.org/WebReflection/gitstrap)

A basic structure to start a JS project.

The idea behind is to have it somewhere updated locally, then when it's time to create a new repo simply `cp -rf ~/code/gitstrap/* ~/code/newrepo` and then start creating amazing stuff with a folder already set up to build and easily test stuff.

    # install dependencies
    make dependencies

----------------------------------------

    # generic JS variable
    make var
    
    # node.js
    make node
    
    # AMD module
    make amd
    
    # all together plus tests via node.js
    make

----------------------------------------

    # test only
    make test
    
    # via npm
    npm test
    
    # test via web (click on the generated url)
    make web

----------------------------------------

    # jshint
    make test
    
    # update pages test
    make pages

Latter one requires a `gh-pages` branch
