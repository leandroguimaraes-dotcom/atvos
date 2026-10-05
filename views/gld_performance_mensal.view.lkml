view: gld_performance_mensal {
  sql_table_name: `analytics-looker-interno.agro_gold.gld_performance_mensal` ;;

  dimension: atr_x_t {
    type: number
    sql: ${TABLE}.atr_x_t ;;
  }
  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  dimension_group: dt_mes {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_mes ;;
  }
  dimension: hr_manutencao {
    type: number
    sql: ${TABLE}.hr_manutencao ;;
  }
  dimension: hr_total {
    type: number
    sql: ${TABLE}.hr_total ;;
  }
  dimension: meta_atr_kg_t {
    type: number
    sql: ${TABLE}.meta_atr_kg_t ;;
  }
  dimension: meta_dm {
    type: number
    sql: ${TABLE}.meta_dm ;;
  }
  dimension: meta_moagem_t {
    type: number
    sql: ${TABLE}.meta_moagem_t ;;
  }
  dimension: pk_perf {
    type: string
    sql: ${TABLE}.pk_perf ;;
  }
  dimension: t_cana_analisada {
    type: number
    sql: ${TABLE}.t_cana_analisada ;;
  }
  dimension: t_cana_real {
    type: number
    sql: ${TABLE}.t_cana_real ;;
  }
  measure: count {
    type: count
  }
}
