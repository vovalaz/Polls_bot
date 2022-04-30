class PollBot
  module MarkupButtons
    POSITIVE_ANSWER = Telegram::Bot::Types::KeyboardButton.new(text: 'Згоден', callback_data: 'positive_answer')
    NEUTRAL_ANSWER = Telegram::Bot::Types::KeyboardButton.new(text: 'Складно відповісти',
                                                              callback_data: 'neutral_answer')
    NEGATIVE_ANSWER = Telegram::Bot::Types::KeyboardButton.new(text: 'Не згоден', callback_data: 'negative_answer')
    END_POLL_INLINE = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Закінчити опитування',
                                                                     callback_data: 'end_poll')
    SHOW_ALL_POLLS_INLINE = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Показати доступні опитування',
                                                                           callback_data: 'show_all_polls')
    DELETE_KEYBOARD = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)

    def create_button(button_text, callback_query)
      Telegram::Bot::Types::KeyboardButton.new(text: button_text, callback_data: callback_query)
    end

    def create_inline_button(button_text, callback_query)
      Telegram::Bot::Types::InlineKeyboardButton.new(text: button_text, callback_data: callback_query)
    end

    module_function(
      :create_button,
      :create_inline_button
    )
  end
end
