## Task 1
dbt tests can be redundant if source, staging, and marts models have the same tests, but no additional joins / heavy transformations happen downstream of stating.

For example, `stg_bingeflix_subscription_plans` and `bingeflix.subscription_plans` source have the same uniqueness, not_null, and accepted values tests on the same four fields, even though the staging model does not have any transformations or joins. In this case, I would remove the tests from the staging model. I would leave the tests on `dim_subscriptions`, as transformations happen here that should be tested.

I was able to spot these redundant tests by observing the lineage graph and checking the tests in the documentation.

## Task 2
