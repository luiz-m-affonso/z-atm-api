Rails.application.routes.draw do
  namespace :v1 do
    resources :financial_transactions
    resources :bank_accounts
    resources :bank_costumers
  end

  resource :authentication, path: '', only: [] do
    post 'sign_up'
    post 'sign_in'
    post 'sign_out'
    post 'refresh'
  end
end
