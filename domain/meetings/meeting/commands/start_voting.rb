module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class StartVoting
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              @meeting.instance_eval { @phase = :voting }
              self
            end
          end
        end
      end
    end
  end
end
