namespace :average_item_evaluation do
  desc "コスメアイテムの評価の平均を計算し,データベースへ保存する"

  task :count_average => :environment do 
    Cosmetic.all.each do |cos|
      reviews_valuation = cos.reviews.map {|review| review.reviews_valuation}
      avarage = reviews_valuation.inject(0.0){|r,i| r+=i } / reviews_valuation.size
      if avarage.nan? != true
        cos.update(valuation_average: avarage.round(1))
      else
        cos.update(valuation_average: nil)
      end
    end
  end
end
