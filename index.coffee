nodemailer = require 'nodemailer'

notify = ->
  [
    {name: 'Ali Dorosty', email: 'ma.dorosty@gmail.com'}
    {name: 'Dr. Khosravi', email: 'ramtung@gmail.com'}
    {name: 'Dr. Khosravi', email: 'r.khosravi@ut.ac.ir'}
    {name: 'Mr. Razzagh', email: 'hrazzagh@gmail.com'}
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
  xhr = new XMLHttpRequest()
  xhr.onreadystatechange = ->
    if xhr.readyState is 4
      unless xhr.status is 200
        notify()
      setTimeout check
  xhr.open 'GET', 'http://eceta.ut.ac.ir', true
  xhr.send()