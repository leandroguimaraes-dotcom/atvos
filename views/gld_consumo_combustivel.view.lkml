view: gld_consumo_combustivel {
  sql_table_name: `analytics-looker-interno.agro_gold.gld_consumo_combustivel` ;;

  dimension: cd_comboio {
    type: string
    sql: ${TABLE}.cd_comboio ;;
  }
  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }
  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  dimension: ds_combustivel {
    type: string
    sql: ${TABLE}.ds_combustivel ;;
  }
  dimension: ds_combustivel_origem {
    type: string
    sql: ${TABLE}.ds_combustivel_origem ;;
  }
  dimension_group: dt_abastecimento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_abastecimento ;;
  }
  dimension_group: dt_hr_abastecimento {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dt_hr_abastecimento ;;
  }
  dimension: fl_delta_valido {
    type: yesno
    sql: ${TABLE}.fl_delta_valido ;;
  }
  dimension: id_abastecimento {
    type: number
    sql: ${TABLE}.id_abastecimento ;;
  }
  dimension: prefixo {
    type: string
    sql: ${TABLE}.prefixo ;;
  }
  dimension: qt_horas_delta {
    type: number
    sql: ${TABLE}.qt_horas_delta ;;
  }
  dimension: qt_horas_validas {
    type: number
    sql: ${TABLE}.qt_horas_validas ;;
  }
  dimension: qt_litros {
    type: number
    sql: ${TABLE}.qt_litros ;;
  }
  dimension: qt_litros_validos {
    type: number
    sql: ${TABLE}.qt_litros_validos ;;
  }
  dimension: tp_equipamento {
    type: string
    sql: ${TABLE}.tp_equipamento ;;
  }
  dimension: vl_horimetro {
    type: number
    sql: ${TABLE}.vl_horimetro ;;
  }
  dimension: vl_horimetro_anterior {
    type: number
    sql: ${TABLE}.vl_horimetro_anterior ;;
  }
  dimension: vl_preco_litro {
    type: number
    sql: ${TABLE}.vl_preco_litro ;;
  }
  dimension: vl_total {
    type: number
    sql: ${TABLE}.vl_total ;;
  }
  measure: count {
    type: count
  }
}
