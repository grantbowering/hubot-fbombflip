Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/fbombflip.coffee')

describe 'fbombflip', ->
 beforeEach ->
    @room = helper.createRoom(httpd: false)

 it 'should move this fucking', ->
  @room.user.say('alice', 'I hate this fucking guy').then =>
    expect(@room.messages).to.eql [
      ['alice', 'I hate this fucking guy']
      ['hubot', 'hate fucking this guy?!']
    ]

 it 'should move the fuckin', ->
  @room.user.say('alice', 'I dig the fuckin racing stripes, man').then =>
    expect(@room.messages).to.eql [
      ['alice', 'I dig the fuckin racing stripes, man']
      ['hubot', 'dig fuckin the racing?!']
    ]

 it 'should move and every fucking', ->
  @room.user.say('alice', 'and every fucking person there').then =>
    expect(@room.messages).to.eql [
      ['alice', 'and every fucking person there']
      ['hubot', 'and fucking every person?!']
    ]

 it 'should leave it alone if it\'s a pronoun', ->
  @room.user.say('alice', 'It was the fucking it up that annoyed me').then =>
    expect(@room.messages).to.eql [
      ['alice', 'It was the fucking it up that annoyed me']
    ]