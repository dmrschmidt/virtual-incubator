json.extract! question, :id, :user_id, :title, :text, :created_at, :updated_at
json.url question_url(question, format: :json)
