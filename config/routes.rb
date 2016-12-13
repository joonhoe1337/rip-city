Rails.application.routes.draw do
  
  get 'staff/roommodification'

  get 'staff/dashboard'

  get 'staff/login'

  get 'staff/checkin'

  get 'staff/checkout'

  get 'staff/payment'

  get 'navbar/Home'

  get 'navbar/About'

  get 'navbar/Contact'

  get 'navbar/Facilities'

  get 'navbar/Rooms'

  get 'navbar/Reservation'

  get 'welcome/index'

  root 'welcome#index'

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
