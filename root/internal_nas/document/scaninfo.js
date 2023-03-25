const fs = require('fs');

const directoryPath = '/root/internal_nas/document';

fs.readdir(directoryPath, function (err, files) {
  if (err) {
    console.log('Error getting directory information:', err);
  } else {
    console.log('Sub-directories:');
    files.forEach(function (file) {
      if (fs.statSync(directoryPath + '/' + file).isDirectory()) {
        console.log(file);
      }
    });
  }
});
