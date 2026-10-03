# The name of this view in Looker is "Pims Stg Depara Tipo Frente"
view: pims_stg_depara_tipo_frente {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_stg_depara_tipo_frente` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Fren Tran" in Explore.

  dimension: cd_fren_tran {
    type: number
    sql: ${TABLE}.cd_fren_tran ;;
  }

  dimension: cod_pims {
    type: number
    sql: ${TABLE}.cod_pims ;;
  }

  dimension: cod_propr_frente {
    type: string
    sql: ${TABLE}.cod_propr_frente ;;
  }

  dimension: desc_propr_frente {
    type: string
    sql: ${TABLE}.desc_propr_frente ;;
  }

  dimension: desc_tipo_frente {
    type: string
    sql: ${TABLE}.desc_tipo_frente ;;
  }
  measure: count {
    type: count
  }
}
