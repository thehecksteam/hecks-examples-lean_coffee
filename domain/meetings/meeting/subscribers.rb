Dir[File.dirname(__FILE__) + '/subscribers/*.rb'].each { |file| require_relative file }
module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Subscribers
        end
      end
    end
  end
end
