require_relative 'factories'
require_relative 'contact'
require_relative 'group'

describe Group do
  before(:each) do
    $db.transaction
  end

  after(:each) do
    $db.rollback
  end

  pending "#save" do
    pending "on a new record" do
      let(:group) { Group.new }

      pending "sets id after saving" do
        expect(group.id).to be_nil
        group.save
        expect(group.id).not_to be_nil
      end
    end

    pending "on an existing record" do
      let(:group) { Group.find(create_group(name: 'Peeps')) }

      pending "updates the other columns" do
        expect(group.name).to eq('Peeps')
        group.name = 'Moar Peeps'
        group.save
        expect(group.name).to eq('Moar Peeps')
      end
    end
  end

  pending ".find" do
    let(:id) { create_group(name: 'Boots') }

    pending "finds record by ID" do
      group = Group.find(id)
      expect(group).to_not be_nil
      expect(group.id).to eq(id)
    end

    pending "returns nil if the record is not found" do
      group = Group.find(-100)
      expect(group).to be_nil
    end
  end

  pending "#destroy" do
    let(:group) { Group.find(create_group(name: 'Bob')) }

    pending "removes the record" do
      group.destroy
      expect(Group.find(group.id)).to be_nil
    end

    pending "cascading delete" do
      let!(:contact) do
        record = Contact.find(create_contact(first_name: 'Bob'))
        record.add_group(group)
        record
      end

      pending "removes the group" do
        expect(contact.groups).not_to be_empty
        group.destroy
        expect(contact.groups).to be_empty
      end
    end
  end

  pending ".all" do
    let!(:firefly_id) { create_group(name: 'Fireflies') }
    let!(:coyote_id) { create_group(name: 'Coyotes') }
    let(:groups) { Group.all }

    pending "returns an array of groups" do
      expect(groups).to be_an(Array)
      expect(groups.first).to be_a(Group)
    end

    pending "returns all groups" do
      ids = groups.map(&:id)
      expect(ids).to include(firefly_id)
      expect(ids).to include(coyote_id)
    end
  end

  pending ".where" do
    let!(:firefly_id) { create_group(name: 'Fireflies') }
    let!(:coyote_id) { create_group(name: 'Coyotes') }
    let(:groups) { Group.where("name = 'Fireflies'") }

    pending "returns an array of groups" do
      expect(groups).to be_an(Array)
      expect(groups.first).to be_a(Group)
    end

    pending "includes only matching records" do
      ids = groups.map(&:id)
      expect(ids).to include(firefly_id)
      expect(ids).not_to include(coyote_id)
    end
  end

end

