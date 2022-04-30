require_relative './question'
require 'json'

class Poll
  attr_accessor :title, :questions, :len, :id

  @@count = 0
  def initialize(title = '', questions = [])
    @@count += 1
    self.id = @@count
    self.title = title
    self.questions = questions
    self.len = questions.length
  end

  def init_from_file(path)
    file = File.read(path)
    data_hash = JSON.parse(file)
    self.title = data_hash['title']
    data_hash['questions'].each do |question|
      @questions.append(Question.new(question['question_text'], question['answer'], question['variants']))
    end
    self
  end
end
