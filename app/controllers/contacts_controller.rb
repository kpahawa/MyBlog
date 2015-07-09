require 'pry'
class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contacts = Contact.all
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    @word = generateNew()
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    #binding.pry

    if @contact.first.blank? || @contact.last.blank? || @contact.email.blank? || @contact[:message].blank?
      flash[:error]= "Your message was unsuccessful. Please check your message fields"
    else
      @contact.save
      respond_with(@contact)
    end
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:first, :last, :email, :subscribed, :message)
    end

    def generateNew
      r = Random.new
      start = r.rand(3...5)
      sec = SecureRandom.hex(5)
      endIndex = start + 4
      @word = sec[start..endIndex]
      return @word
    end
end
