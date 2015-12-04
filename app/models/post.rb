class Post < ActiveRecord::Base
  belongs_to :users

  validates :author, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
