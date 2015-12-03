class Event < ActiveRecord::Base
	belongs_to :user
	before_create do
		if 0 == Event.count
			self.eventcd = "1"
		else
			dummycd = Event.maximum(:eventcd).to_i + 1
			self.eventcd = dummycd.to_s
		end
		self.limit_date = self.public_date + 90
	end

  validates :subject,     presence:true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }
  validates :typeno,        presence:true
  validates :key1,          length: { maximum: 30 }
  validates :key2,          length: { maximum: 30 }
  validates :key3,          length: { maximum: 30 }
  validates :key4,          length: { maximum: 30 }
  validates :key5,          length: { maximum: 30 }
  validates_date :public_date,		format: '%Y/%m/%d'
  validates_date :end_date,		format: '%Y/%m/%d'
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "は公開日以降を設定して下さい。") if self.public_date > self.end_date
    errors.add(:end_date, "は２ヶ月以内の日付を設定して下さい。") if self.public_date + 65 < self.end_date
  end 

end
