class Poll
  attr_accessor :title, :questions, :len, :id

  @@count = 0
  def initialize(title, questions = [])
    @@count += 1
    self.id = @@count
    self.title = title
    self.questions = questions
    self.len = questions.length
  end

  def add_question(text)
    questions << text
    self.len = questions.length
  end
end
