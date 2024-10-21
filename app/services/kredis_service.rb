class KredisService
  def self.get_aboutme
    aboutme = Kredis.json('aboutme', expires_in: 10.minute)

    aboutme.value = Aboutme.first.to_json if aboutme.value.nil?

    Aboutme.new(JSON.load(aboutme.value))
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
                                       })
    end
    JSON.load(projects.value)
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
