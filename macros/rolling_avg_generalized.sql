{% macro rolling_avg_generalized(column_name, partition_by, order_by, rolling_number=7) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ rolling_number - 1 }} PRECEDING AND CURRENT ROW
            ) AS avg_{{ rolling_number }}_periods_{{ column_name }}
{% endmacro %}
