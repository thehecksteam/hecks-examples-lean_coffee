
module LeanCoffee
  module Domain
    module Meetings
      class Discussion
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(discussion)
            instance.fetch(discussion)
          end

          def initialize
            @objects = {}
          end

          def self.create(discussion)
            instance.create(discussion)
          end

          def self.all
            instance.all
          end

          def self.destroy(discussion)
            instance.destroy(discussion)
          end

          def all
            @objects.values
          end

          def destroy(discussion)
            @objects.delete(discussion.id)
          end

          def create(discussion)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.build(discussion)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(discussion)
            domain_object = discussion
            @objects[discussion.hash] = domain_object

            discussion.instance_eval do
              @id = discussion.hash
            end

            discussion
          end
        end
      end
    end
  end
end