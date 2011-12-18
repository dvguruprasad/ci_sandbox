PREFERENCES = {
    'Lisa Rose' => {'Lady in the water' => 2.5, 'Snakes on a plane' => 3.5, 'Just my luck' => 3.0, 'Superman returns' => 3.5, 'You, me and Dupree' => 2.5, 'The night listener' => 3.0},
    'Gene Seymour' => {'Lady in the water' => 3.0, 'Snakes on a plane' => 3.5, 'Just my luck' => 1.5, 'Superman returns' => 5.0, 'You, me and Dupree' => 3.5, 'The night listener' => 3.0},
    'Michael Phillips' => {'Lady in the water' => 2.5, 'Snakes on a plane' => 3.0, 'Superman returns' => 3.5, 'The night listener' => 4.0},
    'Claudia Puig' => {'Snakes on a plane' => 3.5, 'Just my luck' => 3.0, 'Superman returns' => 4.0, 'You, me and Dupree' => 2.5, 'The night listener' => 4.5},
    'Mick LaSalle' => {'Lady in the water' => 3.0,  'Snakes on a plane' => 4.0, 'Just my luck' => 2.0, 'Superman returns' => 3.0, 'You, me and Dupree' => 2.0, 'The night listener' => 3.0},
    'Jack Mathews' => {'Lady in the water' => 3.0,  'Snakes on a plane' => 4.0, 'Superman returns' => 5.0, 'You, me and Dupree' => 3.5, 'The night listener' => 3.0},
    'Toby' => {'Snakes on a plane' => 4.5,'You, me and Dupree' => 1.0, 'Superman returns' => 4.0}
}


def similarity_score(person1, person2)
    sum = 0
    common_movies = Array.new
    PREFERENCES[person1].each do |movie, rating|
        if(PREFERENCES[person2][movie])
           sum += ((PREFERENCES[person1][movie] - PREFERENCES[person2][movie]) ** 2)
           common_movies.push movie
        end
    end
    1 / (sum + 1)
end

i = 0
keys = PREFERENCES.keys

p1, p2 = keys[0], keys[1]
highest_score = similarity_score(keys[0], keys[1]) 

while (i < (PREFERENCES.size - 1))
    similarity_score = similarity_score(keys[i], keys[i+1])
    p1, p2 = keys[i], keys[i+1] if similarity_score > highest_score
    p "#{keys[i]} <> #{keys[i+1]} = #{similarity_score}"
    i += 1
end 

p "#{p1} and #{p2} are most similar."
