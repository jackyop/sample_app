# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	attr_accessible :name,  :email, :password, :passsword_confirmation
	#attr_accessor :password,:passsword_confirmation
	# /0***Lines for the hash password
	 has_secure_password
  validates :password,:length => { :minimum => 5 }
  validates_confirmation_of :password
  #end of Lines for the hash password (se requiere user.authenticate(password) para acceder al password  )
	before_save{ |user| user.email=email.downcase }
	validates(:name, presence: true,length:{maximum:50})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:false})
	#validates(:password, presence:true, length:{maximum:50})
	#validates(:passsword_confirmation,presence:true)
end
