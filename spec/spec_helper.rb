require 'spork'
require 'resque'
require 'resque/job'
require 'resque/plugins/waiting-room'

Spork.prefork do
  spec_dir = File.dirname(__FILE__)
  lib_dir  = File.expand_path(File.join(spec_dir, '..', 'lib'))
  $:.unshift(lib_dir)
  $:.uniq!
  RSpec.configure do |config|
    config.mock_framework = :rspec
  end

  # Require ruby files in support dir.
  Dir[File.expand_path('spec/support/*.rb')].each { |file| require file }
end