class Attachment < ActiveRecord::Base
	belongs_to :attachable, polymorphic: true

	has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
