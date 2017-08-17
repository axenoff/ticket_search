class SittingWagon < Wagon
  validates :sitting_places, presence: true
end