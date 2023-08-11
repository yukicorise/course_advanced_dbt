## Task 1
dbt tests can be redundant if source, staging, and marts models have the same tests, but no additional joins / heavy transformations happen downstream of stating.

For example, `stg_bingeflix_subscription_plans` and `bingeflix.subscription_plans` source have the same uniqueness, not_null, and accepted values tests on the same four fields, even though the staging model does not have any transformations or joins. In this case, I would remove the tests from the staging model. I would leave the tests on `dim_subscriptions`, as transformations happen here that should be tested.

I was able to spot these redundant tests by observing the lineage graph and checking the tests in the documentation.

## Task 2
Added a custom generic test to replace a redundant singular test.

## Task 3
I ended up creating a unit test for rpt_mrr by creating input and output csvs filtered for one real user (user_id = 71548).
I'd be curious to hear how others filtered down their input/output csvs. How much data is typical to include? Should it aim to cover several edge cases?
Confirming that all tests pass when I run `dbt build --select rpt_mrr --vars 'unit_testing: true'`
