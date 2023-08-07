{% macro timestamp_to_date_month(timestamp_field) %}
    DATE(DATE_TRUNC('month', {{ timestamp_field }})) as {{ timestamp_field }}_month
{% endmacro %}
