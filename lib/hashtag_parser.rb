class HashtagParser
  def self.parse(text)
    text.scan(/#[\w-]+/i).map { |word| word.slice(1..) }
  end
end
