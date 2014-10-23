require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe FournisseursController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Fournisseur. As you add validations to Fournisseur, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FournisseursController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all fournisseurs as @fournisseurs" do
      fournisseur = Fournisseur.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:fournisseurs)).to eq([fournisseur])
    end
  end

  describe "GET show" do
    it "assigns the requested fournisseur as @fournisseur" do
      fournisseur = Fournisseur.create! valid_attributes
      get :show, {:id => fournisseur.to_param}, valid_session
      expect(assigns(:fournisseur)).to eq(fournisseur)
    end
  end

  describe "GET new" do
    it "assigns a new fournisseur as @fournisseur" do
      get :new, {}, valid_session
      expect(assigns(:fournisseur)).to be_a_new(Fournisseur)
    end
  end

  describe "GET edit" do
    it "assigns the requested fournisseur as @fournisseur" do
      fournisseur = Fournisseur.create! valid_attributes
      get :edit, {:id => fournisseur.to_param}, valid_session
      expect(assigns(:fournisseur)).to eq(fournisseur)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Fournisseur" do
        expect {
          post :create, {:fournisseur => valid_attributes}, valid_session
        }.to change(Fournisseur, :count).by(1)
      end

      it "assigns a newly created fournisseur as @fournisseur" do
        post :create, {:fournisseur => valid_attributes}, valid_session
        expect(assigns(:fournisseur)).to be_a(Fournisseur)
        expect(assigns(:fournisseur)).to be_persisted
      end

      it "redirects to the created fournisseur" do
        post :create, {:fournisseur => valid_attributes}, valid_session
        expect(response).to redirect_to(Fournisseur.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fournisseur as @fournisseur" do
        post :create, {:fournisseur => invalid_attributes}, valid_session
        expect(assigns(:fournisseur)).to be_a_new(Fournisseur)
      end

      it "re-renders the 'new' template" do
        post :create, {:fournisseur => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested fournisseur" do
        fournisseur = Fournisseur.create! valid_attributes
        put :update, {:id => fournisseur.to_param, :fournisseur => new_attributes}, valid_session
        fournisseur.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested fournisseur as @fournisseur" do
        fournisseur = Fournisseur.create! valid_attributes
        put :update, {:id => fournisseur.to_param, :fournisseur => valid_attributes}, valid_session
        expect(assigns(:fournisseur)).to eq(fournisseur)
      end

      it "redirects to the fournisseur" do
        fournisseur = Fournisseur.create! valid_attributes
        put :update, {:id => fournisseur.to_param, :fournisseur => valid_attributes}, valid_session
        expect(response).to redirect_to(fournisseur)
      end
    end

    describe "with invalid params" do
      it "assigns the fournisseur as @fournisseur" do
        fournisseur = Fournisseur.create! valid_attributes
        put :update, {:id => fournisseur.to_param, :fournisseur => invalid_attributes}, valid_session
        expect(assigns(:fournisseur)).to eq(fournisseur)
      end

      it "re-renders the 'edit' template" do
        fournisseur = Fournisseur.create! valid_attributes
        put :update, {:id => fournisseur.to_param, :fournisseur => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested fournisseur" do
      fournisseur = Fournisseur.create! valid_attributes
      expect {
        delete :destroy, {:id => fournisseur.to_param}, valid_session
      }.to change(Fournisseur, :count).by(-1)
    end

    it "redirects to the fournisseurs list" do
      fournisseur = Fournisseur.create! valid_attributes
      delete :destroy, {:id => fournisseur.to_param}, valid_session
      expect(response).to redirect_to(fournisseurs_url)
    end
  end

end
