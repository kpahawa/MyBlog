require 'securerandom'
class WelcomeController < ApplicationController
  def home
    @num = Contact.all.length
    @arr = Article.last

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
    @pic = Picture.last

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
end
