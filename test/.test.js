var
  fs = require('fs'),
  path = require('path'),
  spawn = require('child_process').spawn,
  modules = path.join(__dirname, '..', 'node_modules', 'wru', 'node', 'program.js'),
  code = 0,
  many = 0;

function exit($code) {
  if ($code) {
    code = $code;
  }
  if (!--many) {
    process.exit(code);
  }
}

fs.readdirSync(__dirname).filter(function(file){
  if (fs.existsSync(path.join(__dirname, '..', 'src', file))) {
    ++many;
    spawn(
      'node', [modules, path.join('.', __dirname.replace(/^.*([\/])([^\1]+?)$/, "$2"), file)], {
      detached: false,
      stdio: [process.stdin, process.stdout, process.stderr]
    }).on('exit', exit);
  }
});