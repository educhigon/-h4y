require "csv"

client = OpenAI::Client.new
csv_path = "./fake_posts.csv"
big_array = []
counter = 0

def api_call(client)
  tags = ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"]
  tags_five = tags.sample(5)
  num = rand(0..5) + rand(1..10) + rand(1..10) + rand(1..15)
  style = [
    "a touch more casual than usual",
    "however you like",
    "professional and doctor like",
    "you're hot shit",
    "a top tier influencer on this platform",
    "a mid tier influencer on this platform",
    "a bottom tier influencer on this platform with no followers whatsoever. Pathetic really. (but its just a persona don't take it to heart!)",
    "50cent. (but dont call yourself 50cent) Use 'shawty' at least once"
  ]
  emojis = rand(1..8) == 1 ? "4. Use emojis" : ""

  begin
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content:
        "Write a post for a health/lifestyle social media app.
        Use these 5 tags: #{tags_five} and have the topic be somewhat related.
        Choose a topic from broad range of health and lifestyle subjects.
        Avoid focusing repeatedly on the same topics like mindfulness or diabetes;
        aim for a diverse set of topics.

        Rules for the post:
        1. Be very random and specfic in your choice of topic.
        2. The post should be around #{num} sentences long.
        3. Your persona for this post is: #{style.sample}.
        #{emojis}

        Please generate the post with the exact structure specified below.
        It is crucial that this format with the specified markers is adhered to strictly:

        Title:
        <title>
        %%%
        Content:
        <content>
        "
        }]
    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  rescue => e
    p "error API: #{e.message}"
    nil
  end
end

def read_response(response, big_array)
  title_marker = "Title: "
  content_marker = "%%%"
  skip = "Content: "

  content_start = response.index(content_marker) + content_marker.length

  title = response[title_marker.length..response.index(content_marker) - 1]

  content = response[(content_start + skip.length)..-1]
  post_proc_content = content.gsub('#', '!').strip

  unless title.empty? && content.empty?
    begin
      fresh_post = Post.create!(title: title, content: post_proc_content, user: User.all.sample)
      p response
      big_array << fresh_post
    rescue => e
      puts "error saving post: #{e.message}"
    end
  end
end

def save_csv(csv_file_path, data)
  return if data.empty?

  begin
    CSV.open(csv_file_path, "wb") do |csv|
      p "👻👻👻 Storing"
      csv << ["Title", "Content"]
      data.each do |post|
        csv << [post.title, post.content]
      end
    end
  rescue => e
    puts "error csv: #{e.message}"
  end
end

1000.times do
  counter += 1
  p counter
  p "#{'😱' * counter}"
  response = api_call(client)
  next unless response

  read_response(response, big_array)
end

save_csv(csv_path, big_array)
p "🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰"
