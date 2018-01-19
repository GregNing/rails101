class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :content, presence: true
  # 这里的 order("created_at DESC") 是“程序语句”，但不是“功能叙述”。我们作为旁观者，只能猜测这是要按照“最近的时序排列”。

  # 如果能改成 @group.posts.recent 可能在维护性上更直观。

  # 这里我们还可以用 Rails 里面的一个内建 API scope 让代码更直观一些。 scope 可以用来包装一些查询式，如果我们这里想要让最后的代码变成 @group.posts.recent 的话，作法如下：

  # 修改 app/models/post.rb，加入一行 scope :recent, -> { order("created_at DESC")}
  #     order("created_at DESC") 是什么？
  # 实际上呢，Model 里面的所有语句，看起来是“Ruby 语句”，
  # 实际上是 Rails 帮我们“翻译”成为了数据库语句。（这一套叫 ActiveRecord 框架）
  # 如果有兴趣的话，Rails 的 Log 都有显示的。
  # scope 又是什么呢？
  # 你可以想像成，拿来包装“常用 query”的方法。理解到这里就可以了。
  # 更多 scope 的用法：http://guides.rubyonrails.org/active_record_querying.html
  scope :recent, -> { order('created_at DESC') }
end
