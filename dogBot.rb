require 'discordrb'
require 'yaml'

file=File.open('config/config.yml')
config = YAML.load_stream(file)
config=config[0] #somehow YAML loads an array consisting of one hash. Must convert to hash first.
file.close

bot = Discordrb::Bot.new config["email"], config["password"]

bot.message(starting_with: 'dogBot', in:'bot_playground') do |event|
	msg = event.content # Should get stuff and things

  event.respond (msg)
end

bot.run

# Following lines are actually commented
=begin

# This bot has various commands that show off CommandBot.
require 'discordrb'

bot = Discordrb::Commands::CommandBot.new 'email@example.com', 'hunter2', '!'

bot.command :user do |event|
  event.user.name
end

bot.command :bold do |_event, *args|
  "**#{args.join(' ')}**"
end

bot.command :italic do |_event, *args|
  "**#{args.join(' ')}**"
end

bot.command(:join, permission_level: 1, chain_usable: false) do |event, invite|
  event.bot.join invite
end

bot.command(:random, min_args: 0, max_args: 2, description: 'Generates a random number between 0 and 1, 0 and max or min and max.', usage: 'random [min/max] [max]') do |_event, min, max|
  if max
    rand(min..max)
  elsif min
    rand(0..min)
  else
    rand
  end
end

bot.command :long do |event|
  event << 'This is a long message.'
  event << 'It has multiple lines that are each sent by doing `event << line`.'
  event << 'This is an easy way to do such long messages, or to create lines that should only be sent conditionally.'
  event << 'Anyway, have a nice day.'
end

bot.run

=end