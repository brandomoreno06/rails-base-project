# TRADIFY
#### A virtual stock trading application


#### Tool Versions

```
  Ruby 2.7.2
  Rails 6.0.3.4
  NodeJS 12.18.3
  Yarn 1.22.4
```

### Features
#### Trader
1. Trader is able to create a account.
2. Trader is able to login his credentials so that he can access his account on the app.
3. Trader is able to receive a notification email after creating an account.
4. Trader is able to receive a notification email upon account approval.
5. Trade is able to buy or sell stocks (only after his account is approved).
6. Trader is able to see his transactions history.

#### Admin
1. Admin is able to manually create an account for traders.
2. Admin is able to edit/update a trader's account details.
3. Admin is able to view a specific trader's details.
4. Admin is able to see all registered traders.
5. Admin is able to see all pending account registrations.
6. Admin is able to a pending registration so a trader can start buying stocks.
7. Admin is able to see all transactions to monitor it's flow on the application.

#### Stocks List and Prices Flow
Part of scope of this project is utilizing the [IEX Gem](https://github.com/dblock/iex-ruby-client) (IEX Cloud API), the team implemented the solutions below to mitigate the risk of exceeding the number of calls allowed for free tier accounts.
1. All stocks list are seeded on the database upon deployment.
2. Once a user navigates on stock page to see the stocks list, corresponding prices are fetched for the external API.
3. Before fetching, price are checked if they were fetched within the last five minutes. If so, prices are not fetched anymore as they are deemed as updated. Otherwise, the second step from this flow is runs.
4. When a user visits a specific stock, the prices of that stock is checked if it is updated within the last five minutes. If the price is not updated, a call the API will run to fetch the latest price.
5. A user may stay on the specific stock page for more than five minutes without doing any transaction. In this scenario, whenever a user tries to create a transaction (buy/sell stocks), a check on the stock price is done to determine if it is updated within the last five minutes. If the price is not updated, the transaction will fail, and a call to the API will run to update the price. The user will then be prompted to transact again with the updated price.

#### Trader Wallet Flow
Upon approval of the trader account registration by the admin, a virtual wallet associated with him is created with an initial amount of $ 1-Million.



### Screenshots

![image](https://user-images.githubusercontent.com/81558435/136344180-f5cf5b3b-bc76-41ce-841c-de7338e4f3a4.png)
![image](https://user-images.githubusercontent.com/81558435/136344233-90cf2120-fd03-4ca5-a6c3-b1742f2161d5.png)
![image](https://user-images.githubusercontent.com/81558435/136344319-29f5d51d-6f70-4912-9f43-db69dfc8f19a.png)
![image](https://user-images.githubusercontent.com/81558435/136344735-8d0bdfbc-1a1a-43c9-aae2-27592a823e56.png)
![image](https://user-images.githubusercontent.com/81558435/136344770-57bd288b-b54b-44af-9010-5dd5b5584350.png)
![image](https://user-images.githubusercontent.com/81558435/136344802-d62dad5e-9506-4e12-888c-4b30bd90cbc1.png)
![image](https://user-images.githubusercontent.com/81558435/136344921-5a6386bd-b646-4a9a-b86e-e3aad1f53050.png)
![image](https://user-images.githubusercontent.com/81558435/136345031-6810647a-6fe3-4749-a4fa-bcfa34c8754a.png)


  
### Live Demo : https://trading-app-avion.herokuapp.com/

#### Testing Credentials
``` 
    Trader:
      email: user@email.com
      password: password
    Admin:
      email: admin@email.com
      password: password
```
