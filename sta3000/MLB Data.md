# Major League Baseball 
​																			***How Has the Game Evolved Over Time?*** 

## Introduction

**What metrics most closely correlate to a strong baseball player? How can we find the most relevant gauge to predict which players are best?**

Using publicly available data from the MLB and Kaggle, players’ statistics can be analyzed to understand which statistics are the most important when drafting new players or trading between teams. Such techniques were used by the Oakland A’s in 2002, as portrayed in the movie, Moneyball starring Brad Pitt. Since the team was strapped for cash, they turned to alternate ways of understanding how a player can be developed and the potential each player has based on statistics that may go overlooked. In recent years, statistics in the MLB have drawn more attention from researchers and mathematicians. The MLB stats are much more advanced than that of any other professional sports league because of the massive amount of variables being tracked. These variables allow for composite scores to be computed, such as Fangraph’s, fWAR (wins above replacement). One of baseball’s most advanced and comprehensive statistics, fWAR (and other WAR formulas by other statistic agencies), takes into account both the offensive and defensive statistics of a player and compares that to a normal player of that position. The composite score is analyzed to calculate how many more wins the player has given their team compared to that of a normal player in that position. 

The goal of my project is to analyze the evolution of the league over time. In seeing the growth of the league and the betterment of players becoming more competitive, I would like to research which parts of the game have become more important. I can analyze the correlation between certain metrics, and how they translate to a more efficient player. I can use charts to analyze the average statistics by year and I can also calculate that correlation with newer statistical formulas being used in the league to define which is the most efficient and thus, finding the best way to measure a player.

## Data Sources

#### Savant & Statcast

The MLB runs a website called [Baseball Savant](https://baseballsavant.mlb.com/) which includes troves of data on every player and team, across all positions. This comprehensive website includes historical data as far back as 1950, current data, and even short-term forecasts on future data predictions, such as probable pitchers. Savant tracks all data and is able to compute live leaderboards for daily, weekly, monthly, and pretty much any other timeframe's data to show, for example, top pitch velocity of the day, top exit velocity of the week, or even fastest pitch speed of the month. Much of this data is run by Google Cloud.

In 2015, the MLB entered the "Statcast era". Statcast is an innovation in tracking technology that allows for the real-time collection and analysis of massive amounts of baseball data, in ways that were never possible in the past. After a trial run in 2014, all 30 MLB ballparks were retrofitted with 12 'Hawk-Eye' cameras, installed in an array around the field. With high frames-per-second rates, pitch tracking is meticulously watched and other cameras track all players' fielding and batting metrics. The new system assisting in raising the percentage of tracked batted balls from ~89% to ~99%, complete with additional metrics on these balls, we did not have before.

> "These metrics allow front offices, broadcasters and fans alike to quantify the raw skills of players in ways that were previously available only to scouts or not available at all. Even in a 2020 regular season shortened to 60 games by the pandemic, more than 260,000 pitches and 43,000 batted balls were tracked. Meanwhile, terms such as "spin rate" and "launch angle" have become ubiquitous not just on broadcasts, but also on ballpark video boards and even on the field, as players across the league use the data and the thinking behind it to elevate their games."
>
> [MLB.com Glossary](https://www.mlb.com/glossary/statcast)

As mentioned above, teams, media, and fans are becoming more familiar with advanced technical analysis. This elevates the game by teams understanding the importance of forgotten or previously untraceable metrics