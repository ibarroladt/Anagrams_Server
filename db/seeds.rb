def get_words
  words_array = []
  File.open('/usr/share/dict/words').each do |line|
    words_array << line.chomp
  end
  words_array
end

get_words.each do |item|
  Word.create!(:word => item)
end
