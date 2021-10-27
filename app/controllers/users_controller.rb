class UsersController < ApplicationController
  def show
    @records = Record.where("day LIKE?","%#{now_month}%").order('day')
    @record1 = Record.find_by(day:today , user_id:current_user.id)
  end
end


private

def today
  time = Time.now
  year = time.year
  month = time.month
  day = time.day
  "#{year}#{month}#{day}"
end
def now_month
  time = Time.now
  year = time.year
  month = time.month
  day = time.day
  "#{year}-#{month}"
end
