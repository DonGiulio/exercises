# Silver Bars Marketplace

Please read the instructions below and complete the exercise to the best of your abilities Imagine you're working as a programmer for a company called Silver Bars Marketplace and you have just received a new requirement. In it we would like to display to our users how much demand for silver bars there is on the market. To do this we would like to have a 'Live Order Board', that could provide us with the following functionality:

1. Register an order. Order must contain these fields:
	- user id
	- order quantity (e.g.: 3.5 kg)
	- price per kg (e.g.: £303)
	- order type: BUY or SELL
2. Cancel a registered order - this will remove the order from 'Live Order Board'
3. Get summary information of live orders (see explanation below. Imagine we have received the following orders:
	1. SELL: 3.5 kg for £306 [user1]
	2. SELL: 1.2 kg for £310 [user2]
	3. SELL: 1.5 kg for £307 [user3]
	4. SELL: 2.0 kg for £306 [user4]

Our ‘Live Order Board’ should provide us the following summary information:

- 5.5 kg for £306 // order a) + order d)
- 1.5 kg for £307 // order c)
- 1.2 kg for £310 // order b)

The first thing to note here is that orders for the same price should be merged together (even when they are from different users). In this case it can be seen that order a) and d) were for the same amount (£306) and this is why only their sum (5.5 kg) is displayed (for £306) and not the individual orders (3.5 kg and 2.0 kg).

The last thing to note is that for SELL orders the orders with lowest prices are displayed first. Opposite is true for the BUY orders. Could you please provide us an implementation of the 'Live Order Board'. No database or UI/WEB is needed for this assignment (we're absolutely fine with in memory solution). The only important thing is that you just write it according to your normal standards.

> NOTE: if during your implementation you'll find that something could be designed in multiple different ways, just implement the one which seems most reasonable to you and if you could provide a short (once sentence) reasoning why you choose this way and not another one, it would be great.

## running tests
this exercise is built with `ruby-3.0.0`, to install it use:

```
rvm install ruby-3.0.0
```

to install libraries:

```
bundle install
```
to run rspec test suite:

```
rspec
```

example: 

```
% rspec
..............

Finished in 0.00429 seconds (files took 0.05627 seconds to load)
14 examples, 0 failures
```