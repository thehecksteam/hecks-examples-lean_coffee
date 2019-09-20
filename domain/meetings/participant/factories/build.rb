module LeanCoffee
  module Domain
    module Meetings
      class Participant
        module Factories
          class Build
            def self.factory(args)
              Participant.new(
                name: args[:name],
                remaining_votes: args[:remaining_votes],
                topic_votes: (args[:topic_votes] || []).map do |object|
                  object.is_a?(Hash) ? Topic.build(object) : object
                end,
              )
            end
          end
        end
      end
    end
  end
end
