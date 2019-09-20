module LeanCoffee
  module Domain
    module Meetings
      class Topic
        module Factories
          class Build
            def self.factory(args)
              Topic.new(
                value: args[:value],
                votes: args[:votes],
                timebox: args[:timebox].is_a?(Hash) ? TopicTimebox.build(args[:timebox]) : args[:timebox],
              )
            end
          end
        end
      end
    end
  end
end
