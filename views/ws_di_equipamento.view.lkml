# The name of this view in Looker is "Ws Di Equipamento"
view: ws_di_equipamento {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.ws_di_equipamento` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Codigo Equipamento" in Explore.

  dimension: codigo_equipamento {
    type: number
    sql: ${TABLE}.codigo_equipamento ;;
  }

  dimension: equipamento {
    type: string
    sql: ${TABLE}.equipamento ;;
  }
  measure: count {
    type: count
  }
}
