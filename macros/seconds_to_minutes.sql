{% macro seconds_to_minutes(column_name, precision_decimal=2) -%}
round({{column_name}} / 60, {{precision_decimal}})
{%- endmacro %}