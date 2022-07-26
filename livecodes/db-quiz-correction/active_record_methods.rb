# 1. Add your favorite author to the DB
Author.create(name: 'James S.A. Corey')
# james_corey = Author.new(name: 'James S.A. Corey')
# james_corey.save

# 2. Get all authors
Author.all

# 3. Get author with id=8
Author.find(8)
# 🚫 Author.find_by(id: 8)
# 🚫 Author.where(id: 8) => returns an array


# 4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.find_by(name: 'Jules Verne')
# jules = Author.find_by_name('Jules Verne')
# 🚫 jules = Author.find_by(name = 'Jules Verne')
# 🚫 Author.where(name: 'Jules Verne') => returns an array
# 🚫 Author.where(author.name = 'Jules Verne') => ⚠️ syntax

# 5. Get Jules Verne's books
jules.books

# 6. Create a new book "20000 Leagues under the Seas", it's missing in DB.
# Store it in a variable: twenty_thousand
twenty_thousand = Book.new(title: "20000 Leagues under the Seas")

# 7. Add Jules Verne as this book's author
twenty_thousand.author = jules

# 8. Now save this book in the DB!
twenty_thousand.save
