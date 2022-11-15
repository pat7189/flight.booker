# frozen_string_literal:true

module ApplicationHelper
  def convert_dates_to_datetime(date)
    if date.present?
      Date.parse(date)
    else
      Time.zone.today
    end
  end
end
