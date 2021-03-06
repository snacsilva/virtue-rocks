require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/leaders", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Leader. As you add validations to Leader, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      employee_id: employee_1.id,
      led_id: employee_2.id
    }
  }

  let(:employee_1) { create(:employee,
    enterprise_id: enterprise.id) }

  let(:employee_2) { create(:employee,
    enterprise_id: enterprise.id) }

  let(:enterprise) { create(:enterprise) }

  let(:invalid_attributes) {
    {
      name: 'Crazy eyes'
    } 
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # LeadersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Leader.create valid_attributes
      get enterprise_leaders_path(enterprise.id), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      leader = Leader.create valid_attributes
      get enterprise_leaders_url(leader), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Leader" do
        expect {
          post enterprise_leaders_path(enterprise.id),
               params: { leader: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Leader, :count).by(1)
      end

      it "renders a JSON response with the new leader" do
        post enterprise_leaders_path(enterprise.id),
             params: { leader: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Leader" do
        expect {
          post enterprise_leaders_path(enterprise.id),
               params: { leader: invalid_attributes }, as: :json
        }.to change(Leader, :count).by(0)
      end

      it "renders a JSON response with errors for the new leader" do
        post enterprise_leaders_path(enterprise.id),
             params: { leader: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          employee_id: employee_1.id,
          led_id: employee_2.id
        }
      }

      it "updates the requested leader" do
        leader = Leader.create valid_attributes
        patch enterprise_leader_path(enterprise.id, leader),
              params: { leader: new_attributes }, headers: valid_headers, as: :json
        leader.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the leader" do
        leader = Leader.create valid_attributes
        patch enterprise_leader_path(enterprise.id, leader),
              params: { leader: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the leader" do
        leader = Leader.create valid_attributes
        patch enterprise_leader_path(enterprise.id, leader),
              params: { leader: invalid_attributes }, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested leader" do
      leader = Leader.create valid_attributes
      expect {
        delete enterprise_leader_path(enterprise.id, leader), headers: valid_headers, as: :json
      }.to change(Leader, :count).by(-1)
    end
  end
end
