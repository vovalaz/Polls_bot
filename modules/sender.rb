class PollBot
  module Sender
    def send_std_message(text)
      chat = (defined? MessageHandler.message.chat.id) ? MessageHandler.message.chat.id : MessageHandler.message.from.id
      MessageHandler.bot.api.send_message(
        chat_id: chat,
        text: text
      )
    end

    def send_inline_message(text, keyboard_mrkp)
      chat = (defined? MessageHandler.message.chat.id) ? MessageHandler.message.chat.id : MessageHandler.message.from.id
      MessageHandler.bot.api.send_message(
        chat_id: chat,
        text: text,
        reply_markup: keyboard_mrkp
      )
    end

    def generate_inline_keyboard(buttons)
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
    end

    def generate_reply_keyboard(buttons)
      Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons)
    end

    module_function(
      :send_std_message,
      :send_inline_message,
      :generate_inline_keyboard,
      :generate_reply_keyboard
    )
  end
end
