class Question
  attr_accessor :question_text, :answer, :variants

  def initialize(text, answer, vars)
    self.question_text = text
    self.answer = answer
    self.variants = vars
  end
end
