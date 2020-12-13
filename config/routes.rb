Rails.application.routes.draw do
  scope "(:locale)" do
    post 'contacts' => "contacts#create"
    root to: "contacts#index", via: :all
  end
end
