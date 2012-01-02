require 'data'

def pearson_similarity_score(person1, person2, ratings)
    common_movies = []
    ratings[person1].each do |movie, rating|
        if(ratings[person2][movie])
            common_movies.push
        end
    end
    return 0 if common_movies.empty?
    count = common_movies.count

    sum1 = sum_of_ratings(common_movies, person1)
    sum2 = sum_of_ratings(common_movies, person2)

    sum_sq1 = sum_of_squares_of_ratings(common_movies, person1)
    sum_sq2 = sum_of_squares_of_ratings(common_movies, person2)

    sum_of_products = 0
    common_movies.each {|movie| sum_of_products += (ratings[person1][movie] * ratings[person2][movie])}

    numerator = sum_of_products - (sum1 * sum2/count)
    denominator = Math.sqrt(sum_sq1 - (square(sum1))/count) * (sum_sq2 - (square(sum2))/count)
    return 0 if denominator == 0
    numerator/denominator
end

def sum_of_ratings(common_movies, person)
    sum = 0
    common_movies.each {|movie| sum += ratings[person][movie]}
end

def sum_of_squares_of_ratings(common_movies, person)
    sum = 0
    common_movies.each {|movie| sum += ratings[person][movie] ** 2}
end

def square(n)
    n ** 2
end
