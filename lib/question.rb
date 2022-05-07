class Question
  attr_accessor :question_text, :answer, :variants, :id

  def initialize(text, answer, vars, id)
    self.question_text = text
    self.answer = answer
    self.variants = vars
    self.id = id
  end
end
