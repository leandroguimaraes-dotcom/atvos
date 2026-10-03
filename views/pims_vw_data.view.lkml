# The name of this view in Looker is "Pims Vw Data"
view: pims_vw_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_vw_data` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_dia {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_dia ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Flag Data Atual" in Explore.

  dimension: flag_data_atual {
    type: string
    sql: ${TABLE}.flag_data_atual ;;
  }

  dimension: flag_mes_atual {
    type: string
    sql: ${TABLE}.flag_mes_atual ;;
  }

  dimension: id_periodo {
    type: number
    sql: ${TABLE}.id_periodo ;;
  }

  dimension: num_dia {
    type: number
    sql: ${TABLE}.num_dia ;;
  }

  dimension: num_mes {
    type: number
    sql: ${TABLE}.num_mes ;;
  }

  dimension: num_mes_anterior {
    type: number
    sql: ${TABLE}.num_mes_anterior ;;
  }

  dimension: prop_dia_mes_atual {
    type: number
    sql: ${TABLE}.prop_dia_mes_atual ;;
  }
  measure: count {
    type: count
  }
}
