class PollBot
  module CallbackHandler
    def handle_callback
      case MessageHandler.message.data
      when 'end_poll'
        PollHandler.end_polling
      when 'show_all_polls'
        kb_array = []
        PollHandler.polls.each do |poll|
          kb_array << MarkupButtons.create_inline_button(poll.title, "poll #{poll.id}")
        end
        Sender.send_inline_message('Виберіть опитування:', Sender.generate_inline_keyboard(kb_array))
      else
        msg = MessageHandler.message.data.split
        if msg.length == 2 && msg[0] == 'poll'
          PollHandler.select_poll(msg[1].to_i)
        elsif msg.length == 3 && msg[0] == 'check_answer'
          question_index = msg[1].to_i
          guessed_var = msg[2]
          unless !PollHandler.poll_active || PollHandler.processed_questions.include?(question_index) || PollHandler.current_points.nil?
            PollHandler.current_points += 1 if PollHandler.picked_poll.questions[question_index].answer == guessed_var
            PollHandler.processed_questions.append(question_index)
            PollHandler.next_question
          end
        end
      end
    end
    module_function(:handle_callback)
  end
end
