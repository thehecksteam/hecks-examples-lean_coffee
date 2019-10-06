Dir[File.dirname(__FILE__) + '/events/*.rb'].each { |file| require_relative file }
module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Events
        end
      end
    end
  end
end