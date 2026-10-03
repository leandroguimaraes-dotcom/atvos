# The name of this view in Looker is "Pims Stg Matriz Indicador"
view: pims_stg_matriz_indicador {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_stg_matriz_indicador` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ds Bloco" in Explore.

  dimension: ds_bloco {
    type: string
    sql: ${TABLE}.ds_bloco ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: nome_indicador {
    type: string
    sql: ${TABLE}.nome_indicador ;;
  }

  dimension: ordem {
    type: number
    sql: ${TABLE}.ordem ;;
  }
  measure: count {
    type: count
  }
}
