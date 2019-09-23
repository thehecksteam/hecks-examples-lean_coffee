module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class AddParticipantToMeeting
            attr_reader :root, :args

            def initialize(root, args = {})
              @root = root
              @args = args
            end

            def call
              user = @args[:user]
              @root.instance_eval do
                @participants << LeanCoffee::Domain::Meetings::Participant.build(
                  topic_votes: [],
                  user: user,
                  remaining_votes: 5
                )
              end
            end
          end
        end
      end
    end
  end
end
