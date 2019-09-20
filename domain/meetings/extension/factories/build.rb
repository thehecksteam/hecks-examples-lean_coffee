module LeanCoffee
  module Domain
    module Meetings
      class Extension
        module Factories
          class Build
            def self.factory(args)
              Extension.new(
                yes_votes: args[:yes_votes],
                no_votes: args[:no_votes],
              )
            end
          end
        end
      end
    end
  end
end
