class PollBot
  module StandartHandler
    def handle_standart
      case MessageHandler.message.text
      when '/start'
        Sender.send_inline_message("Привіт, #{MessageHandler.message.from.first_name}",
                                   Sender.generate_inline_keyboard(MarkupButtons::SHOW_ALL_POLLS_INLINE))
      when '/stop'
        Sender.send_inline_message("Бувайте, #{MessageHandler.message.from.first_name}", MarkupButtons::DELETE_KEYBOARD)
      when '/choosepoll'
        kb_array = []
        PollHandler.polls.each do |_poll|
          kb_array << MarkupButtons.create_inline_button(_poll.title, "poll #{_poll.id}")
        end
        Sender.send_inline_message('Виберіть опитування:', Sender.generate_inline_keyboard(kb_array))
      when '/restart'
        Sender.send_inline_message("Привіт, #{MessageHandler.message.from.first_name}, нікому не кажи але я вболіваю за тебе",
                                   Sender.generate_inline_keyboard(MarkupButtons::SHOW_ALL_POLLS_INLINE))
      end
    end
    module_function(:handle_standart)
  end
end
