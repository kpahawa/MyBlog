require 'pry'
class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html

  $storage = nil
  $errors=0
  def index
    @contacts = Contact.all
    respond_with(@contacts)
    #@word = generateNew
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    $storage = generateNew
    @word = $storage
    @errors = $errors
    $errors = 0
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
    @word = $storage
      if @word == params[:contact][:skey]
        if @contact.save
          $errors = -1
          format.html { redirect_to :back, notice: 'Thanks for the message!' }
          format.json { redirect_to :back, status: :created, location: @contact }
        else
          $errors = @contact.errors.messages
          format.html { redirect_to :back, notice: 'Error, Invalid Entry, or you are on the List Already!', :locals => @contact.errors }
          format.json { redirect_to :back, @contact.errors }
        end
      else
        $errors = 1
        format.html { redirect_to :back, notice: 'Error, Invalid Entry, or you are on the List Already!',:locals => @contact.errors}
        format.json { redirect_to :back, @contact.errors }
      end
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

  def return_word
    @word = generateNew
  end

  private
    def generateNew
      r = Random.new
      start = r.rand(3...5)
      sec = SecureRandom.hex(5)
      endIndex = start + 4
      @word = sec[start..endIndex]
    end
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:first, :last, :email, :subscribed, :message,:skey)
    end
end
