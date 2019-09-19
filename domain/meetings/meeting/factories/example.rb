module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Factories
          class Example
            def self.factory
              LeanCoffee::Domain::Meetings::Meeting.default(
                allowed_votes: 5,
                phase: :voting,
                timebox: { voting_duration: 0, collection_duration: 0, ordering_duration: 0, topic_discussion_duration: 0, topic_extension_duration: 0 },
                participants: [{ name: 'Angie' }, { name: 'Chris' }],
              )
            end
          end
        end
      end
    end
  end
end