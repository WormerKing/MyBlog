Rails.application.routes.draw do
    get "/login",to: "sessions#new",as: :login
    post "/login",to: "sessions#create",as: :login_post
    delete "/logout",to: "sessions#destroy",as: :logout

    get "/panel",to: "sessions#new",as: :panel

    root "main#index"
end
