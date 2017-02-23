Rails.application.routes.draw do
  
  get 'room/update'

  get 'booking/new'

  get 'sessions/new'

  get 'staff/report'
  get 'staff/roommodification'
  get 'staff/dashboard'
  get 'staff/login'
  get 'staff/checkin'
  get 'staff/checkout'
  get 'staff/payment'

  get 'navbar/About'
  get 'navbar/Contact'
  get 'navbar/Facilities'
  get 'navbar/Rooms'
  get 'navbar/Reservation'

  root 'welcome#index'

  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  post 'booking/new'
  post 'booking/create'
  post 'booking/update'
  get 'booking/update'

  post 'room/update'
  post 'room/checkout'
end
