.PHONY: var node amd clean test web pages dependencies

# repository name
REPO = main

# default build task
build:
	make var
	make node
	make amd
	make test

# build generic version
var:
	mkdir -p build
	cat template/var.before src/$(REPO).js template/var.after >build/no-copy.$(REPO).max.js
	node node_modules/uglify-js/bin/uglifyjs --verbose build/no-copy.$(REPO).max.js >build/no-copy.$(REPO).js
	cat template/license.before LICENSE.txt template/license.after build/no-copy.$(REPO).max.js >build/$(REPO).max.js
	cat template/copyright build/no-copy.$(REPO).js >build/$(REPO).js
	rm build/no-copy.$(REPO).max.js
	rm build/no-copy.$(REPO).js

# build node.js version
node:
	mkdir -p build
	cat template/license.before LICENSE.txt template/license.after template/node.before src/$(REPO).js template/node.after >build/$(REPO).node.js

# build AMD version
amd:
	mkdir -p build
	cat template/amd.before src/$(REPO).js template/amd.after >build/no-copy.$(REPO).max.amd.js
	node node_modules/uglify-js/bin/uglifyjs --verbose build/no-copy.$(REPO).max.amd.js >build/no-copy.$(REPO).amd.js
	cat template/license.before LICENSE.txt template/license.after build/no-copy.$(REPO).max.amd.js >build/$(REPO).max.amd.js
	cat template/copyright build/no-copy.$(REPO).amd.js >build/$(REPO).amd.js
	rm build/no-copy.$(REPO).max.amd.js
	rm build/no-copy.$(REPO).amd.js

# clean/remove build folder
clean:
	rm -rf build

# tests, as usual and of course
test:
	node node_modules/wru/node/program.js test/$(REPO).js

# launch polpetta (ctrl+click to open the page)
web:
	node node_modules/polpetta/build/polpetta ./

pages:
	make var
	mkdir -p ~/tmp
	mkdir -p ~/tmp/$(REPO)
	cp -rf build ~/tmp/$(REPO)
	cp -rf test ~/tmp/$(REPO)
	cp index.html ~/tmp/$(REPO)
	git checkout gh-pages
	mkdir -p test
	rm -rf test
	cp -rf ~/tmp/$(REPO) test
	git add .
	git commit -m 'automatic test generator'
	git push
	git checkout master
	rm -r ~/tmp/$(REPO)

# modules used in this repo
dependencies:
	rm -rf node_modules
	mkdir node_modules
	npm install wru
	npm install polpetta
	npm install uglify-js@1
