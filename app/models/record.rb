class Record < ApplicationRecord
  belongs_to :user

  validates :day_time, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  # VALID_TIME_REGEX = /\A([01][0-9]|2[0-3]):[0-5][0-9]\Z/
  # validates :finish_time, format: { with: VALID_TIME_REGEX }

  
  validate :chack_time 

  def chack_time 
      if begin_time != nil && finish_time != nil
        errors.add(:begin_time, "登録できません")if begin_time > finish_time
      end
  end
  
  def self.search(search,id)
    if search != ""
      Record.where('day_time LIKE(?) AND user_id LIKE(?)',"%#{search}%","%#{id}%").order('day_time')
    else
      Record.where('user_id LIKE(?)',"%#{id}%").order('day_time')
    end
  end
end
