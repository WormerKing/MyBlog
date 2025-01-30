class KredisService
  def self.clear_datas
    # Clear all key, val datas
    Kredis.clear_all
  end

  def self.clear_data(key_name)
    Kredis.json(key_name).value = nil
  end

  def self.get_aboutme(type = 'object')
    aboutme = Kredis.json('aboutme', expires_in: 10.minute)

    aboutme.value = Aboutme.first.to_json(methods: :get_image_url) if aboutme.value.nil?

    return {} if aboutme.value.nil?

    begin
      params = JSON.parse(aboutme.value)
    rescue TypeError
      return nil
    end
    begin
      if type == 'object'
        params.delete('get_image_url')
        Aboutme.new(params)
      elsif type == 'json'
        image_url = params['get_image_url']
        params.delete('get_image_url')
        params.store('image_url', image_url)
        params
      end
    rescue NoMethodError
      {}
    end
  end

  def self.get_top_projects
    # return top 4 projects
    projects = Kredis.json('top_projects', expires_in: 10.minute)
    if projects.value.nil?
      projects.value = Project.order(created_at: :desc)
                              .limit(4)
                              .includes(:tags, :category)
                              .in_groups_of(2)
                              .to_json(include: {
                                         tags: {
                                           only: :title
                                         }
                                       }, methods: :get_image_url)
    end
    begin
      JSON.parse(projects.value).each do |i|
        i.each do |j|
          next if j.nil?

          tags = j['tags']
          image_url = j['get_image_url']
          j.delete('tags')
          j.delete('get_image_url')
          j.store('obje', Project.new(j))
          j.store('tags', tags)
          j.store('image_url', image_url)
        end
      end
    rescue TypeError
      nil
    end
  end

  def self.get_top_articles
    # return top 4 articles
    articles = Kredis.json('top_articles', expires_in: 10.minute)
    if articles.value.nil?
      articles.value = Article.order(created_at: :desc)
                              .limit(4)
                              .includes(:tags, :category)
                              .in_groups_of(2)
                              .to_json(include: { category: { only: :name },
                                                  tags: { only: :title } })
    end
    JSON.load(articles.value)
  end

  def self.get_communication
    communication = Kredis.json('communication', expires_in: 10.minute)

    communication.value = Communication.first.to_json if communication.value.nil?

    Communication.new(JSON.load(communication.value))
  end

  def self.get_categories_list(type = 'both')
    categories = Kredis.json('categories_list', expires_in: 10.minutes)
    if categories.value.nil?
      projects = Category.joins(:projects).group(:name).count
      articles = Category.joins(:articles).group(:name).count
      hash = {
        'projects' => new.reorganize_hashes(projects),
        'articles' => new.reorganize_hashes(articles),
        'both' => new.reorganize_hashes(projects.merge(articles) { |_key, new, old| new + old })
      }
      categories.value = hash.to_json
      hash.clear
    end

    JSON.load(categories.value)[type]
  end

  def self.get_tags_list(type = 'both')
    tags = Kredis.json('tags_list', expires_in: 10.minutes)
    if tags.value.nil?
      projects = Tag.joins(:projects).group(:title).count
      articles = Tag.joins(:articles).group(:title).count
      hash = {
        'projects' => new.reorganize_hashes(projects),
        'articles' => new.reorganize_hashes(articles),
        'both' => new.reorganize_hashes(projects.merge(articles) { |_key, new, old| new + old })
      }

      tags.value = hash.to_json
      hash.clear
    end

    JSON.load(tags.value)[type]
  end

  def reorganize_hashes(hash)
    hash.sort_by { |_i, j| j }.reverse.to_h
  end
end
