# Tuncay Dinler MyBlog Project
Tuncay Dinler's offical MyBlog web site source codes. I developed this project with rails for illustrative purposes.
If you want this repository, please read License.

# **Installation(Docker)**

Required packages:
* Docker
* Docker-Compose

Run blog app:
```bash
git clone https://github.com/WormerKing/MyBlog.git
cd MyBlog
docker-compose down
docker-compose up --build
```

After open `http://localhost:3000`.
<hr/>

# **Installation(Ruby)**
Required packages:
* Ruby 3-2-0
* Rails
* Postgresql(Database Service)
* Valkey(Cache Service)
* Javascript Runtime(Nodejs or Bun)

Run blog app:
```bash
git clone https://github.com/WormerKing/MyBlog.git
cd MyBlog
bundle install && bundle update

// Copy your own env variables
// Read config/database.yml
// cp (your_env_file) .env

bin/rails db:create
bin/rails db:migrate

// If need default vals
bin/rails db:seed

// Start rails server
bin/rails s
```
After open `http://localhost:3000`