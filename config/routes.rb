Rails.application.routes.draw do
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  namespace :admin do
    resources :companies, except: %i[show]
    resources :groups, except: %i[show]
    resources :categories, except: %i[show]
    resources :users, except: %i[:show]
    resources :regulations, except: %i[:show]
    resources :notifications, except: %i[:show]
    resources :carousels
    resources :news, except: %i[index]
  end
  get 'admin', to: 'admin/administrators#index'
  get 'tat-ca-tin-tuc', to: 'admin/news#index'
  root 'home#index'
  devise_for :admins
  get 'tat-ca-nhan-vien', to: 'users#index'
  get 'chi-tiet-nhan-vien/:id', to: 'users#show', as: 'chi-tiet-nhan-vien'
  get 'tat-ca-nhan-vien-phong-ban/:id', to: 'groups#show', as: 'tat-ca-nhan-vien-phong-ban'

  get 'tat-ca-quy-dinh', to: 'regulations#index'
  get 'chi-tiet-quy-dinh/:id', to: 'regulations#show', as: 'chi-tiet-quy-dinh'
  get 'tat-ca-quy-dinh-phong-ban/:id', to: 'regulations#company_regulations', as: 'tat-ca-quy-dinh-phong-ban'

  get 'tat-ca-thong-bao', to: 'notifications#index'
  get 'chi-tiet-thong-bao/:id', to: 'notifications#show', as: 'chi-tiet-thong-bao'
  get 'tat-ca-thong-bao-phong-ban/:id', to: 'notifications#company_notifications', as: 'tat-ca-thong-bao-phong-ban'

  get 'thong-tin-chung', to: 'news#index'
  get 'chi-tiet-tin-tuc/:id', to: 'news#show', as: 'chi-tiet-tin-tuc'

end
