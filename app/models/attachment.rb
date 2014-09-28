class Attachment < ActiveRecord::Base
	belongs_to :attachable, polymorphic: true

has_attached_file :attachment, 
		:styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "50x50>" },
		:default_url => "/images/Dummy.jpg", 
		:s3_permissions => :public_read,
		:storage => :s3,
		:s3_credentials => YAML.load_file("config/aws.yml")

	validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
