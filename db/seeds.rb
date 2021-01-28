User.create!([
  {name: "Larry", email: "larry@example.com", password_digest: "$2a$12$6Wpa98g.G..gv.mJnzuVHO107WO1zgIQgZyLhtJX1mliUuntb7O2K", username: "larry", admin: true, slug: "larry"},
  {name: "Joe", email: "joe@example.com", password_digest: "$2a$12$/LEE92kTMjzwoL5ooLLwFeShk8BpJQPRML07qllC9gAKpBYuXDEZi", username: "joe", admin: false, slug: "joe"}
])

Genre.create!([
  {name: "Action"},
  {name: "Comedy"},
  {name: "Drama"},
  {name: "Romance"},
  {name: "Thriller"},
  {name: "Fantasy"},
  {name: "Documentary"},
  {name: "Adventure"},
  {name: "Animation"},
  {name: "Sci-Fi"}
])

Movie.create!([
  {title: "Avengers: Endgame", rating: "PG-13", total_gross: "1223641414.0", description: "After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos' actions and restore order to the universe.", released_on: "2019-04-26", director: "Anthony Russo", duration: "181 min", slug: "avengers-endgame"},
  {title: "Captain Marvel", rating: "PG-13", total_gross: "1110662849.0", description: "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.", released_on: "2019-03-08", director: "Anna Boden", duration: "124 min", slug: "captain-marvel"},
  {title: "Black Panther", rating: "PG-13", total_gross: "1346913161.0", description: "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past.", released_on: "2018-02-16", director: "Ryan Coogler", duration: "134 min", slug: "black-panther"},
  {title: "Avengers: Infinity War", rating: "PG-13", total_gross: "2048359754.0", description: "The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.", released_on: "2018-04-27", director: "Anthony Russo", duration: "149 min", slug: "avengers-infinity-war"},
  {title: "Green Lantern", rating: "PG-13", total_gross: "219851172.0", description: "Reckless test pilot Hal Jordan is granted an alien ring that bestows him with otherworldly powers that inducts him into an intergalactic police force, the Green Lantern Corps.", released_on: "2011-06-17", director: "Martin Campbell", duration: "114 min", slug: "green-lantern"},
  {title: "Fantastic Four", rating: "PG-13", total_gross: "168257860.0", description: "Four young outsiders teleport to an alternate and dangerous universe which alters their physical form in shocking ways. The four must learn to harness their new abilities and work together to save Earth from a former friend turned enemy.", released_on: "2015-08-07", director: "Josh Trank", duration: "100 min", slug: "fantastic-four"},
  {title: "Iron Man", rating: "PG-13", total_gross: "585366247.0", description: "When wealthy industrialist Tony Stark is forced to build an armored suit after a life-threatening incident, he ultimately decides to use its technology to fight against evil.", released_on: "2008-05-02", director: "Jon Favreau", duration: "126 min", slug: "iron-man"},
  {title: "Superman", rating: "PG", total_gross: "300451603.0", description: "An alien orphan is sent from his dying planet to Earth, where he grows up to become his adoptive home's first and greatest super-hero.", released_on: "1978-12-15", director: "Richard Donner", duration: "143 min", slug: "superman"},
  {title: "Spider-Man", rating: "PG-13", total_gross: "825025036.0", description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.", released_on: "2002-05-03", director: "Sam Raimi", duration: "121 min", slug: "spider-man"},
  {title: "Batman", rating: "PG-13", total_gross: "411348924.0", description: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker.", released_on: "1989-06-23", director: "Tim Burton", duration: "126 min", slug: "batman"},
  {title: "Catwoman", rating: "PG-13", total_gross: "82102379.0", description: "Patience Philips seems destined to spend her life apologizing for taking up space. Despite her artistic ability she has a more than respectable career as a graphic designer.", released_on: "2004-07-23", director: "Jean-Christophe 'Pitof' Comar", duration: "101 min", slug: "catwoman"},
  {title: "Wonder Woman", rating: "PG-13", total_gross: "821847012.0", description: "When a pilot crashes and tells of conflict in the outside world, Diana, an Amazonian warrior in training, leaves home to fight a war, discovering her full powers and true destiny.", released_on: "2017-06-02", director: "Patty Jenkins", duration: "141 min", slug: "wonder-woman"},
  {title: "Batman vs. Godzilla", rating: "PG-13", total_gross: "387623910.0", description: "An epic battle between The Caped Crusader and the fire-breathing dinosaur Gojira.", released_on: "2025-01-15", director: "???", duration: "100 min", slug: "batman-vs-godzilla"}
])

[
  ["Avengers: Endgame", "avengers-end-game.png"],
  ["Captain Marvel", "captain-marvel.png"],
  ["Black Panther", "black-panther.png"],
  ["Avengers: Infinity War", "avengers-infinity-war.png"],
  ["Green Lantern", "green-lantern.png"],
  ["Fantastic Four", "fantastic-four.png"],
  ["Iron Man", "ironman.png"],
  ["Superman", "superman.png"],
  ["Spider-Man", "spiderman.png"],
  ["Batman", "batman.png"],
  ["Catwoman", "catwoman.png"],
  ["Wonder Woman", "wonder-woman.png"]
].each do |movie_title, file_name|
  movie = Movie.find_by!(title: movie_title)
  file = File.open(Rails.root.join("app/assets/images/#{file_name}"))
  movie.main_image.attach(io: file, filename: file_name)
end
