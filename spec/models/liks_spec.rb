RSpec.describe Like, type: :model do
  it "ライクモデルのバリデーションの確認" do
    like = Like.new
    expect(like).not_to be_valid
  end
end