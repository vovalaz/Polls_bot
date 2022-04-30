class PollBot
  module Sender
    def send_std_message(text)
      MessageHandler.bot.api.send_message(
        chat_id: MessageHandler.message.chat.id,
        text: text
      )
    end

    def send_inline_message(text, keyboard_mrkp)
      MessageHandler.bot.api.send_message(
        chat_id: MessageHandler.message.chat.id,
        text: text,
        reply_markup: keyboard_mrkp
      )
    end

    def generate_inline_keyboard(buttons)
      return Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
    end

    module_function(
      :send_std_message,
      :send_inline_message,
      :generate_inline_keyboard
    )
  end
end
