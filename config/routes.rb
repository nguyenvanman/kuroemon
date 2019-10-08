Rails.application.routes.draw do
  scope 'api' do
    scope 'auth' do
      post 'sign_up', to: 'authentication#sign_up'
      post 'sign_in', to: 'authentication#sign_in'
      delete 'sign_out', to: 'authentication#sign_out'
    end
  end
end
