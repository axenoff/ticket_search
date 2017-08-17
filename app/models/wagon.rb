class Wagon < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

private
  def set_number
    if self.train.wagons.empty?
      self.number = 1
    else
      self.number = self.train.wagons.last.number + 1
    end
  end
end
