class Review < ApplicationRecord
  belongs_to :author, :class_name => 'User'
  belongs_to :subject, :class_name => 'User'
end
