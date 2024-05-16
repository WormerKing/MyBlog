Rails.application.routes.draw do
    get "/login",to: "sessions#new",as: :login
    post "/login",to: "sessions#create",as: :login_post
    delete "/logout",to: "sessions#destroy",as: :logout

    # resource :login,controller: "sessions",except: %i[ index show edit update]

    # TODO login pathleri resources ile yazılacak


    # Anasayfa rotaları
    get "/hakkimda",to: "aboutme#index",as: :hakkimda
    get "/projelerim",to: "projects#index",as: :projelerim
    get "/yazilarim",to: "articles#index",as: :yazilarim
    get "/iletisim",to: "communication#index",as: :iletisim


    # Admin panel rotaları
    #FIXME buralar normal olarakda açılıyor!
    #FIXME scope :panel,module:"panel",path_names:{new:"yeni",edit:"duzenle"} do
    scope :panel,path_names:{new:"yeni",edit:"duzenle"} do
        get "/",to: "panel#index",as: :panel
        resource :aboutme,except: %i[ new create destroy ],path: "hakkimda",controller: "aboutme"
        resource :communication, except: %i[ new create destroy ],path: "iletisim",controller: "communication"
        resources :projects,path: "projelerim",controller: "projects"
        resources :articles,path: "yazilarim",controller: "articles"
        resources :tags,path: "etiketler",controller: "tags"
        resources :categories,path: "kategoriler",controller: "categories"
        resources :admins,path: "yoneticiler",controller: "admins"
    end

    # resources :articles
    # resources :categories
    # resources :projects
    # resources :admins
    root "main#index"
end
