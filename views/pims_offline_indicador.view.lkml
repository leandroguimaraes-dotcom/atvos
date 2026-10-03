# The name of this view in Looker is "Pims Offline Indicador"
view: pims_offline_indicador {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_offline_indicador` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Safra" in Explore.

  dimension: cd_safra {
    type: number
    sql: ${TABLE}.cd_safra ;;
  }

  dimension: id_cenario {
    type: number
    sql: ${TABLE}.id_cenario ;;
  }

  dimension: id_equipamento {
    type: number
    sql: ${TABLE}.id_equipamento ;;
  }

  dimension: id_frente {
    type: number
    sql: ${TABLE}.id_frente ;;
  }

  dimension: id_indicador {
    type: number
    sql: ${TABLE}.id_indicador ;;
  }

  dimension: id_origem {
    type: number
    sql: ${TABLE}.id_origem ;;
  }

  dimension: id_periodo {
    type: number
    sql: ${TABLE}.id_periodo ;;
  }

  dimension: id_periodo_unidade {
    type: string
    sql: ${TABLE}.id_periodo_unidade ;;
  }

  dimension: id_periodo_unidade_tipo {
    type: string
    sql: ${TABLE}.id_periodo_unidade_tipo ;;
  }

  dimension: id_tipo {
    type: number
    sql: ${TABLE}.id_tipo ;;
  }

  dimension: id_tipo_propriedade {
    type: number
    sql: ${TABLE}.id_tipo_propriedade ;;
  }

  dimension: id_tipo_recurso {
    type: number
    sql: ${TABLE}.id_tipo_recurso ;;
  }

  dimension: id_unidade {
    type: number
    sql: ${TABLE}.id_unidade ;;
  }

  dimension: id_visao {
    type: number
    sql: ${TABLE}.id_visao ;;
  }

  dimension: vl_pa {
    type: number
    sql: ${TABLE}.vl_pa ;;
  }

  dimension: vl_realizado {
    type: number
    sql: ${TABLE}.vl_realizado ;;
  }
  measure: count {
    type: count
  }
}
