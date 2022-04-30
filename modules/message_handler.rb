class PollBot
  module MessageHandler
    attr_accessor :message, :bot

    def handle_msg(message, bot)
      self.message = message
      self.bot = bot

      case message
      when Telegram::Bot::Types::CallbackQuery
        CallbackHandler.handle_callback
      when Telegram::Bot::Types::Message
        StandartHandler.handle_standart
      end
    end

    module_function(:handle_msg, :message, :message=, :bot, :bot=)
  end
end
