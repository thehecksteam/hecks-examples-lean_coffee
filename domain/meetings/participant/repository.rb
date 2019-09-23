
module LeanCoffee
  module Domain
    module Meetings
      class Participant
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(participant)
            instance.fetch(participant)
          end

          def initialize
            @objects = {}
          end

          def self.create(participant)
            instance.create(participant)
          end

          def create(participant)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.default(participant)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(participant)
            domain_object = participant
            @objects[participant.hash] = domain_object

            participant.instance_eval do
              @id = participant.hash
            end

            participant
          end
        end
      end
    end
  end
end
