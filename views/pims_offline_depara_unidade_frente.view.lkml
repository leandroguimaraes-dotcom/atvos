# The name of this view in Looker is "Pims Offline Depara Unidade Frente"
view: pims_offline_depara_unidade_frente {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_offline_depara_unidade_frente` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cod Grupo Equipamento" in Explore.

  dimension: cod_grupo_equipamento {
    type: number
    sql: ${TABLE}.cod_grupo_equipamento ;;
  }

  dimension: cod_unidade {
    type: number
    sql: ${TABLE}.cod_unidade ;;
  }

  dimension: frente {
    type: string
    sql: ${TABLE}.frente ;;
  }

  dimension: grupo_equipamento {
    type: string
    sql: ${TABLE}.grupo_equipamento ;;
  }

  dimension: ordem {
    type: number
    sql: ${TABLE}.ordem ;;
  }

  dimension: ordenacao {
    type: number
    sql: ${TABLE}.ordenacao ;;
  }
  measure: count {
    type: count
  }
}
