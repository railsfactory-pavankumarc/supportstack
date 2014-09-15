class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
before_create 
has_many :attachments, as: :attachable
has_many :tickets
  belongs_to :department
  belongs_to :role
end
