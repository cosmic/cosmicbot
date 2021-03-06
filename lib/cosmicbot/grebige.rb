# coding: utf-8
require "open-uri"
require "json"

module Cosmicbot
  module Grebige
    class Plugin
      include Cinch::Plugin
      set :react_on, :channel

      match "grébige"
      def execute(m)
        Hours.new.days_since.each do |login, days|
          m.reply "#{login}: il y a #{days} jours"
        end
      end

      match "help", method: :help
      def help(m)
        m.reply "!grébige : liste des heures du grébige"
      end
    end

    class Hours
      def days_since
        web = ENV['GREBIGE_USERS'].split(' ')
        web_hours = hours.select { |login, _| web.include?(login) }
        web_hours.map { |login, time|
          [login, calc_days_since(time)]
        }.sort
      end


      private

      def calc_days_since(date)
        ((Time.now - date) / 60 / 60 / 24).floor
      end

      def hours
        json = open(ENV['GREBIGE_URL']).read
        hours = JSON.parse(json)
        hours = hours.select { |_, time| time }
        hours.hashmap { |login, time| [login, Time.parse(time.to_s)] }
      end
    end
  end
end
