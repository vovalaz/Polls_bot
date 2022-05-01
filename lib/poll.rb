require_relative './question'
require 'json'

class Poll
  attr_accessor :title, :questions, :id, :recommendations

  @@count = 0
  def initialize(title = '', questions = [])
    self.id = @@count
    @@count += 1
    self.title = title
    self.questions = questions
  end

  def init_from_file(path)
    file = File.read(path)
    data_hash = JSON.parse(file)
    self.title = data_hash['title']
    data_hash['questions'].each do |question|
      @questions.append(Question.new(question['question_text'], question['answer'], question['variants']))
    end
    self.recommendations = data_hash['recommendations']
    self
  end
end
