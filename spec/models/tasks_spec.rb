require 'rails_helper'

RSpec.describe Task, type: :model do

  it "can be created" do
    task = Task.create!(description: "new tasky task")

    expect(task.description).to eq("new tasky task")
  end
end
