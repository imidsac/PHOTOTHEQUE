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

RSpec.describe VentelignesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Venteligne. As you add validations to Venteligne, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VentelignesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all ventelignes as @ventelignes" do
      venteligne = Venteligne.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ventelignes)).to eq([venteligne])
    end
  end

  describe "GET show" do
    it "assigns the requested venteligne as @venteligne" do
      venteligne = Venteligne.create! valid_attributes
      get :show, {:id => venteligne.to_param}, valid_session
      expect(assigns(:venteligne)).to eq(venteligne)
    end
  end

  describe "GET new" do
    it "assigns a new venteligne as @venteligne" do
      get :new, {}, valid_session
      expect(assigns(:venteligne)).to be_a_new(Venteligne)
    end
  end

  describe "GET edit" do
    it "assigns the requested venteligne as @venteligne" do
      venteligne = Venteligne.create! valid_attributes
      get :edit, {:id => venteligne.to_param}, valid_session
      expect(assigns(:venteligne)).to eq(venteligne)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Venteligne" do
        expect {
          post :create, {:venteligne => valid_attributes}, valid_session
        }.to change(Venteligne, :count).by(1)
      end

      it "assigns a newly created venteligne as @venteligne" do
        post :create, {:venteligne => valid_attributes}, valid_session
        expect(assigns(:venteligne)).to be_a(Venteligne)
        expect(assigns(:venteligne)).to be_persisted
      end

      it "redirects to the created venteligne" do
        post :create, {:venteligne => valid_attributes}, valid_session
        expect(response).to redirect_to(Venteligne.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved venteligne as @venteligne" do
        post :create, {:venteligne => invalid_attributes}, valid_session
        expect(assigns(:venteligne)).to be_a_new(Venteligne)
      end

      it "re-renders the 'new' template" do
        post :create, {:venteligne => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested venteligne" do
        venteligne = Venteligne.create! valid_attributes
        put :update, {:id => venteligne.to_param, :venteligne => new_attributes}, valid_session
        venteligne.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested venteligne as @venteligne" do
        venteligne = Venteligne.create! valid_attributes
        put :update, {:id => venteligne.to_param, :venteligne => valid_attributes}, valid_session
        expect(assigns(:venteligne)).to eq(venteligne)
      end

      it "redirects to the venteligne" do
        venteligne = Venteligne.create! valid_attributes
        put :update, {:id => venteligne.to_param, :venteligne => valid_attributes}, valid_session
        expect(response).to redirect_to(venteligne)
      end
    end

    describe "with invalid params" do
      it "assigns the venteligne as @venteligne" do
        venteligne = Venteligne.create! valid_attributes
        put :update, {:id => venteligne.to_param, :venteligne => invalid_attributes}, valid_session
        expect(assigns(:venteligne)).to eq(venteligne)
      end

      it "re-renders the 'edit' template" do
        venteligne = Venteligne.create! valid_attributes
        put :update, {:id => venteligne.to_param, :venteligne => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested venteligne" do
      venteligne = Venteligne.create! valid_attributes
      expect {
        delete :destroy, {:id => venteligne.to_param}, valid_session
      }.to change(Venteligne, :count).by(-1)
    end

    it "redirects to the ventelignes list" do
      venteligne = Venteligne.create! valid_attributes
      delete :destroy, {:id => venteligne.to_param}, valid_session
      expect(response).to redirect_to(ventelignes_url)
    end
  end

end
