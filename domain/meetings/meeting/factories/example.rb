module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Factories
          class Example
            def self.factory(participants:)
              LeanCoffee::Domain::Meetings::Meeting.build(
                phase: :waiting,
                discussion: Discussion.new,
                timebox: {
                  voting_duration: 0,
                  collection_duration: 0,
                  ordering_duration: 0,
                  topic_discussion_duration: 0,
                  topic_extension_duration: 0
                },
                participants: participants
              )
            end
          end
        end
      end
    end
  end
end