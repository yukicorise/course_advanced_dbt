## Task 1
- `fct_events.sql` convereted to an incremental model
- confirmed that the model is working by checking the compiled sql.
- I've also implemented a new macro, incremental_where_clause(), to make it easier to add a lookback period to the incremental models.

## Task 2
- First, I identified the queries with the highest cost in the past 60 days using the query on the select website [the query on the select website](https://select.dev/docs/dbt-snowflake-monitoring/example-usage#top-10-costliest-queries-in-the-last-30-days). Using this query, it was difficult to tell what the longest queries were since there were duplicate queries from multiple developers. To filter down, I filtered down to queries run only in my schema of DBT_YUKI:
```
with
max_date as (
    select max(date(end_time)) as date
    from query_history_enriched
)
select
    md5(query_history_enriched.query_text_no_comments) as query_signature,
    any_value(query_history_enriched.query_text) as query_text,
    sum(query_history_enriched.query_cost) as total_cost_last_60d,
    total_cost_last_60d*12 as estimated_annual_cost,
    max_by(warehouse_name, start_time) as latest_warehouse_name,
    max_by(warehouse_size, start_time) as latest_warehouse_size,
    max_by(query_id, start_time) as latest_query_id,
    avg(execution_time_s) as avg_execution_time_s,
    count(*) as num_executions
from query_history_enriched
cross join max_date
where
    query_history_enriched.start_time >= dateadd('day', -60, max_date.date)
    and query_history_enriched.start_time < max_date.date -- don't include partial day of data
    and schema_name = 'DBT_YUKI'
group by 1
order by total_cost_last_60d desc
limit 10
```

In a real-life scenario, I might filter for queries run in the production database, only.

A few observations:
- It seems the most expensive query is an automated one run against our information schemas to gain information regarding each of our models
- A few others include dbt tests that are run for our MRR model. We'll want to ensure that dbt tests are not redundant to save on snowflake costs.
- Project evaluator queries are also included here; we'll want to make sure this also only run when appropriate.
