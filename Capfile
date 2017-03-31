# frozen_string_literal: true

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
require 'capistrano/puma'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

install_plugin Capistrano::Puma # Default puma tasks
install_plugin Capistrano::SCM::Git

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
