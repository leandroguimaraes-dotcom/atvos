# The name of this view in Looker is "Ws Fa Horas Equipamento"
view: ws_fa_horas_equipamento {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.ws_fa_horas_equipamento` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Area Trabalhada" in Explore.

  dimension: area_trabalhada {
    type: number
    sql: ${TABLE}.area_trabalhada ;;
  }

  dimension: cod_equipamento {
    type: number
    sql: ${TABLE}.cod_equipamento ;;
  }

  dimension: cod_grupo_equipamento {
    type: number
    sql: ${TABLE}.cod_grupo_equipamento ;;
  }

  dimension: cod_operacao {
    type: number
    sql: ${TABLE}.cod_operacao ;;
  }

  dimension: cod_operador {
    type: number
    sql: ${TABLE}.cod_operador ;;
  }

  dimension: cod_periodo {
    type: number
    sql: ${TABLE}.cod_periodo ;;
  }

  dimension: cod_periodo_unidade_tipo {
    type: string
    sql: ${TABLE}.cod_periodo_unidade_tipo ;;
  }

  dimension: cod_tipo_equipamento {
    type: number
    sql: ${TABLE}.cod_tipo_equipamento ;;
  }

  dimension: cod_unidade {
    type: number
    sql: ${TABLE}.cod_unidade ;;
  }

  dimension: horas_em_segundos {
    type: number
    sql: ${TABLE}.horas_em_segundos ;;
  }

  dimension: horas_operacionais_dec {
    type: number
    sql: ${TABLE}.horas_operacionais_dec ;;
  }

  dimension: tempo {
    type: number
    sql: ${TABLE}.tempo ;;
  }

  dimension: velocidade_media {
    type: number
    sql: ${TABLE}.velocidade_media ;;
  }

  dimension: velocidade_media_pond {
    type: number
    sql: ${TABLE}.velocidade_media_pond ;;
  }
  measure: count {
    type: count
  }
}
