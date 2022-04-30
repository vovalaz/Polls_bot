class PollBot
  module PollHandler
    attr_accessor :polls, :current_points, :is_polling_active

    def init_polls
      self.is_polling_active = false
      self.current_points = 0
      self.polls = []
      paths = Dir['./resources/*']
      paths.each do |path|
        polls.append(Poll.new().init_from_file(path))
      end
    end

    def next_question
      Sender.send_inline_message
    end

    module_function(
      :init_polls,
      :polls,
      :polls=,
      :current_points,
      :current_points=,
      :is_polling_active,
      :is_polling_active=,
      :next_question
    )
  end
end
