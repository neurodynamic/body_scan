parts = ['toes','feet','ankles','shins','calves','knees','back of your thighs',
'front of your thighs','buttocks','back','low back','mid back',
'upper back','pelvic area','stomach','mid torso','chest','hands',
'wrists','inside forearms','outside forearms','elbows','upper arms',
'shoulders','neck','jaw','cheeks','eyes','forehead','back of the head',
'top of the head','whole head','whole body']

focus_lines = [
  'move your focus to your',
  'focus on your',
  'and now your'
]


begin
  `say get ready`
  sleep 1

  (1..10).to_a.reverse.each do |s| 
    `say #{s}`
    sleep 1
  end

  sleep 2

  puts(start = Time.now)

  parts.each do |part|
    `say #{focus_lines.sample} #{part}`

    if ARGV[0]
      sleep ARGV[0].to_i
    else
      sleep 10
    end
  end

  `say body scan instructions complete`
ensure
  puts "#{((Time.now - start)/60).to_i.to_s} minutes body scan"
end

gets

puts "#{((Time.now - start)/60).to_i.to_s} minutes total mindfulness"
