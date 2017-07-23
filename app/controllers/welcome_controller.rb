require 'securerandom'
class WelcomeController < ApplicationController
  def home

  end

  def contact
   @word = generateNew
  end
end
