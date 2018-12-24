json.extract! course, :id, :name, :level, :start_date, :fee, :created_at, :updated_at
json.url course_url(course, format: :json)
