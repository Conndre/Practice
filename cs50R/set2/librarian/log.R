# Load the data files
books <- read.csv("books.csv")
authors <- read.csv("authors.csv")

# The Writer is looking for a book by Mia Morgan
writer_book <- books[books$author == "Mia Morgan", ]
writer_book_title <- writer_book$title
# Print the title to check
writer_book_title

# The Musician is looking for a book on music from 1613
musician_book <- books[books$topic == "Music" & books$year == 1613, ]
musician_book_title <- musician_book$title
# Print to check
musician_book_title

# The Traveler is looking for a book by either Lysandra Silverleaf or Elena Petrova, published in 1775
traveler_book <- books[books$author %in% c("Lysandra Silverleaf", "Elena Petrova") & books$year == 1775, ]
traveler_book_title <- traveler_book$title
# Print to check
traveler_book_title

# The Painter is looking for a book on art, published in 1990 or 1992, not 1991, with pages between 200 and 300
painter_book <- books[books$topic == "Art" & books$year %in% c(1990, 1992) & books$year != 1991 & books$pages >= 200 & books$pages <= 300, ]
painter_book_title <- painter_book$title
# Print to check
painter_book_title

# The Scientist is looking for a book with "Quantum Mechanics" in the title
scientist_book <- books[grepl("Quantum Mechanics", books$title), ]
scientist_book_title <- scientist_book$title
# Print to check
scientist_book_title

# Merge books and authors data to get the hometown of authors
merged_data <- merge(books, authors, by = "author")

# The Teacher is looking for a book on education from the 1700s, authored by someone from Zenthia
teacher_book <- merged_data[merged_data$topic == "Education" & merged_data$year >= 1700 & merged_data$year < 1800 & merged_data$hometown == "Zenthia", ]
teacher_book_title <- teacher_book$title
# Print to check
teacher_book_title

# Prepare the answers for each reader
answers <- c(
  "The Writer is looking for: Creating Memorable Characters",
  "The Musician is looking for: The Evolution of Electronic Instruments",
  "The Traveler is looking for: Forbidden Magic",
  "The Painter is looking for: Artistry in Ancient Times",
  "The Scientist is looking for: Quantum Mechanics for Beginners",
  "The Teacher is looking for: The Timeline of Education"
)

# Write the answers to answers.txt
writeLines(answers, "answers.txt")

# You might find it most helpful to use CTRL + Enter (if on Windows)
# to run individual lines of code from log.R.

