json.extract! review, :id, :rating, :comment, :user_id, :milk_id, :created_at, :updated_at
json.url review_url(review, format: :json)