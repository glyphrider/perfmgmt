class User < ApplicationRecord
  has_many :meetings
  # belongs_to :supervisor, :class_name => 'User', :foreign_key => 'supervisor_id'
  has_many :reports, :class_name => 'User', :foreign_key => 'supervisor_id'
  has_many :authored_reviews, :class_name => 'Review', :foreign_key => 'author_id'
  has_many :reviews, :class_name => 'Review', :foreign_key => 'subject_id'
 
  def supervisor
    if supervisor_id
      User.find(supervisor_id)
    else
      nil
    end
  end

  def self.all_reports_with_or_without_a_meeting(current_user)
    current_user.reports.sort_by(&:last_meeting_time)
  end
  
  def last_meeting_time_for_view
    meetings.any? ? meetings.order('time desc').first.time.strftime("%m/%d %I:%M%p") : "none"
  end

  def last_meeting_time
    meetings.any? ? meetings.order('time desc').first.time : bogus_time
  end
  
  def bogus_time
    Time.current.beginning_of_year
  end
end
