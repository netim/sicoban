Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  ActiveAdmin.routes(self)
  resources :usuarios
  resources :agencia_bancaria
  resources :conta_bancaria
  resources :tipo_movimentacao
  resources :movimentacao_bancaria,          only: [:create, :show]
  root 'usuarios#show'
  get '/transferencia/', to: 'transferencia#new'
  post '/transferencia', to: 'transferencia#create'
  get '/deposito/', to: 'deposito#new'
  post '/deposito', to: 'deposito#create'
  get '/saque/', to: 'saque#new'
  post '/saque', to: 'saque#create'
  #get '/movimentacao_bancaria/:id', to: 'movimentacao_bancaria#show'
  get '/estorno/:id', to: 'estorno#create'
  post '/estorno', to: 'estorno#create'
  get '/contas_bancarias/', to: 'conta_bancaria#show'
  get '/agencias_bancarias/', to: 'agencia_bancaria#show'
  get '/admin', to: redirect('/admin/login/')
  #get '/movimentacao_bancaria/', to: 'movimentacao_bancaria#new'
  #get '/movimentacao_bancaria/:id', to: 'movimentacao_bancaria#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end