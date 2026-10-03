# The name of this view in Looker is "Pims Di Ciclo"
view: pims_di_ciclo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_di_ciclo` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Alias Ciclo" in Explore.

  dimension: alias_ciclo {
    type: string
    sql: ${TABLE}.alias_ciclo ;;
  }

  dimension: id_ciclo {
    type: number
    sql: ${TABLE}.id_ciclo ;;
  }

  dimension: nome_ciclo {
    type: string
    sql: ${TABLE}.nome_ciclo ;;
  }

  dimension: ordem {
    type: number
    sql: ${TABLE}.ordem ;;
  }
  measure: count {
    type: count
  }
}
