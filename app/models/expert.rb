class Expert < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  

  validates_presence_of :first_name, :last_name, :license_number, :specialty, :website

  validates :phone, presence: {message: 'Enter valid Mobile Number'},
                      numericality: true,
                      length: { minimum: 10, maximum: 15 }

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 

  has_attached_file :image, styles: { tiny: "25x25#",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  attr_writer :remove_image
  
  before_save :before_save_callback

  def remove_image
    @remove_image || false
  end

    def before_save_callback
        self.image.clear if self.remove_image == '1'
    end

end
