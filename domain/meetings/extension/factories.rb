Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module LeanCoffee
  module Domain
    module Meetings
      class Extension
        module Factories
        end
      end
    end
  end
  end