require 'securerandom'
class WelcomeController < ApplicationController
  def home
    @num = Contact.all.length
  end

  def contact
   @word = generateNew
  end
end
