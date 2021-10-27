class SearchRecordsService
  def self.search(search,id)
    if search != ""
      Record.where('day LIKE(?) AND user_id LIKE(?)',"%#{search}%","%#{id}%")
    else
      Record.where('user_id LIKE(?)',"%#{id}%")
    end
  end
end
 