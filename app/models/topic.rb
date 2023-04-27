class Topic < ApplicationRecord
  belongs_to :school
  has_many :courses

  def parametrized_name
    name.parameterize
  end
end
