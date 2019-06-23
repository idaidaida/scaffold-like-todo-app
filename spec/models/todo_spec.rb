require 'rails_helper'

RSpec.describe Todo, type: :model do
  
  describe "#title" do
    describe "バリデーションチェック" do
      it "空の場合、エラー" do
        todo = Todo.new
        todo.title = ""
        todo.body = "test body"

        todo.valid?
        expect( todo.errors.messages[:title] ).to include("can't be blank")
      end

      it "Nilの場合、エラー" do
        todo = Todo.new
        todo.title = nil
        todo.body = "test body"

        todo.valid?
        expect( todo.errors.messages[:title] ).to include("can't be blank")
      end
    end
  end

  describe "#body" do
    describe "バリデーションチェック" do
      it "空でもエラーにならない" do
        todo = Todo.new
        todo.title = "test title"
        todo.body = ""

        todo.valid?
        expect( todo.errors.messages[:body] ).not_to include("can't be blank")
      end
      it "Nilでもエラーにならない" do
        todo = Todo.new
        todo.title = "test title"
        todo.body = nil

        todo.valid?
        expect( todo.errors.messages[:body] ).not_to include("can't be blank")
      end
    end
  end

end
