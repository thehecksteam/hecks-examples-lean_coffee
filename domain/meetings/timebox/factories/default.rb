module LeanCoffee::Domain::Meetings
  class Timebox
    module Factories
      class Default
        def self.factory(args = {})
          Timebox.new(args)
        end
      end
    end
  end
end