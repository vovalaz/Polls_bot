class PollBot
  module CallbackHandler
    def handle_callback
      case MessageHandler.message.data
      when 'positive_answer'
        PollHandler.current_points += 3
      when 'neutral_answer'
        PollHandler.current_points += 2
      when 'negative_answer'
        PollHandler.current_points += 1
      when 'end_poll'
        PollHandler.is_polling_active = false
      when 'show_all_polls'
        kb_array = []
        PollHandler.polls.each do |poll|
          kb_array << MarkupButtons.create_inline_button(poll.title, "poll #{poll.id}")
        end
        Sender.send_inline_message('Виберіть опитування:', Sender.generate_inline_keyboard(kb_array))
      end
    end
    module_function(:handle_callback)
  end
end
