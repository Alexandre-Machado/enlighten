# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  scm_type      :string
#  scm_reference :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image_id      :string
#  client_id     :integer
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { expect(subject).to have_db_column(:id) }
  it { expect(subject).to have_db_column(:client_id) }
  it { expect(subject).to have_db_column(:name) }
  it { expect(subject).to have_db_column(:description) }
  it { expect(subject).to have_db_column(:scm_type) }
  it { expect(subject).to have_db_column(:scm_reference) }
  it { expect(subject).to have_db_column(:created_at) }
  it { expect(subject).to have_db_column(:updated_at) }

  it { expect(subject).to belong_to(:client) }
  it { expect(subject).to have_many(:members) }
  it { expect(subject).to have_and_belong_to_many(:technologies) }

  describe '#members' do
    it 'associates project members' do
      project = create :project
      member = create :project_member, person: create(:person)

      project.members << member
      project.save
      project.reload

      expect(project.members).to eq [member]
    end
  end

  describe '#technologies' do
    it 'associates project technologies' do
      project = create :project
      technology = create :technology

      project.technologies << technology
      project.save
      project.reload

      expect(project.technologies).to eq [technology]
    end
  end
end
