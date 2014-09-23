# coding: utf-8
require "open-uri"
require "json"

module Cosmicbot
  module Meuh
    class Plugin
      include Cinch::Plugin
      set :react_on, :channel

      match /^[^!].+$/, method: :message
      def message(m)
        my_nick = "Meuh" # TODO
        message = "foo" # TODO
        nickname = "sunny" # TODO
        random_nickname = "lol" # TODO

        answer case message
        when /#{my_nick}.*\?/
          ['ouais', 'euh ouais', 'vi', 'affirmatif', 'sans doute',
            'c\'est possible', 'j\'en sais rien moi D:', 'arf, non', 'non', 'nan',
            'euh nan', 'negatif', 'euhh peut-être', "demande à #{random_nickname}"]
        when /#{my_nick}/
          ['3:-0', '', 'oui ?', '...', 'lol', 'mdr', ':\')',
            'arf', 'shhh', ':)', '3:)', 'tg :k', 'moi aussi je t\'aime',
            "oui oui #{nickname}"]
        when /^lu$/
          ["tin", "stucru"]
        when /^hein( \?)?$/
          ["deux !!"]
        when /^quoi ?\?$/
          ["feur !"]
        when /^où.*\?$/
          ["dtc"]
        when "lol", "mdr", "rofl", "ptdr"
          ['lol','mdr','rofl','ptdr']
        else
          if message == @previous_message and @previous_nickname != nickname
            [message]
          else
            @previous_message = message
            @previous_nickname = nickname
            [":)", ":p", "3:)", "lol"] if rand(1, 100) == 1
          end
        end
      end

      def msg(possible_messages)
        return if possible_messages.nil?
        sleep rand(0,2)
        msg = possible_messages[rand(possible_messages.size)]
        m.reply msg
      end
    end
  end
end
