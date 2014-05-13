require_relative 'task_spec'

describe TodoList do
  let(:list) { TodoList.new }
  it {should respond_to(:title) }

  context "#tasks" do
    it { should respond_to(:posts) }
    it "should return an activerecord association" do
      list.tasks.class.should eq Activerecord_Associations_CollectionProxy
    end

    it "should contain tasks" do
      task = Task.new
      list.add_task(task)
      list.tasks[0].class.should eq Task
    end
  end

  context "#add_task" do
      it "should be able to add a task" do
      task = Task.new
      list.add_task(task)
      list.tasks.last should eq task
    end
  end

  context "#complete_all!" do
    it "should mark off all tasks as complete" do
      list << Task.new << Task.new << Task.new
      expect { list.complete_all! }.to change{list.complete?}.from(false).to(true)
    end
  end

  context "#complete?" do
    it "should return a boolean"
      list.complete?.class.should eq Boolean
    end
    it "should return a false with incomplete tasts" do
      list << Task.new(status: false)
      list.complete?.should eq false
    end
    it "should return true when all tasks are complete" do
      let(:list_new) { List.new }
      list_new.tasks << Task.new(status: true) << Task.new(status: true)
      list_new.complete?.should eq true
    end
  end

  context "#completed_tasks" do
    let(:list) {List.new}
    before do
      list << Task.new(status: false) << Task.new(status: false) << Task.new(status: true) << Task.new(status: true) << Task.new(status: true)
    end

    it "should return an array" do
      list.completed_tasks.class.should eq Array
    end

    it "should only return completed tasks" do
      list.completed_tasks.length.should eq list.completed_tasks.collect{|task| task.status == true }.length
    end

    it "should return all completed tasks from list" do
      list.completed_tasks.length.should eq list.tasks.collect{|task| task.status == true }.length
    end
  end

  context "#incomplete_tasks" do
    let(:list) {List.new}
    before do
      list << Task.new(status: false) << Task.new(status: false) << Task.new(status: true) << Task.new(status: true) << Task.new(status: true)
    end
    it "should return an array" do
      list.incomplete_tasks.class.should eq Array
    end

    it "should only return incomplete_tasks" do
       list.incomplete_tasks.length.should eq list.incomplete_tasks.collect{|task| task.status == false }.length
    end

    it "should return all incomplete_tasks from list" do
      list.incomplete_tasks.length.should eq list.tasks.collect{|task| task.status == false }.length
    end
  end


end
