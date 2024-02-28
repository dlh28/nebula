Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # Defines the root path route ("/")
    root "application#home"

    get "test", to: "application#test"

    get "entity", to: "entity#show"
    get "entity/unsupported_claims", to: "entity#unsupported_claims"
    get "entity/derived_statements", to: "entity#derived_statements"
    get "entity/expand", to: "entity#expand"
    get "dereference/card", to: "dereference#card"
    get "dereference/external", to: "dereference#external"
    get "query/show", to: "query#show"
    get "mint/preview", to: "mint#preview"
    get "mint/link", to: "mint#link"
    get "reconcile/query", to: "reconcile#query"
    
  end

  get 'sparql', to: redirect('http://artsdata-trifid-production.herokuapp.com/sparql/')

  get "github/callback", to: "github#callback"


  match "resource/*path", to: "resource#show", via: :get
  match "databus/*path", to: "resource#show", via: :get
  match "shacl/*path", to: "resource#show", via: :get
  match "ontology/*path", to: "resource#show", via: :get
  match "minted/*path", to: "resource#show", via: :get
  match "culture-creates/*path", to: "resource#show", via: :get
  
  



end
