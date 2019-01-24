json.extract! meeting, :id, :direct_report_id, :notes, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
