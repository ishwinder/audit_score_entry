AuditControlEntry::Application.routes.draw do

  devise_for :employees
  get "unsaved_awaiting_audits/index"
  
  resources :claim_awaiting_audits do
    collection do
      post :upload_csv
    end
  end

  get "estimator_claim_audit_list/index"
  match "estimator_claim_audit_list/show_saved_audit_estimate" =>"estimator_claim_audit_list#show_saved_audit_estimate" ,via: [:post,:get]
  match "estimator_claim_audit_list/comment_history" =>"estimator_claim_audit_list#comment_history" ,via: [:post,:get]
  
  resources :estimator_claim_audit_list do
    collection do
      post :search
    end
  end
  
  resources :claim_audit_entries do
    collection do
      post :confirm_data
    end
  end

  resources :call_audit_score_entries do
    collection do
      post :confirm_data
    end
  end

  resources :claim_audit_lists do
    collection do
      get :set_params
      post :audits_list
    end
  end
  
  resources :claim_audit_questions
  
  resources :claim_audit_comments do
    collection do
      post :save
    end
  end

  resources :call_audit_list do 
    collection do
      post :search
      get :review_comment
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
