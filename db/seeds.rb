@artists = [
  {
    "name": "Barot Bellingham",
    "shortname": "Barot_Bellingham",
    "reknown": "Royal Academy of Painting and Sculpture",
    "bio": "Barot has just finished his final year at The Royal Academy of Painting and Sculpture, where he excelled in glass etching paintings and portraiture. Hailed as one of the most diverse artists of his generation, Barot is equally as skilled with watercolors as he is with oils, and is just as well-balanced in different subject areas. Barot's collection entitled \"The Un-Collection\" will adorn the walls of Gilbert Hall, depicting his range of skills and sensibilities - all of them, uniquely Barot, yet undeniably different"
  },
  {
    "name": "Jonathan G. Ferrar II",
    "shortname": "Jonathan_Ferrar",
    "reknown": "Artist to Watch in 2012",
    "bio": "The Artist to Watch in 2012 by the London Review, Johnathan has already sold one of the highest priced-commissions paid to an art student, ever on record. The piece, entitled Gratitude Resort, a work in oil and mixed media, was sold for $750,000 and Jonathan donated all the proceeds to Art for Peace, an organization that provides college art scholarships for creative children in developing nations"
  },
  {
    "name": "Hillary Hewitt Goldwynn-Post",
    "shortname": "Hillary_Goldwynn",
    "reknown": "New York University",
    "bio": "Hillary is a sophomore art sculpture student at New York University, and has already won all the major international prizes for new sculptors, including the Divinity Circle, the International Sculptor's Medal, and the Academy of Paris Award. Hillary's CAC exhibit features 25 abstract watercolor paintings that contain only water images including waves, deep sea, and river."
  },
  {
    "name": "Hassum Harrod",
    "shortname": "Hassum_Harrod",
    "reknown": "Art College in New Dehli",
    "bio": "The Art College in New Dehli has sponsored Hassum on scholarship for his entire undergraduate career at the university, seeing great promise in his contemporary paintings of landscapes - that use equal parts muted and vibrant tones, and are almost a contradiction in art. Hassum will be speaking on \"The use and absence of color in modern art\" during Thursday's agenda."
  },
  {
    "name": "Jennifer Jerome",
    "shortname": "Jennifer_Jerome",
    "reknown": "New Orleans, LA",
    "bio": "A native of New Orleans, much of Jennifer's work has centered around abstract images that depict flooding and rebuilding, having grown up as a teenager in the post-flood years. Despite the sadness of devastation and lives lost, Jennifer's work also depicts the hope and togetherness of a community that has persevered. Jennifer's exhibit will be discussed during Tuesday's Water in Art theme."
  },
  {
    "name": "LaVonne L. LaRue",
    "shortname": "LaVonne_LaRue",
    "reknown": "Chicago, IL",
    "bio": "LaVonne's giant-sized paintings all around Chicago tell the story of love, nature, and conservation - themes that are central to her heart. LaVonne will share her love and skill of graffiti art on Monday's schedule, as she starts the painting of a 20-foot high wall in the Rousseau Room of Hotel Contempo in front of a standing-room only audience in Art in Unexpected Places."
  },
  {
    "name": "Constance Olivia Smith",
    "shortname": "Constance_Smith",
    "reknown": "Fullerton-Brighton-Norwell Award",
    "bio": "Constance received the Fullerton-Brighton-Norwell Award for Modern Art for her mixed-media image of a tree of life, with jewel-adorned branches depicting the arms of humanity, and precious gemstone-decorated leaves representing the spouting buds of togetherness. The daughter of a New York jeweler, Constance has been salvaging the discarded remnants of her father's jewelry-making since she was five years old, and won the New York State Fair grand prize at the age of 8 years old for a gem-adorned painting of the Manhattan Bridge."
  },
  {
    "name": "Riley Rudolph Rewington",
    "shortname": "Riley_Rewington",
    "reknown": "Roux Academy of Art, Media, and Design",
    "bio": "A first-year student at the Roux Academy of Art, Media, and Design, Riley is already changing the face of modern art at the university. Riley's exquisite abstract pieces have no intention of ever being understood, but instead beg the viewer to dream, create, pretend, and envision with their mind's eye. Riley will be speaking on the \"Art of Abstract\" during Thursday's schedule"
  },
  {
    "name": "Xhou Ta",
    "shortname": "Xhou_Ta",
    "reknown": "China International Art University",
    "bio": "A senior at the China International Art University, Xhou has become well-known for his miniature sculptures, often the size of a rice granule, that are displayed by rear projection of microscope images on canvas. Xhou will discuss the art and science behind his incredibly detailed works of art."
  }
]


# Rake-----------------------------------------
def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end


# Setting the quantity of posts and comments --------------------
def seed
  reset_db
  create_users(10)
  create_posts(30)
  create_comments(2..6)
  create_collections(20)
end

def create_users(quantity)
  i = 0

  quantity.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end



# Author
def create_author
  @artists.sample[:name]
end
# PostName
def create_post_name
  @artists.sample[:reknown]
end

@raw_text = "Нонспектакулярное искусство — направление в современном искусстве, отвергающее зрелищность и театральность.
Примером такого искусства является перформанс польского художника Павла Альтхамера «Script Outline», на выставке «Manifesta» в 2000 году. Manifesta – биеннале современного искусства проходит в Европе, начиная с 1996 года. Первая выставка была организовна в Роттердаме. Выставка Manifesta–3 проходила в Словении. Как отмечает куратор выставки Виктор Мизиано, в отличие от других значительных форумов Манифеста «была с самого начала определена как биеннале именно европейских молодых художников; но зато Европа здесь должна была быть представлена вся, т. е. не только Западная, но и непременно Восточная»."
@words = @raw_text.downcase.gsub(/[—.—,«»:;()]/, '').gsub(/  /, ' ').split(' ')

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
    user = User.all.sample

    post = Post.create(
      title: create_post_name,
      body: create_sentence,
      author: create_author,
      post_image: upload_random_image,
      user: user
    )
    puts "Post with id #{post.id} just created"
  end
end

# Creating comments-----------------------------------------
def create_comments(quantity)
  Post.all.each do |post|
    quantity.to_a.sample.times do
    comment = Comment.create(
      post_id: post.id,
      body: create_sentence,
      )
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} just created"
    end
  end
end

# Creating collections
def create_collections(quantity)
  quantity.times do
    user = User.all.sample

    collection = Collection.create(
      user: user,
      title: create_post_name,
      body: create_sentence

    )
    add_posts_to_collection(collection)
    puts "Collection '#{collection.title}' with id #{collection.id} created"
  end
end

# Linking posts to collection---------------------
def add_posts_to_collection(collection)
  # Получаем посты, принадлежащие пользователю, создавшему коллекцию
  user_posts = Post.where(user: collection.user)

  # Проверяем, есть ли у пользователя хотя бы 2 поста для добавления
  return if user_posts.empty? || user_posts.count < 2

  # Задаём количество постов для добавления, учитывая максимум в 8 постов
  post_count = rand(2..[ user_posts.count, 8 ].min)

  # Выбираем случайные посты из списка постов пользователя
  posts_to_add = user_posts.sample(post_count)

  # Добавляем посты в коллекцию
  posts_to_add.each do |post|
    collection.posts << post unless collection.posts.include?(post)
    puts "Post with id #{post.id} added to Collection '#{collection.title}'"
  end
end


seed
