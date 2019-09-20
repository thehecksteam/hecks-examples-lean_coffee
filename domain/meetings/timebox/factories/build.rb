module LeanCoffee
  module Domain
    module Meetings
      class Timebox
        module Factories
          class Build
            def self.factory(args)
              Timebox.new(
                voting_duration: args[:voting_duration],
                collection_duration: args[:collection_duration],
                ordering_duration: args[:ordering_duration],
                topic_discussion_duration: args[:topic_discussion_duration],
                topic_extension_duration: args[:topic_extension_duration],
              )
            end
          end
        end
      end
    end
  end
end
