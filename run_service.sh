echo "------------------Server Start Env: $RAILS_ENV------------------"

echo "------------------Migrate DB------------------"
RAILS_ENV=$RAILS_ENV rails db:migrate
RAILS_ENV=$RAILS_ENV rails db:seed

echo "\n------------------Server Start------------------"
bundle exec foreman start -p 3000