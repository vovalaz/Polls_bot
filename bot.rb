require 'telegram/bot'

Dir['./modules/*.rb'].sort.each { |file| require file }
Dir['./lib/*.rb'].sort.each { |file| require file }

class PollBot
  def initialize
    token = '5017665973:AAGmKIRk82Da5WdS_KW9qdY94ren9bSUt2Y'
    PollHandler.init_polls
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        MessageHandler.handle_msg(message, bot)
      end
    end
  end
end

PollBot.new
