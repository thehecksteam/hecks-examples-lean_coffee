module LeanCoffee
  module Domain
    module Meetings
      class Participant
        
        include Support::DomainObject

        attr_reader :remaining_votes, :user

        def initialize(remaining_votes:, topic_votes: [], user:)
          @remaining_votes = remaining_votes
          @topic_votes = topic_votes
          @user = user
        end

        def topic_votes
          @topic_votes.clone.freeze
        end

        private

        attr_writer :remaining_votes, :topic_votes, :user
      end
    end
  end
end
