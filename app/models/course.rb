class Course < ApplicationRecord
  belongs_to :topic
  belongs_to :edition

  def start_date
    self.edition.parsed_date
  end
end
