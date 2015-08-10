class AddDateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :date, :date

  end

  protected
  def assign_date
    self.date = Date.current
  end
end