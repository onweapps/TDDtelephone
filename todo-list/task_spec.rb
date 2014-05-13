describe Task do

  let(:task) { Task.new }

  context "#new" do
    it 'created a tast object' do
      task.should be_an_instance_of Task
    end
  end
  it {should respond_to(:title) }
  it {should respond_to(:description) }
  it {should respond_to(:status) }

  context "#timestamps" do
    let(:task) { Task.create }
    it "should exist upon initialization" do
      task.created_at.should_not eq nil
    end
    it "should be a datetime" do
      task.created_at.class.should eq Datetime
    end
  end

  context "#mark_as_complete!" do
    it "should set its status to complete" do
      task.status = false
      task.mark_as_complete!
      task.status.should eq true
    end
  end

  context "#mark_as_incomplete!" do
    it "should set its status to incomplete" do
      task.status = true
      task.mark_as_incomplete!
      task.status.should eq false
    end
  end

  context "#complete?" do
    it "should return a boolean" do
      task.complete?.class.should eq Boolean
    end
  end


end
