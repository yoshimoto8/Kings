namespace :average_item_evaluation do
  desc "コスメアイテムの評価の平均を計算し,データベースへ保存する"

  task :count_average => :environment do 
    Review.all.each do |review|
      users = review.cosmetic
      # users.map { |user| user.}

    end
  end
end
