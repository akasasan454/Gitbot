Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'chatwork/task' => 'chatwork#create_task'

  get 'chatwork/task' => 'chatwork#create_task'
end
