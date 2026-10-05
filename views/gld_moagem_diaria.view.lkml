view: gld_moagem_diaria {
  sql_table_name: `analytics-looker-interno.agro_gold.gld_moagem_diaria` ;;

  dimension: atr_x_t {
    type: number
    sql: ${TABLE}.atr_x_t ;;
  }
  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  dimension: ds_safra {
    type: string
    sql: ${TABLE}.ds_safra ;;
  }
  dimension_group: dt_moagem {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_moagem ;;
  }
  dimension: energia_exportada_mwh {
    type: number
    sql: ${TABLE}.energia_exportada_mwh ;;
  }
  dimension: etanol_anidro_m3 {
    type: number
    sql: ${TABLE}.etanol_anidro_m3 ;;
  }
  dimension: etanol_hidratado_m3 {
    type: number
    sql: ${TABLE}.etanol_hidratado_m3 ;;
  }
  dimension: etanol_total_m3 {
    type: number
    sql: ${TABLE}.etanol_total_m3 ;;
  }
  dimension: hr_parada_industria {
    type: number
    sql: ${TABLE}.hr_parada_industria ;;
  }
  dimension: imp_mineral_x_t {
    type: number
    sql: ${TABLE}.imp_mineral_x_t ;;
  }
  dimension: imp_vegetal_x_t {
    type: number
    sql: ${TABLE}.imp_vegetal_x_t ;;
  }
  dimension: pk_moagem {
    type: string
    sql: ${TABLE}.pk_moagem ;;
  }
  dimension: qt_capacidade_moagem_t_dia {
    type: number
    sql: ${TABLE}.qt_capacidade_moagem_t_dia ;;
  }
  dimension: qt_viagens {
    type: number
    sql: ${TABLE}.qt_viagens ;;
  }
  dimension: qt_viagens_analisadas {
    type: number
    sql: ${TABLE}.qt_viagens_analisadas ;;
  }
  dimension: t_cana_analisada {
    type: number
    sql: ${TABLE}.t_cana_analisada ;;
  }
  dimension: t_cana_fornecedor {
    type: number
    sql: ${TABLE}.t_cana_fornecedor ;;
  }
  dimension: t_cana_parceria {
    type: number
    sql: ${TABLE}.t_cana_parceria ;;
  }
  dimension: t_cana_propria {
    type: number
    sql: ${TABLE}.t_cana_propria ;;
  }
  dimension: t_cana_total {
    type: number
    sql: ${TABLE}.t_cana_total ;;
  }
  measure: count {
    type: count
  }
}
