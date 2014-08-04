class Photo < ActiveRecord::Base
  belongs_to :mini

  has_attached_file :image,
  :storage => :s3,
  :bucket => 'paint_tracker',
  :path => '/:class/:attachment/:id_partition/:style/:filename',
  :s3_credentials => YAML.load_file(Rails.root.join('config', 'aws.yml'))[Rails.env],
  :styles => {
    :thumb => "100x100>",
    :medium => "300x300>"
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
