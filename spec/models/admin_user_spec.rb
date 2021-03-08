# == Schema Information
#
# Table name: admin_users
#
#  id                     :uuid             not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'バリデーション' do
    it 'emailは必須' do
      invalid_model = FactoryBot.build(:admin_user, email: nil)
      expect(invalid_model.save).to be_falsey
    end

    it 'nameは必須' do
      invalid_model = FactoryBot.build(:admin_user, name: nil)
      expect(invalid_model.save).to be_falsey
    end
  end

  describe 'AdminUser.create' do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    it '管理者アカウントが作成される' do
      expect(admin_user).to be_persisted
      expect(admin_user.valid_password?('password')).to be_truthy
    end

    it 'メールアドレスが重複しているため作成できない' do
      invalid_model = FactoryBot.build(:admin_user, email: admin_user.email)
      expect(invalid_model.save).to be_falsey
    end
  end
end
