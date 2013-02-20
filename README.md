gitstrap
========

[![build status](https://secure.travis-ci.org/WebReflection/gitstrap.png)](http://travis-ci.org/WebReflection/gitstrap)

A basic structure to start a JS project.

### Automatic Setup
This procedure will ask you your name in github, in my case I would put `WebReflection`, the new repository name you have just created, in this case I would use `gitstrap`, and the folder where to initialize such repository, as example `~/code`.

    curl -s https://raw.github.com/WebReflection/gitstrap/master/new >~/gstrap && bash ~/gstrap && rm ~/gstrap

Once inserted those three values, the script will prepare everything and will ask if you want to push the fresh new repo content.

### Basic Manual Setup
Once created a repository **without the README.md** file, and let's call the repository *project-name*, here what you could do to be up and running:

    git clone git://github.com/WebReflection/gitstrap.git project-name
    cd project-name
    rm -rf .git
    make dependencies
    git init
    git add .
    git commit -m "gitstrap in"
    git remote add origin git@github.com:yourname/project-name.git
    git push -u origin master

### Other Features

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

Latter one requires a [gh-pages branch](http://webreflection.github.com/gitstrap/) so the test will be reachable, as example, [through the test folder](http://webreflection.github.com/gitstrap/test/)
