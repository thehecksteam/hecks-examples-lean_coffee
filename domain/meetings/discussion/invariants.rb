Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }
module LeanCoffee
  module Domain
    module Meetings
      class Discussion
        module Invariants
        end
      end
    end
  end
end