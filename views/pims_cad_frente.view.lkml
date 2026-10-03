# The name of this view in Looker is "Pims Cad Frente"
view: pims_cad_frente {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_cad_frente` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Frente" in Explore.

  dimension: cd_frente {
    type: number
    sql: ${TABLE}.cd_frente ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: ds_frente {
    type: string
    sql: ${TABLE}.ds_frente ;;
  }

  dimension: fl_ativa {
    type: string
    sql: ${TABLE}.fl_ativa ;;
  }

  dimension: tipo_colheita {
    type: string
    sql: ${TABLE}.tipo_colheita ;;
  }
  measure: count {
    type: count
  }
}
