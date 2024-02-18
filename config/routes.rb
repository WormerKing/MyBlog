Rails.application.routes.draw do
    get "/login",to: "sessions#new",as: :login
    post "/login",to: "sessions#create",as: :login_post
    delete "/logout",to: "sessions#destroy",as: :logout

    get "/panel",to: "panel#index",as: :panel


    get "/hakkimda",to: "main#hakkimda",as: :hakkimda
    get "/projelerim",to: "main#projelerim",as: :projelerim
    get "/yazilarim",to: "main#yazilarim",as: :yazilarim
    #TODO buraya blog tarzı yazıların ve kategorilerin eklenmesi gerekli
    root "main#index"
end
