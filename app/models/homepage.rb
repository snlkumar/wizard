class Homepage < ActiveRecord::Base
  def self.search(search_item)
    if search_item
      self.where('section LIKE ?', "%#{search_item}%")
    else
    self.all
    end
  end

end
