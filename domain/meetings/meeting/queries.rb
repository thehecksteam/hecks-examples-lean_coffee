Dir[File.dirname(__FILE__) + '/queries/*.rb'].each { |file| require_relative file }
module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Queries
        end
      end
    end
  end
end