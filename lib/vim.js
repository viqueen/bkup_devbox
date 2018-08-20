/**
 * vim.js
 * @author Hasnae R.
 */

'use strict';

const spawn = require('child_process').spawn;

exports.edit = function (filePath) {
    const child = spawn('vim', [filePath], { stdio : 'inherit' });
    child.on(
        'exit',
        () => {
            process.exit(0);
        }
    );
};
