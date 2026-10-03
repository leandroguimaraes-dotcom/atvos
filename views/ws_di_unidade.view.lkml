# The name of this view in Looker is "Ws Di Unidade"
view: ws_di_unidade {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.ws_di_unidade` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Codigo Regional" in Explore.

  dimension: codigo_regional {
    type: number
    sql: ${TABLE}.codigo_regional ;;
  }

  dimension: codigo_unidade {
    type: number
    sql: ${TABLE}.codigo_unidade ;;
  }

  dimension: regional {
    type: string
    sql: ${TABLE}.regional ;;
  }

  dimension: sigla_unidade {
    type: string
    sql: ${TABLE}.sigla_unidade ;;
  }

  dimension: unidade {
    type: string
    sql: ${TABLE}.unidade ;;
  }
  measure: count {
    type: count
  }
}
