Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'errors/not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'
  mount PdfjsViewer::Rails::Engine => '/pdfjs', as: 'pdfjs'
  namespace :admin do
    resources :companies, except: %i[show]
    resources :groups, except: %i[show]
    resources :categories, except: %i[show]
    resources :users, except: %i[show]
    resources :regulations, except: %i[show]
    resources :notifications, except: %i[show]
    resources :documents, except: %i[show]
    resources :carousels, except: %i[show]
    resources :news, except: %i[show]
  end
  get 'admin', to: 'admin/administrators#index'
  get 'tim-kiem', to: 'home#search'
  get 'tim-kiem-quan-tri', to: 'admin/administrators#search'
  get 'tim-kiem-thong-bao', to: 'admin/notifications#search'
  get 'tim-kiem-tin-tuc', to: 'admin/news#search'
  get 'tim-kiem-van-ban', to: 'admin/documents#search'
  root 'home#index'
  devise_for :admins, controller: {
    registrations: 'admin/registrations'
  }
  get 'tat-ca-nhan-vien', to: 'users#index'
  get 'chi-tiet-nhan-vien/:id', to: 'users#show', as: 'chi-tiet-nhan-vien'
  get 'tat-ca-nhan-vien-cong-ty/:id', to: 'groups#show', as: 'tat-ca-nhan-vien-cong-ty'

  get 'tat-ca-quy-dinh', to: 'regulations#index'
  get 'chi-tiet-quy-dinh/:id', to: 'regulations#show', as: 'chi-tiet-quy-dinh'
  get 'tat-ca-quy-dinh-cong-ty/:id', to: 'regulations#company_regulations', as: 'tat-ca-quy-dinh-cong-ty'

  get 'tat-ca-thong-bao', to: 'notifications#index'
  get 'chi-tiet-thong-bao/:id', to: 'notifications#show', as: 'chi-tiet-thong-bao'
  get 'tat-ca-thong-bao-cong-ty/:id', to: 'notifications#company_notifications', as: 'tat-ca-thong-bao-cong-ty'

  get 'thong-tin-chung', to: 'news#index'
  get 'chi-tiet-tin-tuc/:id', to: 'news#show', as: 'chi-tiet-tin-tuc'

  get 'tat-ca-van-ban', to: 'documents#index'

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

end
