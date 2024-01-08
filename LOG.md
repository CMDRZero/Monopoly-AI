# Information Log
---
### 2024-01-07:
The plan for this project is to implement it all in Zig and to try and use Q-Learning, where possible. I'll start by enumerating the play space. 
All color sets have the following states:

| \|-----  | Sets of 3 | -----\|     |  \|----- | Sets of 2 | -----\|   |  \|----- | Sets of 4 | -----\|   |
| :------: | :-------: | :-------: | :------: | :-------: | :-------: | :------: | :-------: | :-------: |
| State ID | \# Owned  | \# Houses | State ID | \# Owned  | \# Houses | State ID | \# Owned  | \# Houses |
| 0 | 0 | 0 |        0 | 0 | 0 |        0 | 0 | 0 |
| 1 | 1 | -1 |      1 | 1 | -1 |        1 | 1 | -1 |
| 2 | 1 | 0 |       2 | 1 | 0 |         2 | 1 | 0 |
| 3 | 2 | -2 |      3 | 2 | -2 |        3 | 2 | -2 |
| 4 | 2 | -1 |      4 | 2 | -1 |        4 | 2 | -1 |
| 5 | 2 | 0 |       5 | 2 | 0 |         5 | 2 | 0 |
| 6 | 3 | -3 |      6 | 2 | 1 |         6 | 3 | -3 |
| 7 | 3 | -2 |      7 | 2 | 2 |         7 | 3 | -2 |
| 8 | 3 | -1 |      ... | ... | ... |   8 | 3 | -1 |
| 9 | 3 | 0 |       ... | ... | ... |   9 | 3 | 0 |
| 10 | 3 | 1 |      ... | ... | ... |   10 | 4 | -4 |
| ... | ... | ... | ... | ... | ... |   ... | ... | ... |
| 24 | 3 | 15 |     15 | 2 | 10 |       14 | 4 | 0 |

Do note, that like the sets of 4, the Utilities are non upgradeable Sets of 2, and so only have 5 states. This gives the following Valuation table sizes

`Brown/Purple -> [15]`
`L.Blue, Pink, Orange, Red, Green -> [24]`
`Railroads -> [14]`
`Utilities -> [5]`
`D.Blue -> [15]`

Each valuation table is a u16 expressing the value of that state. Additionally, money likely has a non-linear value, where having alot of money it's worth upgrading, while on low money that's a bad play, so money has its own table; that being divided into 50\$ blocks up to 5000\$.

`Money -> [101]`

Get out of jails are between `[0,2]` in qty, so:

`GOJF -> [3]`

You can also spend up to 3 turns in jail

`Jail_time -> [3]`

This should be sufficient for now, so I'll begin coding.

---