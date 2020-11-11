class Game < ActiveRecord::Base

    belongs_to :user 
    has_many :game_questions 
    has_many :questions, through: :game_questions


    # def self.leaderboard 
    #     all_scores = self.all.max_by(10) { |g| g.score} 
    #     user_id = all_scores.map { |game| game.user_id }
    #     players = user_id.map {|id| User.find(id).username}
    #     scores = all_scores.map { |g| g.score }
    #     # binding.pry
    #     i = 0
    #     while i < 10
    #      puts "#{i + 1}. #{players[i]}: #{scores[i]}"
    #      i +=1
    #     end 
    #  end

    #  def self.see_scores
    #     players_games = self.all.find_all { |g| g.user_id == @user.id}
    #     p1 = players_games.map { |pg| pg.score}
    #     p2 = p1.max(5)
    #     puts "Your top scores are:\n"  
    #     p2.each.with_index(1) do |s, i| puts "#{i}. #{s}" end
    # end 
end