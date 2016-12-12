Rails.application.routes.draw do
  get 'navbar/Home'

  get 'navbar/About'

  get 'navbar/Contact'

  get 'navbar/Facilities'

  get 'welcome/index'

  root 'welcome#index'

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
