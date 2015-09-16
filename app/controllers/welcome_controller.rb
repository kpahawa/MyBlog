require 'securerandom'
class WelcomeController < ApplicationController
  def home
    @num = Contact.all.length
    @articles = Article.all
    @arr = Array.new
    x = 0
    for i in 0...@articles.size
      @arr.push(@articles[i ])
      x+=1
      if x == 5
        break
      end
    end

    @projects = Project.all
    @proj = Array.new
    x = 0
    for j in 0...@projects.size
      @proj.push(@projects[j])
      x+=1
      if x == 5
        break
      end
    end


    @pictures = Picture.all
    @pics = Array.new
    x = 0
    for j in 0...@pictures.size
      @pics.push(@pictures[j])
      x+=1
      if x == 6
        break
      end
    end
  end

  def contact
   @word = generateNew
  end

  private
    def generateNew
      r = Random.new
      start = r.rand(3...5)
      sec = SecureRandom.hex(5)
      endIndex = start + 4
      @word = sec[start..endIndex]
      return @word
    end

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:first, :last, :email, :subscribed, :message)
    end
end
