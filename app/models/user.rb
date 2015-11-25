class User < ActiveRecord::Base
	before_validation { self.email_for_index = email.downcase }
	before_create do
		self.usercd = (self.name)[0,6]
		if 0 == User.count
			self.usercd = "1"
		else
			dummycd = User.maximum(:usercd).to_i + 1
			self.usercd = dummycd.to_s
		end
	end
	before_create :create_remember_token

#  validates :usercd,          presence:true, length: { is: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email_for_index, presence:true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :email, presence:true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :name,  presence:true, length: { maximum: 50 }
  validates :f_address,       presence:true
  validates :city,            length: { maximum: 50 }
  validates :prefecturecd,    presence:true
  validates :f_sex,           presence:true
  validates :sex,             presence:true, length: { is: 1 }
  validates :f_year,          presence:true
  validates :f_birthday,      presence:true
#  validates :birthday,        presence:true
  validates_date :birthday,		format: '%Y/%m/%d'
  validates :f_origin_place,  presence:true
  validates :f_hobby,         presence:true
  validates :hobby1,          length: { maximum: 30 }
  validates :hobby2,          length: { maximum: 30 }
  validates :hobby3,          length: { maximum: 30 }
  validates :hobby4,          length: { maximum: 30 }
  validates :hobby5,          length: { maximum: 30 }
  validates :f_occupation,    presence:true
  validates :occupation,      length: { maximum: 30 }
  validates :genus,           length: { maximum: 30 }
  validates :f_genus,         presence:true
  validates :introduction,    length: { maximum: 1000 }

	#remember_token属性作成に必要
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

	#remember_token属性作成に必要
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

		#remember_token属性作成に必要
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
