view: gld_disponibilidade_diaria {
  sql_table_name: `analytics-looker-interno.agro_gold.gld_disponibilidade_diaria` ;;

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }
  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  dimension: ds_safra {
    type: string
    sql: ${TABLE}.ds_safra ;;
  }
  dimension_group: dt_local {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_local ;;
  }
  dimension: hr_auxiliar {
    type: number
    sql: ${TABLE}.hr_auxiliar ;;
  }
  dimension: hr_clima {
    type: number
    sql: ${TABLE}.hr_clima ;;
  }
  dimension: hr_efetivo {
    type: number
    sql: ${TABLE}.hr_efetivo ;;
  }
  dimension: hr_improdutivo_op {
    type: number
    sql: ${TABLE}.hr_improdutivo_op ;;
  }
  dimension: hr_manut_corretiva {
    type: number
    sql: ${TABLE}.hr_manut_corretiva ;;
  }
  dimension: hr_manut_preventiva {
    type: number
    sql: ${TABLE}.hr_manut_preventiva ;;
  }
  dimension: hr_total {
    type: number
    sql: ${TABLE}.hr_total ;;
  }
  dimension: pk_disp {
    type: string
    sql: ${TABLE}.pk_disp ;;
  }
  dimension: qt_consumo_telemetria_l {
    type: number
    sql: ${TABLE}.qt_consumo_telemetria_l ;;
  }
  dimension: qt_eventos {
    type: number
    sql: ${TABLE}.qt_eventos ;;
  }
  measure: count {
    type: count
  }
}
