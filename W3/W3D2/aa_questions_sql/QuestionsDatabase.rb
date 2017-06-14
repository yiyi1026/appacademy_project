require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end #of class

class ModelBase

  attr_reader :table

  def initialize(options)

  end

  def find_by_id(id)
    obj = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
    return nil unless obj.length > 0

    User.new(user.first) # play is stored in an array!
  end

end

class User < QuestionsDatabase

  attr_accessor :fname, :lname
  attr_reader :id

  def save
    if id.nil?
      # insert
      QuestionsDatabase.instance.execute(<<-SQL,@fname,@lname)
        INSERT INTO
          users(fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      # update
      QuestionsDatabase.instance.execute(<<-SQL,@fname,@lname,@id)
        UPDATE users
        SET
          fname = ? , lname = ?
        WHERE
          id = ?
      SQL
    end
    self
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
       users
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) # play is stored in an array!
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    @table = 'users'
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def liked_questions
    Question_Like.liked_questions_for_user_id(id)
  end

  def followed_questions
    Question_Follow.followed_questions_for_user_id(id)
  end

  def average_karma
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        CAST(COUNT(question_likes.id) AS FLOAT / COUNT(DISTINCT(questions.id)) AS avg_karma)
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?;

    SQL
    # return nil unless num.length > 0

  end

end


class Question
  attr_reader :id
  attr_accessor :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    question.map{|el|Question.new(el)}

  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0

    question.map{|el|Question.new(el)}
  end

  def self.most_followed(n)
    Question_Follow.most_followed_questions(n)
  end

  def self.most_liked(n)
    Question_Like.most_liked_questions(n)
  end


  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    Question_Follow.followers_for_question_id(id)
  end

  def likers
    Question_Like.likers_for_question_id(id)
  end

  def num_likes
    Question_Like.num_likes_for_question_id(id)
  end



end



class Question_Follow

  attr_accessor :follower_id, :question_id
  attr_reader :id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| Question_Follow.new(datum) }
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless question_follow.length > 0

    Question_Follow.new(question_follow.first) # play is stored in an array!
  end

  def initialize(options)
    @id = options['id']
    @follower_id = options['follower_id']
    @question_id = options['question_id']
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON follower_id = users.id
      WHERE
        question_id = ?
    SQL
    return nil unless followers.length > 0

    followers.map{ |el| User.new(el) }
  end

  def self.followed_questions_for_user_id(user_id)
    followed_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_id
      WHERE
        follower_id = ?
    SQL
    return nil unless followed_questions.length > 0

    followed_questions.map{ |el| Question.new(el) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *, COUNT(*) AS count
      FROM
        questions
      JOIN
        question_follows ON question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        count DESC
      LIMIT
        ?
    SQL
    return nil unless questions.length > 0

    questions.map{ |el| Question.new(el) }
  end
end


class Reply

  attr_accessor :question_id, :author_id, :parent_id, :body
  attr_reader :id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_user_id(author_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map{|el|Reply.new(el)}

  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map{|el|Reply.new(el)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @author_id = options['author_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

  def author
    User.find_by_id(author_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_id)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)

  end

end


class Question_Like

  attr_accessor :liker_id, :question_id
  attr_reader :id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| Question_Like.new(datum) }
  end

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON liker_id = users.id
      WHERE
        question_id = ?

    SQL

    return nil unless likers.length > 0
    likers.map{ |el| User.new(el) }

  end

  def self.num_likes_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      WHERE
        question_id = ?
      GROUP BY
        question_id

    SQL
    # return nil if likers[0].empty?
    likers[0].values[0]
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON question_id = questions.id
      WHERE
        liker_id = ?

    SQL

    return nil unless questions.length > 0
    questions.map{ |el| Question.new(el) }


  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*, COUNT(*) AS count
      FROM
        questions
      JOIN
        question_likes ON question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        count DESC
      LIMIT
        ?
    SQL
    return nil unless questions.length > 0
    questions.map{ |el| Question.new(el) }
  end

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0

    Question_Like.new(question_like.first) # play is stored in an array!
  end

  def initialize(options)
    @id = options['id']
    @liker_id = options['liker_id']
    @question_id = options['question_id']
  end

end
