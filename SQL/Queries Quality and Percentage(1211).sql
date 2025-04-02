-- Table: Queries

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- This table may have duplicate rows.
-- This table contains information collected from some queries on a database.
-- The position column has a value from 1 to 500.
-- The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.
 

-- We define query quality as:

-- The average of the ratio between query rating and its position.

-- We also define poor query percentage as:

-- The percentage of all queries with rating less than 3.

-- Write a solution to find each query_name, the quality and poor_query_percentage.

-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Queries table:
-- +------------+-------------------+----------+--------+
-- | query_name | result            | position | rating |
-- +------------+-------------------+----------+--------+
-- | Dog        | Golden Retriever  | 1        | 5      |
-- | Dog        | German Shepherd   | 2        | 5      |
-- | Dog        | Mule              | 200      | 1      |
-- | Cat        | Shirazi           | 5        | 2      |
-- | Cat        | Siamese           | 3        | 3      |
-- | Cat        | Sphynx            | 7        | 4      |
-- +------------+-------------------+----------+--------+
-- Output: 
-- +------------+---------+-----------------------+
-- | query_name | quality | poor_query_percentage |
-- +------------+---------+-----------------------+
-- | Dog        | 2.50    | 33.33                 |
-- | Cat        | 0.66    | 33.33                 |
-- +------------+---------+-----------------------+
-- Explanation: 
-- Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
-- Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

-- Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
-- Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33


-- MY SOLUTION -- 
SELECT query_name , ROUND(SUM( rating / position )/count(query_name),2) as quality ,
ROUND(sum(if(rating<3,1,0))/COUNT(query_name)*100,2) as poor_query_percentage
FROM Queries
group by query_name;


-- Diff btw sum and count -- 
-- Yes! You've nailed it! 🎯

-- General Rule of Thumb
-- ✅ Use SUM(IF(...)) when you have a condition (like counting specific cases).
-- ✅ Use COUNT() when you just want to count rows (without conditions).

-- 📌 Quick Examples for Better Understanding
-- 1️⃣ Counting Total Rows (Just Counting, No Condition) → COUNT()
-- sql
-- Copy
-- Edit
-- SELECT COUNT(*) FROM Queries;
-- ✔️ Counts all rows in the table, including NULLs.

-- 2️⃣ Counting Non-Null Values in a Column → COUNT(column_name)
-- sql
-- Copy
-- Edit
-- SELECT COUNT(rating) FROM Queries;
-- ✔️ Counts only non-null values in rating.

-- 3️⃣ Counting Rows Based on a Condition (e.g., rating < 3) → SUM(IF(...))
-- sql
-- Copy
-- Edit
-- SELECT SUM(IF(rating < 3, 1, 0)) FROM Queries;
-- ✔️ Adds 1 for every row where rating < 3, giving the count.
-- ✔️ Works better than COUNT(IF(...)) because COUNT() doesn't handle conditions properly.

-- 4️⃣ Calculating Percentage of Queries with Rating < 3
-- sql
-- Copy
-- Edit
-- SELECT 
--     ROUND(SUM(IF(rating < 3, 1, 0)) / COUNT(*) * 100, 2) AS poor_query_percentage
-- FROM Queries;
-- ✔️ SUM(IF(rating < 3, 1, 0)) → Counts queries where rating < 3.
-- ✔️ COUNT(*) → Counts all queries.
-- ✔️ Division gives the percentage.

-- 🔥 Pro Tip: Use COUNT(DISTINCT column_name) When Counting Unique Values
-- sql
-- Copy
-- Edit
-- SELECT COUNT(DISTINCT query_name) FROM Queries;
-- ✔️ Counts the number of unique query names.

-- 💡 Final Cheat Sheet
-- Scenario	Use
-- Total number of rows	COUNT(*)
-- Count non-null values in a column	COUNT(column_name)
-- Count rows matching a condition	SUM(IF(condition, 1, 0))
-- Count unique values in a column	COUNT(DISTINCT column_name)
-- Sum all values in a column	SUM(column_name)
-- You got this! 🚀 Let me know if anything still feels unclear. 😊