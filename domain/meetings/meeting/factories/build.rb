module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Factories
          class Build
            def self.factory(args)
              Meeting.new(
                id: args[:id],
                phase: args[:phase],
                participants: (args[:participants] || []).map do |object|
                  object.is_a?(Hash) ? Participant.build(object) : object
                end,
                discussion: args[:discussion].is_a?(Hash) ? Discussion.build(args[:discussion]) : args[:discussion],
                timebox: args[:timebox].is_a?(Hash) ? Timebox.build(args[:timebox]) : args[:timebox],
              )
            end
          end
        end
      end
    end
  end
end
