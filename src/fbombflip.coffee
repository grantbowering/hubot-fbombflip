# Description
#   Responds to '[x] the fucking [y]' with '[x] fucking the [y]?!' 
#
#
# Commands:
#   I also reposition f-bombs.
#
#
# Author:
#   grant.bowering@gmail.com

module.exports = (robot) ->

  robot.hear ///
        (\w+) # any word (capture it as [1])
        \x20  # a space
        (the|this|these|those|your|my|our|his|her|a|one|both|every|all) # one of the words that makes fucking a verb (capture it as [2])
        \x20  # a space
        (fu[ck]?k[ei]?n'?g?) # some variation on the word 'fucking' (capture it as [3])
        \x20  # a space
        (?!a|one|I|my|it|me|we|us|our|you|she|her|his|he|him|they|them|that|which|who|whom|whose|this|these|both) # words that make it not make sense
        (\w+) # any word not in the preceeding negative-lookahead (capture it as [4])
            ///i, (msg) ->
    msg.send "#{msg.match[1]} #{msg.match[3]} #{msg.match[2]} #{msg.match[4]}?!"