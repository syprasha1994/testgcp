var assert = require('assert');
describe('Basic unit test', function () {
    it('should return number of characters in a string', function () {
        assert.equal("Demonstration".length, 13);
    });
    it('should return first charachter of the string', function () {
        assert.equal("Demonstration".charAt(0), 'D');
    });
});
