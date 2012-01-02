require 'data'

DATA = Ci_sandbox::Data::RATINGS

def euclidean_similarity_score(person1, person2, ratings)
    sum = 0
    ratings[person1].each do |movie, rating|
        if(ratings[person2][movie])
           sum += ((ratings[person1][movie] - ratings[person2][movie]) ** 2)
        end
    end
    1 / (sum + 1)
end

i = 0
keys = DATA.keys
p1, p2 = keys[0], keys[1]
highest_score = euclidean_similarity_score(keys[0], keys[1], DATA) 

while (i < (DATA.size - 1))
    similarity_score = euclidean_similarity_score(keys[i], keys[i+1], DATA)
    p1, p2 = keys[i], keys[i+1] if similarity_score > highest_score
    p "#{keys[i]} <> #{keys[i+1]} = #{similarity_score}"
    i += 1
end 

p "#{p1} and #{p2} are most similar."
