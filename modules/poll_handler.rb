class PollBot
  module PollHandler
    attr_accessor :polls, :current_points, :question_index, :processed_questions, :picked_poll

    def init_polls
      self.processed_questions = []
      self.polls = []
      self.current_points = 0
      paths = Dir['./resources/*']
      paths.each do |path|
        polls.append(Poll.new.init_from_file(path))
      end
      self.picked_poll = polls[0]
    end

    def select_poll(index)
      self.processed_questions = []
      self.current_points = 0
      self.picked_poll = polls[index]
      self.question_index = -1
      Sender.send_std_message("Вибрано опитування #{polls[index].title}")
      next_question
    end

    def next_question
      self.question_index += 1
      if question_index < picked_poll.questions.length
        kb = []
        picked_poll.questions[question_index].variants.each do |variant|
          kb.append(MarkupButtons.create_inline_button(variant, "check_answer #{variant[0]}"))
        end
        kb.append(MarkupButtons::END_POLL_INLINE)
        Sender.send_inline_message(picked_poll.questions[question_index].question_text,
                                   Sender.generate_inline_keyboard(kb))
      else
        end_polling
      end
    end

    def end_polling
      if current_points < (picked_poll.questions.length * 0.7)
        kb = []
        picked_poll.recommendations.each do |url|
          kb.append(MarkupButtons.create_recommendation(url, url))
        end
        Sender.send_inline_message(
          "Непоганий результат: #{current_points}/#{picked_poll.questions.length}, ось декілька ресурсів щоб його покращити:",
          Sender.generate_inline_keyboard(kb)
        )
        Sender.send_std_message('/restart щоб пройти інше опитування')
      else
        Sender.send_std_message("Прекрасний результат: #{current_points}/#{picked_poll.questions.length}\n/restart щоб пройти інше опитування")
      end
    end

    module_function(
      :init_polls,
      :polls,
      :polls=,
      :current_points,
      :current_points=,
      :question_index,
      :question_index=,
      :picked_poll,
      :picked_poll=,
      :processed_questions,
      :processed_questions=,
      :select_poll,
      :next_question,
      :end_polling
    )
  end
end
