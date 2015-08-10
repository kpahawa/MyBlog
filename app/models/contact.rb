require 'pry'
class Contact < ActiveRecord::Base
  #include ContactsController

  attr_accessor :skey
  before_validation :downcase_email
  # validates :first, presence: true, length: {minimum: 2}, message: "Need a full name!"
  # validates :last, presence: true, length: {minimum: 2}, message: "Need a full name!"
  # validates :email, presence: true, length: {minimum: 2}
  validates_presence_of :message
  validates :message, length: {minimum: 2}
  validates_format_of :email,:with => Devise::email_regexp
  validates_presence_of :first, :message => "Name can't be blank"
  validates_presence_of :last, :message => "Name can't be blank"
  validates_presence_of :email, :message => "Need an Email!!"
  # @word = return_word
  # validates_with
  # def word_matches?
  #   @word = return_word#
  #   if self.skey == @word
  #   end
  # end
  private
  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end

end
