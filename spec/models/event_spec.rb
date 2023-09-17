require 'rails_helper'

RSpec.describe Event, type: :model do

    it "is valid with name, place, content, start_at, end_at" do
      user = User.create(provider: "github", uid: "uid", name: "name", image_url: "url")
      event = Event.new(
        owner_id: user.id,
        name: "name",
        place: "place",
        content: "content",
        start_at: DateTime.now,
        end_at: DateTime.now + 1
      )
      expect(event).to be_valid
    end

    it "is invalid without name" do
      user = User.create(provider: "github", uid: "uid", name: "name", image_url: "url")
      event = Event.new(
        owner_id: user.id,
        place: "place",
        content: "content",
        start_at: DateTime.now,
        end_at: DateTime.now + 1
      )
      event.valid?
      expect(event.errors[:name]).to include("を入力してください")
    end

    it "is invalid without place" do
      user = User.create(provider: "github", uid: "uid", name: "name", image_url: "url")
      event = Event.new(
        owner_id: user.id,
        name: "name",
        content: "content",
        start_at: DateTime.now,
        end_at: DateTime.now + 1
      )
      event.valid?
      expect(event.errors[:place]).to include("を入力してください")
    end

    it "is invalid if start_at is after end_at" do
      user = User.create(provider: "github", uid: "uid", name: "name", image_url: "url")
      event = Event.new(
        owner_id: user.id,
        name: "name",
        place: "place",
        content: "content",
        start_at: DateTime.now + 1,
        end_at: DateTime.now
      )
      event.valid?
      expect(event.errors[:start_at]).to include("は終了時間よりも前に設定してください")
    end
end
