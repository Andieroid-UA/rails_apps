class EventParticipant < ApplicationRecord
  #validations tba
  belongs_to :user
  belongs_to :event
end
