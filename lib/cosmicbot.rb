# coding: utf-8
require 'rubygems'
require 'bundler/setup'

require "dotenv"
require "cinch"
require "meuh/cinch_plugin"

Dotenv.load

require "cosmicbot/version"
require "cosmicbot/hash_addons"
require "cosmicbot/grebige"
require "cosmicbot/bot"
