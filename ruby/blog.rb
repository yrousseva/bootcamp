class Comment
  attr_accessor :body, :author, :created_at

  def initialize(body, author)
    @body = body
    @author = author
    @created_at = Time.now
  end

  def to_s
    t = @created_at.strftime('%Y-%m-%d %H:%m')
    "<body:#{@body}[0,10]}...|author:#{@author}|created_at:#{t}>"
  end
end


class Post
  attr_accessor :title, :body, :author, :created_at
  attr_reader :comments

  def initialize(title, body, author, created_at=Time.now)
    @title = title
    @body = body
    @author = author
    @created_at = created_at
    @comments = []
  end

  def <<(c)
    @comments << c
  end

  def to_s
    t = @created_at.strftime('%Y-%m-%d %H:%m')
    "<title:#{@title}|body:#{@body[0,10]}...|created_at:#{t}>"
  end
end
