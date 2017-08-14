class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets, foreign_key: :start_station_id
  has_many :tickets, foreign_key: :finish_station_id
  has_many :wagons

  def qtt_of(type_of_wagon)
    pass = []
    self.wagons.each do |wagon|
      pass << wagon if wagon.type_of_wagon == type_of_wagon
    end
    return pass.size
  end

  def seats_qtt(type_of_wagon, type_of_seats)
    qtt = 0
    if type_of_seats == 'bottom'
      self.wagons.each do |wagon|
        qtt += wagon.bottom_seats if wagon.type_of_wagon == type_of_wagon
      end
    elsif type_of_seats == 'top'
      self.wagons.each do |wagon|
        qtt += wagon.top_seats if wagon.type_of_wagon == type_of_wagon
      end
    end
    return qtt
  end
end
