class Round
  PARTS_BOTTOM_UP = [
    # 'toes','feet','ankles','shins','calves','knees','back of your thighs',
    'front of your thighs','buttocks','back','low back','mid back',
    # 'upper back','groin','stomach','mid torso','chest','hands',
    # 'wrists','inside forearms','outside forearms','elbows','upper arms',
    # 'shoulders','neck','jaw','cheeks','eyes','forehead','back of your head',
    # 'top of your head','whole head','whole body'
  ]
  PARTS_TOP_DOWN = PARTS_BOTTOM_UP[0..-3].reverse + ['whole body']
  FOCUS_LINES = [
    'move your focus to your',
    'focus on your',
    'and now your'
  ]
  def initialize(duration, start_at)
    @parts = start_at&.include?('top') ? PARTS_TOP_DOWN : PARTS_BOTTOM_UP
    @break_length = break_seconds(duration)
  end

  def run
    count_down
    @start_time = Time.now
    puts "Starting at #{@start_time}"

    @parts.each_with_index do |part, index|
      give_instruction_for(part)
      print_time_elapsed
      sleep_for_break
      puts
    end

    `say body scan instructions complete`

  ensure
    puts "#{((Time.now - @start_time)/60).to_i} minutes total mindfulness"
  end

  private

  def count_down
    `say get ready`
    sleep 1

    (1..10).to_a.reverse.each do |s| 
      puts s
      `say #{s}`
      sleep 1
    end

    sleep 2
  end

  def give_instruction_for(part)
    focus_line = FOCUS_LINES.sample
    focus_line = focus_line.sub(/your$/, 'the') if part.include?('your')
    puts "\"#{focus_line} #{part}\""
    `say #{focus_line} #{part}`
  end

  def print_time_elapsed
    puts "time passed: #{((Time.now - @start_time)/60).to_i} minutes"
  end

  def sleep_for_break
    puts "sleeping #{@break_length} seconds"
    sleep @break_length
  end

  def break_seconds(duration)
    case duration
    when /^\d+s$/
      ARGV[0][0..-2].to_i
    when /^\d+$/
      part_count = @parts.length.to_f
      seconds = ARGV[0].to_f * 60

      seconds / part_count
    else
      10
    end
  end
end