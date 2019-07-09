require "Rails_helper"

RSpec.describe Article, type: :model do
  it "アーティクルモデルのバリデーションの確認" do
    article = Article.new
    expect(article).not_to be_valid
  end
end



