# The name of this view in Looker is "Pims Offline Depara Ind Frente"
view: pims_offline_depara_ind_frente {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_offline_depara_ind_frente` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Alias Indicador" in Explore.

  dimension: alias_indicador {
    type: string
    sql: ${TABLE}.alias_indicador ;;
  }

  dimension: de_fren_tran {
    type: string
    sql: ${TABLE}.de_fren_tran ;;
  }

  dimension: desc_frente {
    type: string
    sql: ${TABLE}.desc_frente ;;
  }

  dimension: id_frente {
    type: number
    sql: ${TABLE}.id_frente ;;
  }

  dimension: id_indicador {
    type: number
    sql: ${TABLE}.id_indicador ;;
  }

  dimension: id_unidade {
    type: number
    sql: ${TABLE}.id_unidade ;;
  }

  dimension: ordem {
    type: number
    sql: ${TABLE}.ordem ;;
  }
  measure: count {
    type: count
  }
}
