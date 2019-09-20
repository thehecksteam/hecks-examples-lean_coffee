module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Factories
          class Default
            def self.factory(args = {})
              allowed_votes = args.delete(:allowed_votes)

              Meeting.new(
                args.merge(
                  participants: args[:participants].map do |participant|
                    Participant.new(
                      name: participant[:name],
                      remaining_votes: allowed_votes
                    )
                  end,
                  discussion: Discussion.default,
                  timebox: args[:timebox].is_a?(Hash) ? Timebox.default(args[:timebox]) : args[:timebox],
                  phase: :waiting
                )
              )
            end
          end
        end
      end
    end
  end
end