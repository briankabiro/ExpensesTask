# README
## Setup

1. Clone the repository

    ``` git clone git@github.com:briankabiro/ExpensesTask.git ```

2. Cd into the project

    ``` cd ExpensesTask ```

3. Move into the backend directory

    ``` cd backend && bundle install```


## Running Tests
The tests are housed in the *spec* directory. 

The tests can be run using:

```rspec```

## Improvements
Here is a list of improvements that I would have made with more time:

- Add a constraint that account number must not be less than 5 and not more than 256 chars.
- use optimistic locking so that two expenses are not assigned to one 
