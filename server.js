const express = require('express');

var app = express();

app.get('/', (req, res) => {
    res.status(200).send({
        name: 'Kent',
        grade: 100
    });
});

app.listen(3000, () => {
    console.log("Server started at port 3000");
});

module.exports.app = app;