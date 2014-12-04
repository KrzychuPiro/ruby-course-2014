require 'test/unit'
Dir.foreach('spec/unit') { |file| require_relative "unit/#{file}" if %r{(\w)+_spec\.rb}.match(file) }

