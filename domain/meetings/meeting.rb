module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        include Support::Root
        include Support::DomainObject

        attr_reader :id, :phase, :discussion, :timebox, :id

        def initialize(id: nil, phase: nil, participants:, discussion:, timebox:)
          @id = id
          @phase = phase
          @participants = participants
          @discussion = discussion
          @timebox = timebox
        end

        def participants
          @participants.clone.freeze
        end

        private

        attr_writer :id, :phase, :participants, :discussion, :timebox
      end
    end
  end
end
