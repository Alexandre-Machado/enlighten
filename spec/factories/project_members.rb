# == Schema Information
#
# Table name: project_members
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  person_id    :integer
#  period_start :date
#  period_end   :date
#  function     :string
#

FactoryGirl.define do
  factory :project_member, class: ProjectMember do
    period_start { Date.today - 6.months }
    function { 'dev' }
  end
end
