# Ranking-Functions-In-SQL
1. RANK()
Assigns a unique rank to each row based on the specified order.
If there are duplicate values, it skips ranks for subsequent rows.
The ranking sequence contains gaps after duplicate ranks.
Example:
SELECT Name, Score, RANK() OVER (ORDER BY Score DESC) AS Rank
FROM Students;
----------------------------------------------------------------------------------------------------
2. DENSE_RANK()
Assigns a unique rank to each row based on the specified order.
If there are duplicate values, it does not skip ranks for subsequent rows.
The ranking sequence is continuous.
Example:
SELECT Name, Score, DENSE_RANK() OVER (ORDER BY Score DESC) AS DenseRank
FROM Students;

When to Use?
Use RANK() when gaps in ranks are acceptable or necessary to reflect skipped positions.
Use DENSE_RANK() when you need a compact ranking sequence without gaps.

----------------------------------------------------------------------------------------------------
1. NTILE()
Divides rows into a specified number of buckets (or groups) and assigns a bucket number to each row.
The buckets are approximately equal in size. If rows cannot be evenly divided, buckets towards the end will have one more row than the others.
Useful for percentile analysis or distributing rows into groups.

Example:
SELECT Name, Score, NTILE(3) OVER (ORDER BY Score DESC) AS Bucket
FROM Students;
----------------------------------------------------------------------------------------------------
2. ROW_NUMBER()
Assigns a unique sequential integer to each row within a partition, starting from 1 for the first row in each partition.
There are no ties or gaps; each row gets a unique number.
Useful for pagination or uniquely identifying rows within a result set.

Example:
SELECT Name, Score, ROW_NUMBER() OVER (ORDER BY Score DESC) AS RowNumber
FROM Students;
