shared_context 'standard crud actions' do

  def model_klass
    model_name.to_s.classify.constantize
  end

  def model_instance
    model_name.to_s.classify
  end

  def new_model
    model_klass.new
  end

  def build_model
    @build_model ||= FactoryGirl.build(model_name)
  end

  # Instance cache this, to ensure that the `existing_model` stays consistent
  # across the different tests.
  #
  def existing_model
    @existing_model ||= FactoryGirl.create(model_name)
  end

  shared_context 'collection GET response' do
    before { get action }

    it "should be reachable" do
      response.should be_success
    end

    it "should render correct template" do
      response.should render_template action
    end
  end

  shared_context 'instance GET response' do
    before do
      model_klass.stub(:find).with("1").and_return(existing_model)
      get action, id: 1
    end

    it "should be reachable" do
      response.should be_success
    end

    it "should render correct template" do
      response.should render_template action
    end

    it "should assign instance variable" do
      assigns(model_name).should eq existing_model
    end
  end

  shared_context 'collection POST response' do
    let(:data) { FactoryGirl.build(model_name).attributes }

    # TODO: Investigate why neigher the `new` or the `save` event gets
    #       triggered. <emil@kampp.me>
    xit "should create correctly" do
      model_klass.should_receive(:new).and_return FactoryGirl.build(model_name)
      model_klass.should_receive(:save).and_return true
      post action, model_name => data
    end

    it "should redirect" do
      post action, model_name => data
      response.should be_redirect
    end
  end

  describe "#index" do
    let(:action) { :index }
    include_context 'collection GET response'

    it "should assign instance variable" do
      get action
      assigns(model_name.to_s.pluralize).to_s.should match "Mongoid::Criteria"
    end
  end

  describe "#new" do
    let(:action) { :new }
    include_context 'collection GET response'

    it "should assign instance variable" do
      get action
      assigns(model_name).class.to_s.should eq new_model.class.to_s
    end
  end

  describe "#show" do
    let(:action) { :show }
    include_context 'instance GET response'
  end

  describe "#edit" do
    let(:action) { :show }
    include_context 'instance GET response'
  end

  describe "#create" do
    let(:action) { :create }
    include_context 'collection POST response'
  end
end
