require 'spec_helper'

describe ActiveRecord::HumanizedErrors do

  before(:all) do
    ActiveRecord::Migration.create_table :models do |t|
      t.string :name
      t.string :email
    end

    class Model < ActiveRecord::Base
      validates_presence_of :name, :email
    end
  end

  subject               { model }

  shared_examples_for :invalid_model do
    it { should be_invalid }
    its(:humanized_errors) { should be_a(String) }
    its(:humanized_errors) do
      subject.errors.clear
      subject.send :run_validations!
      should eq(subject.errors.full_messages.join(', '))
    end
  end

  context 'when instantiating new record' do
    context 'without any required attribute' do
      let(:model) { Model.new }

      it_behaves_like :invalid_model

      ['Name', 'Email'].each do |column|
        its(:humanized_errors) { should include("#{column} can't be blank") }
      end
    end

    context 'with 1 of 2 required attributes' do
      let(:model) { Model.new name: 'John' }

      it_behaves_like :invalid_model

      its(:humanized_errors) { should eq("Email can't be blank") }
      its(:humanized_errors) { should_not include("Name can't be blank") }
    end

    context 'with all required attributes' do
      let(:model) { Model.new name: 'John', email: 'john@example.com' }

      it { should be_valid }
      its(:humanized_errors) { should be_blank }
    end
  end

  context 'when creating new record' do
    context 'without any required attribute' do
      let(:model) { Model.create }

      it_behaves_like :invalid_model

      ['Name', 'Email'].each do |column|
        its(:humanized_errors) { should include("#{column} can't be blank") }
      end
    end

    context 'with 1 of 2 required attributes' do
      let(:model) { Model.create name: 'John' }

      it_behaves_like :invalid_model

      its(:humanized_errors) { should eq("Email can't be blank") }
      its(:humanized_errors) { should_not include("Name can't be blank") }
    end

    context 'with all required attributes' do
      let(:model) { Model.create name: 'John', email: 'john@example.com' }

      it { should be_valid }
      its(:humanized_errors) { should be_blank }
    end
  end

  context 'when updating an existing record' do
    let(:model) { Model.create name: 'John', email: 'john@example.com' }

    before do
      expect(subject).to be_valid
      expect(subject.humanized_errors).to be_blank
      subject.update_attributes(name: nil)
    end

    it_behaves_like :invalid_model
    its(:humanized_errors) { should eq("Name can't be blank") }
  end

end
