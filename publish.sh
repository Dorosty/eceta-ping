#!/bin/bash
coffee -c index.coffee
sudo forever stopall
sudo forever start index.js
