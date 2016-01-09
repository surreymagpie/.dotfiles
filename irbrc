require "irb/completion"
require "awesome_print"

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT] = true
AwesomePrint.irb!
