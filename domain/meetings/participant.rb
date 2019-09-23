module LeanCoffee
  module Domain
    module Meetings
      class Participant
        
        include Support::DomainObject

        attr_reader :id, :remaining_votes, :user, :id

        def initialize(id: nil, remaining_votes:, topic_votes: [], user:)
          @id = id
          @remaining_votes = remaining_votes
          @topic_votes = topic_votes
          @user = user
        end

        def topic_votes
          @topic_votes.clone.freeze
        end

        private

        attr_writer :id, :remaining_votes, :topic_votes, :user
      end
    end
  end
end
