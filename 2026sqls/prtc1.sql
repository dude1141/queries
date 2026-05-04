
1- Creator should have more than 50k followers.
2- Creator should have more than 100k impressions on the posts that they published in the month of Dec-2023.
3- Creator should have published atleast 3 posts in Dec-2023.


version1 solutions:
ctes as (select b.creator_name as creator_name,count(c.post_id) as post_id, SUM(c.impressions) as total_impressions ,
		b.followers as followers
from creators b  join  posts c on b.creator_id=c.creator_id 
where published_date > '2025-12-01'
and published_date < '2026-01-01' and  sum(c.impressions) > 100000  and  count(b.followers) > 50000 and count(c.post_id)>=3)

creator_id | creator_name     | followers | creator_id | post_id | publish_date | impressions
------------------------------------------------------------------------------------------------
1          | Pavitra Natraj   | 900       | 1          | p1      | 2023-12-03   | 120000

2          | Ankit Bansal     | 150000    | 2          | p4      | 2023-12-20   | 42000
2          | Ankit Bansal     | 150000    | 2          | p3      | 2023-12-09   | 39000
2          | Ankit Bansal     | 150000    | 2          | p2      | 2023-12-02   | 51000

3          | Rahul Gupta      | 70000     | 3          | p8      | 2023-12-01   | 41000
3          | Rahul Gupta      | 70000     | 3          | p7      | 2023-12-10   | 22000
3          | Rahul Gupta      | 70000     | 3          | p6      | 2023-12-04   | 32000
3          | Rahul Gupta      | 70000     | 3          | p5      | 2023-11-20   | 22000

4          | Shomil Sharma    | 55000     | 4          | p9      | 2023-12-03   | 41000
4          | Shomil Sharma    | 55000     | 4          | p10     | 2023-12-04   | 71000

followers are same so its where clause and post_id for each creator_name as changign and impressions also 
so in group by clause
rightversion:
with ctes as (select b.creator_name as creator_name,
			  count(c.post_id) as no_of_posts ,
			  SUM(c.impressions) as total_impressions  ,
			  b.followers as followers 
			  from creators b  join  posts c on b.creator_id=c.creator_id 
				where b.followers > 50000 
				and publish_date >= '2023-12-01' and publish_date < '2024-01-01' group by 
				b.creator_name ,b.followers  having 			  
				sum(c.impressions) >= 100000  
				and  count(c.post_id) >=3)
select creator_name, no_of_posts , total_impressions From ctes order by total_impressions desc;

if followers are changing then 


			
creator_id | creator_name     | followers | creator_id | post_id | publish_date | impressions
------------------------------------------------------------------------------------------------
1          | Pavitra Natraj   | 900       | 1          | p1      | 2023-12-03   | 120000

2          | Ankit Bansal     | 180000    | 2          | p4      | 2023-12-20   | 42000
2          | Ankit Bansal     | 150000    | 2          | p3      | 2023-12-09   | 39000
2          | Ankit Bansal     | 110000    | 2          | p2      | 2023-12-02   | 51000

3          | Rahul Gupta      | 70000     | 3          | p8      | 2023-12-01   | 41000
3          | Rahul Gupta      | 70000     | 3          | p7      | 2023-12-10   | 22000
3          | Rahul Gupta      | 70000     | 3          | p6      | 2023-12-04   | 32000
3          | Rahul Gupta      | 70000     | 3          | p5      | 2023-11-20   | 22000

4          | Shomil Sharma    | 55000     | 4          | p9      | 2023-12-03   | 41000
4          | Shomil Sharma    | 55000     | 4          | p10     | 2023-12-04   | 71000


with ctes as (select b.creator_name as creator_name,
			  count(c.post_id) as no_of_posts ,
			  SUM(c.impressions) as total_impressions  ,
			  b.followers as followers 
			  from creators b  join  posts c on b.creator_id=c.creator_id 
				where 
				publish_date >= '2023-12-01' and publish_date < '2024-01-01' group by 
				b.creator_name ,b.followers  having 
				max(b.followers) > 50000 				
				sum(c.impressions) >= 100000  
				and  count(c.post_id) >=3)
				
				
	
