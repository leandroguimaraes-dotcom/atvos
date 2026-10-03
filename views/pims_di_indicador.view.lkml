# The name of this view in Looker is "Pims Di Indicador"
view: pims_di_indicador {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_di_indicador` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Alias Indicador" in Explore.

  dimension: alias_indicador {
    type: string
    sql: ${TABLE}.alias_indicador ;;
  }

  dimension: id_indicador {
    type: number
    sql: ${TABLE}.id_indicador ;;
  }

  dimension: ind_calculado_cubo {
    type: string
    sql: ${TABLE}.ind_calculado_cubo ;;
  }

  dimension: nome_assunto {
    type: string
    sql: ${TABLE}.nome_assunto ;;
  }

  dimension: nome_indicador {
    type: string
    sql: ${TABLE}.nome_indicador ;;
  }

  dimension: num_ordem_indicador {
    type: number
    sql: ${TABLE}.num_ordem_indicador ;;
  }
  measure: count {
    type: count
  }
}
