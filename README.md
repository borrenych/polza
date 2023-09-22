# Polza

Technical test Ruby on Rails for Polza.

Technologies:
- Ruby 3.1.2
- Rails 7.0.8
- PostgreSQL
- Rspec
- Rubocop for code quantity

Result.

Done features:
- Created the necessary models for the functioning of the application. User can select Ingredients and submit.
After it Order will be created depends on user's choice. Dishes are selected at random. The number of dishes in the order depends on the daily number of dishes.
Order is only created for 1 day.
- Create endpoint for kitchen api/v1/dishes. Returns the total list of dishes to be cooked for the kitchen.
  The response array is sorted in descending order of count.
- All application logic is covered by Rspec tests with Factory Bot.

To Do:
- Dockerfile and Docker Compose.
- Improve order system. Add state machine for Order model. Add boolean field for OrderDish model, to check if Dish in order is already cooked.