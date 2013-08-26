get '/' do
  @new_word = params[:new_word]
  # Look in app/views/index.erb
  erb :index
end

post '/new_word' do

  # anagram = params[:user_word]

  # method(anagram)
  # redirect to ("/?#{params[:user_word]}")
  redirect to ("/#{params[:user_word]}")
end

get '/:new_word' do
  @new_word = params[:new_word]
  word = params[:new_word]
  anagrams = anagrams_for(word)

  # anagrams.first.word
  anagrams_array = []
  anagrams.each do |anagram|
     anagrams_array << anagram.word
  end
  @result = anagrams_array.join(", ")
  # "#{params[:new_word]}"
  erb :index
end


def sorter(word)
  word.split("").sort.join("")
end
 
 
def anagrams_for(word)
  sorted_word = sorter(word.downcase)
  Word.all.select do |element|
    sorter(element[:word].downcase) == sorted_word 
  end
end


# def anagrams_for(word, dictionary)
#   sorted_word = sorter(word.downcase)
#   dictionary.select { |word| sorter(word.downcase) == sorted_word }
# end
