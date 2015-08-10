class Article < ActiveRecord::Base
  after_save :assign_date

  protected

  def assign_date
    self.date = Date.current
  end
end
