# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :console do
  require 'bundler/setup'
  require 'aoc2020'
  require 'pry'
  Pry.start
end
