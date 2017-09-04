class Ticket < ApplicationRecord
  belongs_to :train, optional: true
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id
  belongs_to :user, optional: true

  after_create :send_notification

  before_destroy :send_notification_delete

  def route_name
    "#{start_station.title} - #{finish_station.title}"
  end

  private
  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_delete
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
