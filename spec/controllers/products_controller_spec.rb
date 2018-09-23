require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user, admin: false)
    @admin = FactoryBot.create(:admin)
  end

  describe 'GET #index' do
    context 'when a user goes to index page' do
      it 'renders the index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    context 'when a user goes to product page' do
      it 'renders the show template' do
        get :show, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
      end
    end
  end

  describe 'GET #new' do
    context 'when an admin goes to new product' do
      before do
        sign_in @admin
      end
      it 'redirects to new product page' do
        get :new, params: {id: @product}
        expect(response).to be_ok 
      end
    end
    context 'when non-admin user goes to new product' do
      before do
        sign_in @user
      end
      it 'redirect him/her to root path' do
          get :new, params: { id: @product.id }
          expect(assigns(:product)).to eq @product
          expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'when an admin goes to edit a product' do
      before do
        sign_in @admin
      end
      it 'renders the edit template' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to render_template('edit')
      end
    end
    context 'when a non-admin user goes to edit a product' do
      before do
        sign_in @user
      end
      it 'redirect him/her to root path' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when an admin submits a new product' do
      before do
        sign_in @admin
      end
      it 'creates a new product if valid' do
        @product = FactoryBot.create(:product)
        expect(response).to be_successful
      end

      it "cannot create a product" do
        expect(Product.new(price:'string', description: '')).not_to be_valid
      end
    end
  end

  describe "PATCH #update" do
    context "with good data" do
      before do
        sign_in @admin
      end
      it "updates the product and redirects" do
        get :edit, params: { id: @product.id }
        patch :update, params: { id: @product.id, product: { name: "notepad",  price: "5", description: 'nice'}}
        expect(response).to be_redirect
      end
    end
    context "with bad data" do
      it "does not change the product, and redirects to login page" do
        patch :update, id: @product.id, product: { name: "notepad", price: "four"}
        expect(response).to redirect_to new_user_session_path
      end
    end
    context 'DELETE' do
      before do
        sign_in @admin
      end
      it 'can delete a product' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to (products_path)
      end
    end
  end
end
