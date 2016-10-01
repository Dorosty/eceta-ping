http = require 'http'
url = require 'url'
nodemailer = require 'nodemailer'

notify = ->
  [
    {name: 'Ali Dorosty', email: 'ma.dorosty@gmail.com'}
    # {name: 'Dr. Khosravi', email: 'ramtung@gmail.com'}
    # {name: 'Dr. Khosravi', email: 'r.khosravi@ut.ac.ir'}
    # {name: 'Mr. Razzagh', email: 'hrazzagh@gmail.com'}
  ].forEach ({name, email}) ->
    nodemailer.createTransport
      host: 'mail.ut.ac.ir',
      auth:
        user: 'ma.dorosty',
        pass: 'Ma19Md93M'
    .sendMail
      from: 'ECETA <ma.dorosty@ut.ac.ir>'
      to: "#{name} <#{email}>"
      subject: 'ECETA IS DOWN!!!'
      text: ''

do check = ->
  req = http.request url.parse('http://eceta.ut.ac.ir'), ->
    setTimeout check
  req.on 'error', ->
    notify()
    setTimeout check
  req.end()