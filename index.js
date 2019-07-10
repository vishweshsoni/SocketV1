const express = require('express');
const path = require('path');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.set('port', (process.env.PORT || 5000));

io.on('connection',function(socket){
        console.log('User Connection');
        socket.on('subscribe',function(room){
            console.log('Joining room',room);
            socket.join(room);
        });
        socket.on('unsubscribe',function(room){
            console.log('Leaving room',room);
            socket.leave(room);
        });
        socket.on('alive',function(isAlive){
            io.sockets.in(isAlive.room).emit('Isallive',isAlive);
        });
});