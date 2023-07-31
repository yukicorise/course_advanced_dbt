# Bingeflix Docs
This file contains docs blocks for Bingeflix sources. Note - in future work, we could make this more comprehensive by adding model descriptions in addition to field descriptions, and adding docs blocks to the intermediate models as well. 

## Events
This section contains documentation for the Bingeflix Events table.

{% docs bingeflix_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_event_created_at %}
When the event was logged.
{% enddocs %}

{% docs bingeflix_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_event_id %}
The unique identifier of the event.
{% enddocs %}

## MRR
This section contains documentation for the Bingeflix MRR table.

{% docs bingeflix_surrogate_key %}
The surrogate key. This acts as a primary key for this model.
{% enddocs %}

{% docs bingeflix_date_month %}
The calendar month.
{% enddocs %}

{% docs bingeflix_mrr_amount %}
The amount of monthly recurring revenue generated from the subscription in a given month.
{% enddocs %}

{% docs bingeflix_mrr_change %}
The change in monthly recurring revenue from the associated subscription versus last month.
{% enddocs %}

{% docs bingeflix_retained_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription retained from the previous month.
{% enddocs %}

{% docs bingeflix_previous_month_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription earned in the previous month.
{% enddocs %}

{% docs bingeflix_change_category %}
The category the subscription falls into based on the current month (e.g. new, churned, retained, reactivated)
{% enddocs %}

{% docs bingeflix_month_retained_number %}
The number of months the subscription has been retained since it was started (first month = 0).
{% enddocs %}

## Subscription Plans
This section contains documentation for the Bingeflix Subscription Plans table.

{% docs bingeflix_subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_pricing %}
The price of the subscription.
{% enddocs %}

{% docs bingeflix_payment_period %}
The recurring payment period for the subscription.
{% enddocs %}

## Subscriptions
This section contains documentation for the Bingeflix Subscriptions table.

{% docs bingeflix_subscription_starts_at %}
When the subscription started.
{% enddocs %}

{% docs bingeflix_subscription_ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs bingeflix_subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

## Users
This section contains documentation for the Bingeflix Users table.

{% docs bingeflix_user_id %}
The unique identifier of the user associated with the event.
{% enddocs %}

{% docs bingeflix_user_created_at %}
When the user was created.
{% enddocs %}

{% docs bingeflix_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_user_deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs bingeflix_username %}
The username for login to Bingeflix.
{% enddocs %}

{% docs bingeflix_user_name %}
The name of the user.
{% enddocs %}

{% docs bingeflix_user_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_user_email %}
The user's email address.
{% enddocs %}

{% docs bingeflix_user_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_user_current_age %}
The user's current age, calculated using birthdate.
{% enddocs %}

{% docs bingeflix_user_age_at_acquisition %}
The age of the user when they became a Bingeflix user, calculated using birthdate and user created at date.
{% enddocs %}

{% docs bingeflix_user_region %}
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs bingeflix_user_country %}
The country where the user resides.
{% enddocs %}