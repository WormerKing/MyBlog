Rails.application.routes.draw do
    get "/login",to: "sessions#new",as: :login
    post "/login",to: "sessions#create",as: :login_post
    delete "/logout",to: "sessions#destroy",as: :logout

    get "/panel",to: "panel#index",as: :panel


    get "/hakkimda",to: "main#hakkimda",as: :hakkimda
    get "/projelerim",to: "main#projelerim",as: :projelerim
    get "/yazilarim",to: "main#yazilarim",as: :yazilarim
    get "/iletisim",to: "main#iletisim",as: :iletisim
    #TODO buraya blog tarzı yazıların ve kategorilerin eklenmesi gerekli

    get "/hakkimda/edit",to: "panel#hakkimda",as: :edit_aboutme
    put "/hakkimda",to: "panel#hakkimda_update",as: :update_aboutme

    resources :articles
    resources :categories
    resources :admins
    root "main#index"
end
