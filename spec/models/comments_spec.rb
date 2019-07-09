RSpec.describe Comment, type: :model do
  it "コメントモデルのバリデーションの確認" do
    comment = Comment.new
    expect(comment).not_to be_valid
  end
end