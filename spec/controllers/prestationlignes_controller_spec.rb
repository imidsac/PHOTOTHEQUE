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

RSpec.describe PrestationlignesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Prestationligne. As you add validations to Prestationligne, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PrestationlignesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all prestationlignes as @prestationlignes" do
      prestationligne = Prestationligne.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:prestationlignes)).to eq([prestationligne])
    end
  end

  describe "GET show" do
    it "assigns the requested prestationligne as @prestationligne" do
      prestationligne = Prestationligne.create! valid_attributes
      get :show, {:id => prestationligne.to_param}, valid_session
      expect(assigns(:prestationligne)).to eq(prestationligne)
    end
  end

  describe "GET new" do
    it "assigns a new prestationligne as @prestationligne" do
      get :new, {}, valid_session
      expect(assigns(:prestationligne)).to be_a_new(Prestationligne)
    end
  end

  describe "GET edit" do
    it "assigns the requested prestationligne as @prestationligne" do
      prestationligne = Prestationligne.create! valid_attributes
      get :edit, {:id => prestationligne.to_param}, valid_session
      expect(assigns(:prestationligne)).to eq(prestationligne)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Prestationligne" do
        expect {
          post :create, {:prestationligne => valid_attributes}, valid_session
        }.to change(Prestationligne, :count).by(1)
      end

      it "assigns a newly created prestationligne as @prestationligne" do
        post :create, {:prestationligne => valid_attributes}, valid_session
        expect(assigns(:prestationligne)).to be_a(Prestationligne)
        expect(assigns(:prestationligne)).to be_persisted
      end

      it "redirects to the created prestationligne" do
        post :create, {:prestationligne => valid_attributes}, valid_session
        expect(response).to redirect_to(Prestationligne.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved prestationligne as @prestationligne" do
        post :create, {:prestationligne => invalid_attributes}, valid_session
        expect(assigns(:prestationligne)).to be_a_new(Prestationligne)
      end

      it "re-renders the 'new' template" do
        post :create, {:prestationligne => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested prestationligne" do
        prestationligne = Prestationligne.create! valid_attributes
        put :update, {:id => prestationligne.to_param, :prestationligne => new_attributes}, valid_session
        prestationligne.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested prestationligne as @prestationligne" do
        prestationligne = Prestationligne.create! valid_attributes
        put :update, {:id => prestationligne.to_param, :prestationligne => valid_attributes}, valid_session
        expect(assigns(:prestationligne)).to eq(prestationligne)
      end

      it "redirects to the prestationligne" do
        prestationligne = Prestationligne.create! valid_attributes
        put :update, {:id => prestationligne.to_param, :prestationligne => valid_attributes}, valid_session
        expect(response).to redirect_to(prestationligne)
      end
    end

    describe "with invalid params" do
      it "assigns the prestationligne as @prestationligne" do
        prestationligne = Prestationligne.create! valid_attributes
        put :update, {:id => prestationligne.to_param, :prestationligne => invalid_attributes}, valid_session
        expect(assigns(:prestationligne)).to eq(prestationligne)
      end

      it "re-renders the 'edit' template" do
        prestationligne = Prestationligne.create! valid_attributes
        put :update, {:id => prestationligne.to_param, :prestationligne => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested prestationligne" do
      prestationligne = Prestationligne.create! valid_attributes
      expect {
        delete :destroy, {:id => prestationligne.to_param}, valid_session
      }.to change(Prestationligne, :count).by(-1)
    end

    it "redirects to the prestationlignes list" do
      prestationligne = Prestationligne.create! valid_attributes
      delete :destroy, {:id => prestationligne.to_param}, valid_session
      expect(response).to redirect_to(prestationlignes_url)
    end
  end

end
