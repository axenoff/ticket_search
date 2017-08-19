class Wagon < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :from_head, -> { order(:number) }
  scope :from_tail, -> { order(number: :desc) }

private
  def set_number
    train = Train.find(train_id)
    if train.wagons.empty?
      self.number = 1
    else
      self.number = train.wagons.last.number + 1
    end
  end
end
