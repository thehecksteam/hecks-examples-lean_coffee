Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module LeanCoffee
  module Domain
    module Meetings
      class Topic
        module Factories
        end
      end
    end
  end
  end