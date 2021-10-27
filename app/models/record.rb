class Record < ApplicationRecord
  belongs_to :user

  validates :day, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  # VALID_TIME_REGEX = /\A([01][0-9]|2[0-3]):[0-5][0-9]\Z/
  # validates :finish, format: { with: VALID_TIME_REGEX }
  validate :chack_time

  def chack_time 
      errors.add(:begin, "登録できません") 
      unless self.begin < self.finish
  end


  # def self.chack_time(id)
  #   @usre_record = Record.find(id)
  #   unless 
  #     @usre_record.begin > @usre_record.finish
  #   end 
  # end
  


  def self.search(search,id)
    if search != ""
      Record.where('day LIKE(?) AND user_id LIKE(?)',"%#{search}%","%#{id}%").order('day')
    else
      Record.where('user_id LIKE(?)',"%#{id}%").order('day')
    end
  end
end
