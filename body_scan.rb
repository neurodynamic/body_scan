parts_bottom_up = ['toes','feet','ankles','shins','calves','knees','back of your thighs',
'front of your thighs','buttocks','back','low back','mid back',
'upper back','pelvic area','stomach','mid torso','chest','hands',
'wrists','inside forearms','outside forearms','elbows','upper arms',
'shoulders','neck','jaw','cheeks','eyes','forehead','back of the head',
'top of the head','whole head','whole body']

parts_top_down = parts_bottom_up[0..-3].reverse + ['whole body']

parts = parts_top_down

focus_lines = [
  'move your focus to your',
  'focus on your',
  'and now your'
]


begin
  `say get ready`
  sleep 1

  (1..10).to_a.reverse.each do |s| 
    puts s
    `say #{s}`
    sleep 1
  end

  sleep 2

  puts(start = Time.now)

  parts.each_with_index do |part, i|
    puts "\"#{focus_lines.sample} #{part}\""
    `say #{focus_lines.sample} #{part}`

    case ARGV[0]
    when /^\d+s$/
      puts "time passed: #{((Time.now - start)/60).to_i.to_s} minutes"
      puts "sleeping #{ARGV[0][0..-2]} seconds"
      sleep ARGV[0][0..-2].to_i
    when /^\d+$/
      part_count = parts.length.to_f
      seconds = ARGV[0].to_f * 60

      seconds_per_part = seconds/part_count

      puts "time passed: #{((Time.now - start)/60).to_i.to_s} minutes"
      puts "sleeping #{seconds_per_part} seconds"
      sleep seconds_per_part
    else
      puts "time passed: #{((Time.now - start)/60).to_i.to_s} minutes"
      puts "sleeping 10 seconds"
      sleep 10
    end
  end

  `say body scan instructions complete`
ensure
  puts "#{((Time.now - start)/60).to_i.to_s} minutes body scan"
end

gets

puts "#{((Time.now - start)/60).to_i.to_s} minutes total mindfulness"
