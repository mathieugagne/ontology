require 'spec_helper'

describe Ontology::AjaxController do

  describe "GET 'types'" do
    it "should be successful" do
      get 'components'
      response.should be_success
    end
  end

  describe "GET 'predicates'" do
    it "should be successful" do
      get 'predicates'
      response.should be_success
    end
  end

end
 