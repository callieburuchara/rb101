#figute out the total ages of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# munsters["Herman"]["gender"] ==> "male"
# munsters["Herman"]["age"] ==> 32

ages = []
munsters.each do |key, value|
  if munsters[key]["gender"] == "male"
    ages << munsters[key]["age"]
  end
end

total_male_age = ages.sum

# given solution
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444