# The name of this view in Looker is "Pims Cad Unidade"
view: pims_cad_unidade {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_cad_unidade` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Unidade" in Explore.

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: ds_fuso_horario {
    type: string
    sql: ${TABLE}.ds_fuso_horario ;;
  }

  dimension: ds_polo {
    type: string
    sql: ${TABLE}.ds_polo ;;
  }

  dimension: nm_municipio {
    type: string
    sql: ${TABLE}.nm_municipio ;;
  }

  dimension: nm_unidade {
    type: string
    sql: ${TABLE}.nm_unidade ;;
  }

  dimension: qt_capacidade_moagem_t_dia {
    type: number
    sql: ${TABLE}.qt_capacidade_moagem_t_dia ;;
  }

  dimension: sg_uf {
    type: string
    sql: ${TABLE}.sg_uf ;;
  }
  measure: count {
    type: count
  }
}
