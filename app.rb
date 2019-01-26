require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'router.rb'

Router.new.perform
