Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'errors/not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'
  mount PdfjsViewer::Rails::Engine => '/pdfjs', as: 'pdfjs'
  namespace :admin do
    resources :groups, except: %i[index new edit destroy]
    resources :categories, except: %i[index new edit destroy]
    resources :users, except: %i[index new edit destroy]
    resources :regulations, except: %i[index new edit destroy]
    resources :notifications, except: %i[index new edit destroy]
    resources :documents, except: %i[index new edit destroy]
    resources :carousels, except: %i[index new edit destroy]
    resources :news, except: %i[index new edit destroy]
  end

  # ADMIN
  get 'admin', to: 'admin/administrators#index'
  get 'tim-kiem-quan-tri', to: 'admin/administrators#search'
  #===============================PHÒNG BAN=================================================
  get 'admin/tat-ca-phong-ban', to: 'admin/groups#index', as: 'tat-ca-phong-ban'
  get 'admin/them-moi-phong-ban', to: 'admin/groups#new', as: 'them-moi-phong-ban'
  get 'admin/cap-nhat-phong-ban/:id', to: 'admin/groups#edit', as: 'cap-nhat-phong-ban'
  delete 'admin/xoa-phong-ban/:id', to: 'admin/groups#destroy', as: 'xoa-phong-ban'
  get 'admin/chi-tiet-phong-ban/:id', to: 'admin/groups#show', as: 'chi-tiet-phong-ban'
  #================================DANH MỤC=================================================
  get 'admin/tat-ca-danh-muc', to: 'admin/categories#index', as: 'tat-ca-danh-muc'
  get 'admin/them-moi-danh-muc', to: 'admin/categories#new', as: 'them-moi-danh-muc'
  get 'admin/cap-nhat-danh-muc/:id', to: 'admin/categories#edit', as: 'cap-nhat-danh-muc'
  delete 'admin/xoa-danh-muc/:id', to: 'admin/categories#destroy', as: 'xoa-danh-muc'
  get 'admin/chi-tiet-danh-muc/:id', to: 'admin/categories#show', as: 'chi-tiet-danh-muc'
  #================================NHÂN VIÊN================================================
  get 'admin/nhan-vien', to: 'admin/users#index', as: 'nhan-vien'
  get 'admin/them-moi-nhan-vien', to: 'admin/users#new', as: 'them-moi-nhan-vien'
  get 'admin/cap-nhat-nhan-vien/:id', to: 'admin/users#edit', as: 'cap-nhat-nhan-vien'
  delete 'admin/xoa-nhan-vien/:id', to: 'admin/users#destroy', as: 'xoa-nhan-vien'
  #============================QUY ĐỊNH, QUY TRÌNH==========================================
  get 'admin/quy-dinh-quy-trinh', to: 'admin/regulations#index', as: 'quy-dinh-quy-trinh'
  get 'admin/them-moi-quy-dinh-quy-trinh', to: 'admin/regulations#new', as: 'them-moi-quy-dinh-quy-trinh'
  get 'admin/cap-nhat-quy-dinh-quy-trinh/:id', to: 'admin/regulations#edit', as: 'cap-nhat-quy-dinh-quy-trinh'
  delete 'admin/xoa-quy-dinh-quy-trinh/:id', to: 'admin/regulations#destroy', as: 'xoa-quy-dinh-quy-trinh'
  #=================================THÔNG BÁO===============================================
  get 'admin/thong-bao', to: 'admin/notifications#index', as: 'thong-bao'
  get 'admin/them-moi-thong-bao', to: 'admin/notifications#new', as: 'them-moi-thong-bao'
  get 'admin/cap-nhat-thong-bao/:id', to: 'admin/notifications#edit', as: 'cap-nhat-thong-bao'
  delete 'admin/xoa-thong-bao/:id', to: 'admin/notifications#destroy', as: 'xoa-thong-bao'
  #=================================VĂN BẢN, BIỂU MẪU=======================================
  get 'admin/van-ban-bieu-mau', to: 'admin/documents#index', as: 'van-ban-bieu-mau'
  get 'admin/them-moi-van-ban-bieu-mau', to: 'admin/documents#new', as: 'them-moi-van-ban-bieu-mau'
  get 'admin/cap-nhat-van-ban-bieu-mau/:id', to: 'admin/documents#edit', as: 'cap-nhat-van-ban-bieu-mau'
  delete 'admin/xoa-van-ban-bieu-mau/:id', to: 'admin/documents#destroy', as: 'xoa-van-ban-bieu-mau'
  # =====================================TIN TỨC============================================
  get 'admin/tat-ca-tin-tuc', to: 'admin/news#index', as: 'tat-ca-tin-tuc'
  get 'admin/them-moi-tin-tuc', to: 'admin/news#new', as: 'them-moi-tin-tuc'
  get 'admin/cap-nhat-tin-tuc/:id', to: 'admin/news#edit', as: 'cap-nhat-tin-tuc'
  delete 'admin/xoa-tin-tuc/:id', to: 'admin/news#destroy', as: 'xoa-tin-tuc'
  # =======================================BĂNG RÔN=========================================
  get 'admin/tat-ca-bang-ron', to: 'admin/carousels#index', as: 'tat-ca-bang-ron'
  get 'admin/them-moi-bang-ron', to: 'admin/carousels#new', as: 'them-moi-bang-ron'
  get 'admin/cap-nhat-bang-ron/:id', to: 'admin/carousels#edit', as: 'cap-nhat-bang-ron'
  delete 'admin/xoa-bang-ron/:id', to: 'admin/carousels#destroy', as: 'xoa-bang-ron'

  # HOMEPAGE
  root 'home#index'
  get 'tim-kiem', to: 'home#search'
  devise_for :admins,
             controller: {
                registrations: 'admin/registrations'
             },
             path: '',
             path_names: {
               sign_in: 'dang-nhap',
               sign_out: 'dang-xuat',
               sign_up: 'them-moi-quan-tri-vien',
               edit: 'cap-nhat-thong-tin'
             }
  get 'tat-ca-nhan-vien', to: 'users#index'
  get 'chi-tiet-nhan-vien/:id', to: 'users#show', as: 'chi-tiet-nhan-vien'
  get 'tat-ca-nhan-vien-phong-ban/:id', to: 'groups#show', as: 'tat-ca-nhan-vien-phong-ban'

  get 'tat-ca-quy-dinh', to: 'regulations#index'
  get 'chi-tiet-quy-dinh/:id', to: 'regulations#show', as: 'chi-tiet-quy-dinh'
  get 'tat-ca-quy-dinh-danh-muc/:id', to: 'regulations#category_regulations', as: 'tat-ca-quy-dinh-danh-muc'

  get 'tat-ca-thong-bao', to: 'notifications#index'
  get 'chi-tiet-thong-bao/:id', to: 'notifications#show', as: 'chi-tiet-thong-bao'

  get 'thong-tin-chung', to: 'news#index'
  get 'chi-tiet-tin-tuc/:id', to: 'news#show', as: 'chi-tiet-tin-tuc'

  get 'tat-ca-van-ban', to: 'documents#index'
  get 'tat-ca-van-ban-phong-ban/:id', to: 'documents#group_documents', as: 'tat-ca-van-ban-phong-ban'

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

end
