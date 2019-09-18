module LeanCoffee
  module Meetings
    class Meeting
      module Subscribers
        class TopicDiscussionTimeboxEnded
          def self.domain_event
            LeanCoffee::Domain::Meetings::Meeting::Events::TopicDiscussionTimeboxEnded
          end

          def self.notify(event)
            event.root.wait_for_extension_vote!
          end

          Support::Events::DomainEventPublisher.subscribe(self)
        end
      end
    end
  end
end