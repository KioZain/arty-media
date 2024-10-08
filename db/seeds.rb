@raw_text = "Нонспектакулярное искусство — направление в современном искусстве, отвергающее зрелищность и театральность.
Примером такого искусства является перформанс польского художника Павла Альтхамера «Script Outline», на выставке «Manifesta» в 2000 году. Manifesta – биеннале современного искусства проходит в Европе, начиная с 1996 года. Первая выставка была организовна в Роттердаме. Выставка Manifesta–3 проходила в Словении. Как отмечает куратор выставки Виктор Мизиано, в отличие от других значительных форумов Манифеста «была с самого начала определена как биеннале именно европейских молодых художников; но зато Европа здесь должна была быть представлена вся, т. е. не только Западная, но и непременно Восточная»."
@words = @raw_text.downcase.gsub(/[—.—,«»:;()]/, '').gsub(/  /, ' ').split(' ')


# Rake-----------------------------------------
def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

# Setting the quantity of posts and comments --------------------
def seed
  reset_db
  create_posts(10)
  create_comments(2..4)
end

# Creating array of words-----------------------------------------
def create_sentence
  sentence_words = []

  (10..20).to_a.sample.times do
    sentence_words << @words.sample
  end
  sentence = sentence_words.join(' ').capitalize + '.'
end


# Image creating ----------------------------------------
def upload_random_image
  uploader = PostImageUploader.new(Post.new, :post_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/posts', '*')).sample))
  uploader
end

# Creating posts-----------------------------------------
def create_posts(quantity)
  quantity.times do
    post = Post.create(title: create_sentence, body: create_sentence, post_image: upload_random_image)
    puts "Post with id #{post.id} just created"
  end
end

# Creating comments-----------------------------------------
def create_comments(quantity)
  Post.all.each do |post|
    quantity.to_a.sample.times do
      comment = Comment.create(post_id: post.id, body: create_sentence)
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} just created"
    end
  end
end

seed
