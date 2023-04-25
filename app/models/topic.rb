class Topic < ApplicationRecord
  belongs_to :school

  def parametrized_name
    name.parameterize
  end
end
