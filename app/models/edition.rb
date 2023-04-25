class Edition < ApplicationRecord
  has_many :courses

  def parsed_date
    start_date.strftime("%Y-%m-%d")
  end
end
