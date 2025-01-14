# Base image olarak Ruby kullanıyoruz
FROM ruby:3.2.0

# PostgreSQL için gerekli olan sistem bağımlılıklarını yüklüyoruz
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  postgresql \
  postgresql-contrib

# Çalışma dizini belirliyoruz
WORKDIR /app

# Gemfile ve Gemfile.lock dosyalarını container'a kopyalıyoruz
COPY Gemfile Gemfile.lock ./

# Rails bağımlılıklarını yüklüyoruz
RUN gem update --system && bundle install && bundle update

# Uygulama dosyalarını container'a kopyalıyoruz
COPY . .

# Rails sunucusunu başlatıyoruz
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
