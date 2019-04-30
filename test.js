
const request = require('supertest');
const app = require('./server.js').app;
const expect = require('expect');

describe('Test function "testMe"', function () {
    it('should return an user obj', (done) => {
        request(app)
            .get('/')
            .expect(200)
            .expect((res) => {
                expect(res.body).toMatchObject({
                    name: 'Kent',
                    grade: 999
                });
            })
            .end(done);
    })
});