# The name of this view in Looker is "Pims Pa Moagem Dia"
view: pims_pa_moagem_dia {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_pa_moagem_dia` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "ID Periodo" in Explore.

  dimension: id_periodo {
    type: number
    sql: ${TABLE}.id_periodo ;;
  }

  dimension: id_periodo_unidade {
    type: string
    sql: ${TABLE}.id_periodo_unidade ;;
  }

  dimension: instancia {
    type: number
    sql: ${TABLE}.instancia ;;
  }

  dimension: vl_pa_dia {
    type: number
    sql: ${TABLE}.vl_pa_dia ;;
  }
  measure: count {
    type: count
  }
}
