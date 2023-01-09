class HashtagParser
  def self.parse(text)
    text.scan(/#[\p{Word}-]+/i).map { |word| word.slice(1..) }
  end
end
