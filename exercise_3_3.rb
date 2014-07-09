# Mixing in modules
#[6] Create a method that returns today's date. Method name should be 'current_date'
# This method should be in a module called 'Generic'.
# Try mixing in this module into the Document class
# Now use this method to create another method that returns
# The tite of the document and today's date like below:
# "document_title 2014-06-22". This method should be called 'title_with_date'


#[7] we would like to add a function that replaces a word with another
# replace_word(old_word, new_word)

#Metaprogramming
#[8] instead of calling document.replace_word(old,new) we would like to be able to
# do something like this: document.replace_book('pen') where book is the old word
# and pen is the new word. This should work on any word (not just book).
# hint:  'method_missing'


module Generic	
    def current_date
		require 'time'
		time = Time.new
    	s = time.year.to_s + "-" + "#{time.month}" + "-" + "#{time.day}"
    end
end


class Document
    include Generic
    attr_accessor :author, :title, :content
	def initialize(attributes = {})
		@author = attributes[:author]
		@title  = attributes[:title]
		@content = attributes[:content]
	end

	def title_with_date
		res = @title + " " + current_date.to_s
	end

	def replace_word(old_word, new_word)
		array = @content.split
		res = "" 
		(array).each do |word|
			if word == old_word
				word = new_word
			end
			res = res + word + " "
		end
		@content = res
	end

end

a=Document.new(:author => "someone", :title => "my book", :content => "this is the content of my the book")
#r=a.title_with_date
#puts r

a.replace_word("the", "THE")
puts a.content
