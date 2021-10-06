# Liskov Substitution Principle
#
# Subtype Requirement: Let Φ(𝒙) be a property provable about objects 𝑥 of type T.
# Then Φ(𝒚) should be true for objects 𝒚 of type S where S is a subtype of T.
#                                   Barbara Liskov and Jeannette Wing
#
# Subclasses should add to a base class’s behaviour, not replace it.
#                                   Robert Martin

# Bad
class UserStatistic
  def initialize(user)
    @user = user
  end

  def posts
    @user.blog.posts
  end
end

class AdminStatistic < UserStatistic
  def posts
    user_posts = super

    string = ''
    user_posts.each do |post|
      string += "title: #{post.title} author: #{post.author}\n" if post.popular?
    end

    string
  end
end


# Good
class UserStatistic
  def initialize(user)
    @user = user
  end

  def posts
    @user.blog.posts
  end
end

class AdminStatistic < UserStatistic
  def posts
    user_posts = super
    user_posts.select { |post| post.popular? }
  end

  def formatted_posts
    posts.map { |post| "title: #{post.title} author: #{post.author}" }.join("\n")
  end
end

# Anti-LSP — Принцип непонятного наследования.
# Данный анти-принцип проявляется либо в чрезмерном количестве наследования,
# либо в его полном отсутствии, в зависимости от опыта и взглядов местного главного архитектора.
