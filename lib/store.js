'use strict';

const levelUp = require('levelup');
const levelDown = require('leveldown');
const q = require('q');

class Store {
    constructor (path, options) {
        this.db = levelUp(levelDown(path), options);
    }

    put(key, value) {
        // noinspection JSUnresolvedFunction
        const deferred = q.defer();
        this.db.put(key, value, (error) => {
            if (error) {
                deferred.reject(error);
            } else {
                deferred.resolve();
            }
        });
        return deferred.promise;
    }

    get(key) {
        // noinspection JSUnresolvedFunction
        const deferred = q.defer();
        this.db.get(key, (error, value) => {
            if (error) {
                deferred.reject(error);
            } else {
                deferred.resolve(value);
            }
        });
        return deferred.promise;
    }

    close() {
        // noinspection JSUnresolvedFunction
        const deferred = q.defer();
        this.db.close((error) => {
            if (error) {
                deferred.reject(error);
            } else {
                deferred.resolve();
            }
        });
        return deferred.promise;
    }
}

class JsonStore extends Store {
    constructor (path) {
        super(path, { valueEncoding: 'json' });
    }
}

module.exports = {
    JsonStore
};
