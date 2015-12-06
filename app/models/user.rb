class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy


has_attached_file :avatar,
  :styles => {
    :thumb  => "60x60>",
    :small  => "80x80>",
    :medium => "140x140>",
    :large  => "300x300>"},
  :default_url => "/images/default_avatar_:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
