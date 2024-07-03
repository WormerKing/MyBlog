Rails.application.routes.draw do
    get "/login",to: "sessions#new",as: :login
    post "/login",to: "sessions#create",as: :login_post
    delete "/logout",to: "sessions#destroy",as: :logout

    # resource :login,controller: "sessions",except: %i[ index show edit update]

    # TODO login pathleri resources ile yazılacak
    # TODO bu kısma isim bulunmalı
    namespace :pages,path:"" do
        resources :articles,path: "yazilarim",only: %w[ index show ]
        resources :projects,path: "projelerim"
        resources :tags,path: "etiketler",only: %w[ index show ]
        resources :categories,path: "kategoriler",only: %w[ index show ]
        #FIXME bu kısımlar çakışıyor

        get "/hakkimda",to: "aboutme#index",as: :hakkimda
        get "/iletisim",to: "communication#index",as: :iletisim
    end

    #FIXME scope :panel,module:"panel",path_names:{new:"yeni",edit:"duzenle"} do
    namespace :panel,as:"",path_names:{new:"yeni",edit:"duzenle"} do
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
