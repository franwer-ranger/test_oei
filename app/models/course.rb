class Course < ApplicationRecord
  belongs_to :topic
  belongs_to :edition
end
