# coding: utf-8
module Cosmicbot
  class Bot
    def initialize
      @bot = Cinch::Bot.new do
        configure do |c|
          c.nick = "cosmicbot"
          c.server = "irc.freenode.org"
          c.channels = [ENV['COSMIC_CHANNEL']]
          c.plugins.plugins = [Grebige::Plugin]
        end
      end
    end

    def start
      @bot.start
    end
  end
end
