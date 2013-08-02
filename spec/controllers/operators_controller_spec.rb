require 'spec_helper'

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

describe OperatorsController do

  # This should return the minimal set of attributes required to create a valid
  # Operator. As you add validations to Operator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OperatorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all operators as @operators" do
      operator = Operator.create! valid_attributes
      get :index, {}, valid_session
      assigns(:operators).should eq([operator])
    end
  end

  describe "GET show" do
    it "assigns the requested operator as @operator" do
      operator = Operator.create! valid_attributes
      get :show, {:id => operator.to_param}, valid_session
      assigns(:operator).should eq(operator)
    end
  end

  describe "GET new" do
    it "assigns a new operator as @operator" do
      get :new, {}, valid_session
      assigns(:operator).should be_a_new(Operator)
    end
  end

  describe "GET edit" do
    it "assigns the requested operator as @operator" do
      operator = Operator.create! valid_attributes
      get :edit, {:id => operator.to_param}, valid_session
      assigns(:operator).should eq(operator)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Operator" do
        expect {
          post :create, {:operator => valid_attributes}, valid_session
        }.to change(Operator, :count).by(1)
      end

      it "assigns a newly created operator as @operator" do
        post :create, {:operator => valid_attributes}, valid_session
        assigns(:operator).should be_a(Operator)
        assigns(:operator).should be_persisted
      end

      it "redirects to the created operator" do
        post :create, {:operator => valid_attributes}, valid_session
        response.should redirect_to(Operator.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved operator as @operator" do
        # Trigger the behavior that occurs when invalid params are submitted
        Operator.any_instance.stub(:save).and_return(false)
        post :create, {:operator => { "id" => "invalid value" }}, valid_session
        assigns(:operator).should be_a_new(Operator)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Operator.any_instance.stub(:save).and_return(false)
        post :create, {:operator => { "id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested operator" do
        operator = Operator.create! valid_attributes
        # Assuming there are no other operators in the database, this
        # specifies that the Operator created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Operator.any_instance.should_receive(:update_attributes).with({ "id" => "" })
        put :update, {:id => operator.to_param, :operator => { "id" => "" }}, valid_session
      end

      it "assigns the requested operator as @operator" do
        operator = Operator.create! valid_attributes
        put :update, {:id => operator.to_param, :operator => valid_attributes}, valid_session
        assigns(:operator).should eq(operator)
      end

      it "redirects to the operator" do
        operator = Operator.create! valid_attributes
        put :update, {:id => operator.to_param, :operator => valid_attributes}, valid_session
        response.should redirect_to(operator)
      end
    end

    describe "with invalid params" do
      it "assigns the operator as @operator" do
        operator = Operator.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Operator.any_instance.stub(:save).and_return(false)
        put :update, {:id => operator.to_param, :operator => { "id" => "invalid value" }}, valid_session
        assigns(:operator).should eq(operator)
      end

      it "re-renders the 'edit' template" do
        operator = Operator.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Operator.any_instance.stub(:save).and_return(false)
        put :update, {:id => operator.to_param, :operator => { "id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested operator" do
      operator = Operator.create! valid_attributes
      expect {
        delete :destroy, {:id => operator.to_param}, valid_session
      }.to change(Operator, :count).by(-1)
    end

    it "redirects to the operators list" do
      operator = Operator.create! valid_attributes
      delete :destroy, {:id => operator.to_param}, valid_session
      response.should redirect_to(operators_url)
    end
  end

end
