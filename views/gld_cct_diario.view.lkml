view: gld_cct_diario {
  sql_table_name: `analytics-looker-interno.agro_gold.gld_cct_diario` ;;

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  dimension: ds_safra {
    type: string
    sql: ${TABLE}.ds_safra ;;
  }
  dimension_group: dt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }
  dimension_group: dt_mes {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_mes ;;
  }
  dimension: h_op_cm_carregado {
    type: number
    sql: ${TABLE}.h_op_cm_carregado ;;
  }
  dimension: h_op_cm_vazio {
    type: number
    sql: ${TABLE}.h_op_cm_vazio ;;
  }
  dimension: h_op_col {
    type: number
    sql: ${TABLE}.h_op_col ;;
  }
  dimension: h_op_tt_carregado {
    type: number
    sql: ${TABLE}.h_op_tt_carregado ;;
  }
  dimension: h_op_tt_vazio {
    type: number
    sql: ${TABLE}.h_op_tt_vazio ;;
  }
  dimension: kg_liquido_cm {
    type: number
    sql: ${TABLE}.kg_liquido_cm ;;
  }
  dimension: kg_liquido_raio {
    type: number
    sql: ${TABLE}.kg_liquido_raio ;;
  }
  dimension: km_x_kg_raio {
    type: number
    sql: ${TABLE}.km_x_kg_raio ;;
  }
  dimension: ordem_mes {
    type: number
    sql: ${TABLE}.ordem_mes ;;
  }
  dimension: pa_densidade_t {
    type: number
    sql: ${TABLE}.pa_densidade_t ;;
  }
  dimension: pa_ns_cm {
    type: number
    sql: ${TABLE}.pa_ns_cm ;;
  }
  dimension: pa_ns_tt {
    type: number
    sql: ${TABLE}.pa_ns_tt ;;
  }
  dimension: pa_raio_km {
    type: number
    sql: ${TABLE}.pa_raio_km ;;
  }
  dimension: pa_seg_elevador {
    type: number
    sql: ${TABLE}.pa_seg_elevador ;;
  }
  dimension: pa_seg_t1 {
    type: number
    sql: ${TABLE}.pa_seg_t1 ;;
  }
  dimension: pa_seg_t2 {
    type: number
    sql: ${TABLE}.pa_seg_t2 ;;
  }
  dimension: pa_seg_t3 {
    type: number
    sql: ${TABLE}.pa_seg_t3 ;;
  }
  dimension: pa_seg_t4 {
    type: number
    sql: ${TABLE}.pa_seg_t4 ;;
  }
  dimension: pa_vel_cm_carregado {
    type: number
    sql: ${TABLE}.pa_vel_cm_carregado ;;
  }
  dimension: pa_vel_cm_vazio {
    type: number
    sql: ${TABLE}.pa_vel_cm_vazio ;;
  }
  dimension: pa_vel_col_pond {
    type: number
    sql: ${TABLE}.pa_vel_col_pond ;;
  }
  dimension: pa_vel_col_ton {
    type: number
    sql: ${TABLE}.pa_vel_col_ton ;;
  }
  dimension: pa_vel_tt_carregado {
    type: number
    sql: ${TABLE}.pa_vel_tt_carregado ;;
  }
  dimension: pa_vel_tt_vazio {
    type: number
    sql: ${TABLE}.pa_vel_tt_vazio ;;
  }
  dimension: pk_cct {
    type: string
    sql: ${TABLE}.pk_cct ;;
  }
  dimension: qt_ciclos_suspeitos {
    type: number
    sql: ${TABLE}.qt_ciclos_suspeitos ;;
  }
  dimension: qt_liberacoes_cm {
    type: number
    sql: ${TABLE}.qt_liberacoes_cm ;;
  }
  dimension: qt_meses_safra_decorridos {
    type: number
    sql: ${TABLE}.qt_meses_safra_decorridos ;;
  }
  dimension: qt_t1 {
    type: number
    sql: ${TABLE}.qt_t1 ;;
  }
  dimension: qt_t2 {
    type: number
    sql: ${TABLE}.qt_t2 ;;
  }
  dimension: qt_t3 {
    type: number
    sql: ${TABLE}.qt_t3 ;;
  }
  dimension: qt_t4 {
    type: number
    sql: ${TABLE}.qt_t4 ;;
  }
  dimension: seg_col_elevador {
    type: number
    sql: ${TABLE}.seg_col_elevador ;;
  }
  dimension: seg_col_falta_tt {
    type: number
    sql: ${TABLE}.seg_col_falta_tt ;;
  }
  dimension: seg_col_produtiva {
    type: number
    sql: ${TABLE}.seg_col_produtiva ;;
  }
  dimension: seg_col_total {
    type: number
    sql: ${TABLE}.seg_col_total ;;
  }
  dimension: seg_t1 {
    type: number
    sql: ${TABLE}.seg_t1 ;;
  }
  dimension: seg_t2 {
    type: number
    sql: ${TABLE}.seg_t2 ;;
  }
  dimension: seg_t3 {
    type: number
    sql: ${TABLE}.seg_t3 ;;
  }
  dimension: seg_t4 {
    type: number
    sql: ${TABLE}.seg_t4 ;;
  }
  dimension: seg_trb_falta_cm {
    type: number
    sql: ${TABLE}.seg_trb_falta_cm ;;
  }
  dimension: seg_trb_produtiva {
    type: number
    sql: ${TABLE}.seg_trb_produtiva ;;
  }
  dimension: t_cana {
    type: number
    sql: ${TABLE}.t_cana ;;
  }
  dimension: t_grp_fornecedor {
    type: number
    sql: ${TABLE}.t_grp_fornecedor ;;
  }
  dimension: t_grp_intercompany {
    type: number
    sql: ${TABLE}.t_grp_intercompany ;;
  }
  dimension: t_grp_propria {
    type: number
    sql: ${TABLE}.t_grp_propria ;;
  }
  dimension: t_grp_terceiro {
    type: number
    sql: ${TABLE}.t_grp_terceiro ;;
  }
  dimension: t_pa_moagem {
    type: number
    sql: ${TABLE}.t_pa_moagem ;;
  }
  dimension: t_tf_fornecedor {
    type: number
    sql: ${TABLE}.t_tf_fornecedor ;;
  }
  dimension: t_tf_propria {
    type: number
    sql: ${TABLE}.t_tf_propria ;;
  }
  dimension: t_tf_terceiro {
    type: number
    sql: ${TABLE}.t_tf_terceiro ;;
  }
  dimension: vel_pond_cm_carregado {
    type: number
    sql: ${TABLE}.vel_pond_cm_carregado ;;
  }
  dimension: vel_pond_cm_vazio {
    type: number
    sql: ${TABLE}.vel_pond_cm_vazio ;;
  }
  dimension: vel_pond_col {
    type: number
    sql: ${TABLE}.vel_pond_col ;;
  }
  dimension: vel_pond_tt_carregado {
    type: number
    sql: ${TABLE}.vel_pond_tt_carregado ;;
  }
  dimension: vel_pond_tt_vazio {
    type: number
    sql: ${TABLE}.vel_pond_tt_vazio ;;
  }
  measure: count {
    type: count
  }
}
