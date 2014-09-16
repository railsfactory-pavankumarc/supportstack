class Attachment < ActiveRecord::Base
	belongs_to :attachable, polymorphic: true

	has_attached_file :attachment, :styles => { :medium => "140x140#", :small => "80x80#", :medium_small => "100x100#" }, :default_url => "/images/Dummy.jpg"
	validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
