var
  fs = require('fs'),
  path = require('path'),
  spawn = require('child_process').spawn,
  modules = path.join(__dirname, '..', 'node_modules', 'wru', 'node', 'program.js');
fs.readdirSync(__dirname).filter(function(file){
  if (fs.existsSync(path.join(__dirname, '..', 'src', file))) {
    spawn(
      'node', [modules, path.join(__dirname.replace(/^.*([\/])([^\1]+?)$/, "$2"), file)], {
      detached: false,
      stdio: [process.stdin, process.stdout, process.stderr]
    });
  }
});