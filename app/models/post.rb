class Post < ActiveRecord::Base
  belongs_to :users

  rails_admin do
    configure :user do
      label 'Author of the post: '
    end
  end

  validates :author, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
