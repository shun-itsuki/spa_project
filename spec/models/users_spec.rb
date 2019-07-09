RSpec.describe Users, type: :model do
  it "ユーザーモデルのバリデーションの確認" do
      users = User.new
      expect(users).not_to be_valid
  end
end