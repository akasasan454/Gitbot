Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'chatwork/create_task' => 'chatwork#create_task'
end
