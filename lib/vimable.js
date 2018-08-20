/**
 * vimable.js
 * @author Hasnae R.
 */

'use strict';

const vim     = require('./vim');
const program = require('commander');

program
    .command('edit')
    .description('open script for edit')
    .action(() => {
        vim.edit(require.main.filename);
    });

module.exports = program;
