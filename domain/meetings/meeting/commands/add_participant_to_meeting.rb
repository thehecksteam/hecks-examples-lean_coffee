module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class AddParticipantToMeeting
            attr_reader :root, :args

            def initialize(root)
              @root = root
            end

            def call
            end
          end
        end
      end
    end
  end
end
