class DirectReport < ApplicationRecord
  has_many :meetings
  def self.everybody_with_or_without_a_meeting
    all.sort_by(&:last_meeting_time)
  end
  
  def last_meeting_time_for_view
		meetings.any? ? meetings.last.time : "none"
	end

  def last_meeting_time
    meetings.any? ? meetings.last.time : bogus_time
  end
  
  def bogus_time
    Time.current.beginning_of_year
  end
end
