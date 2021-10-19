class Record < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ""
      Record.where('day LIKE(?)',"%#{search}%")
    else
      Record.all
    end
  end
end
