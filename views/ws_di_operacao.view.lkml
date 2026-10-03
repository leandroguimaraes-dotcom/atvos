# The name of this view in Looker is "Ws Di Operacao"
view: ws_di_operacao {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.ws_di_operacao` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Codigo Grupo Operacao" in Explore.

  dimension: codigo_grupo_operacao {
    type: string
    sql: ${TABLE}.codigo_grupo_operacao ;;
  }

  dimension: codigo_operacao {
    type: string
    sql: ${TABLE}.codigo_operacao ;;
  }

  dimension: grupo_operacao {
    type: string
    sql: ${TABLE}.grupo_operacao ;;
  }

  dimension: operacao {
    type: string
    sql: ${TABLE}.operacao ;;
  }
  measure: count {
    type: count
  }
}
