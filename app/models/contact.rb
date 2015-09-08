require 'pry'
class Contact < ActiveRecord::Base
  #include ContactsController

  attr_accessor :skey
  before_validation :downcase_email

  validates_presence_of :message , :message => "Your message cannot be blank"
  validates :message, length: {minimum: 4, :message => "C'mon, I need a more complete message!" }
  validates_format_of :email,:with => Devise::email_regexp, :message => "Email must be formated correctly!"
  validates_presence_of :first, :message => "First Name can't be blank"
  validates_presence_of :last, :message => "Last Name can't be blank"
  validates :first, length: {minimum: 2, :message => "Need a full First name!" }
  validates :last, length: {minimum: 2, :message => "Need a full Last name!"}
  validates_presence_of :email, :message => "Need an email"

  private
  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end

end
