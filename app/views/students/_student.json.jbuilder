json.extract! student, :id, :dni, :number, :name, :last_name, :created_at, :updated_at
json.url student_url(student, format: :json)
