view: gld_os_manutencao {
  sql_table_name: `analytics-looker-interno.agro_gold.gld_os_manutencao` ;;

  dimension: cd_area_custo {
    type: string
    sql: ${TABLE}.cd_area_custo ;;
  }
  dimension: cd_centro_custo {
    type: string
    sql: ${TABLE}.cd_centro_custo ;;
  }
  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }
  dimension: cd_moeda {
    type: string
    sql: ${TABLE}.cd_moeda ;;
  }
  dimension: cd_tipo_ordem {
    type: string
    sql: ${TABLE}.cd_tipo_ordem ;;
  }
  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  dimension: centro_sap {
    type: string
    sql: ${TABLE}.centro_sap ;;
  }
  dimension: ds_ordem {
    type: string
    sql: ${TABLE}.ds_ordem ;;
  }
  dimension: ds_tipo_ordem {
    type: string
    sql: ${TABLE}.ds_tipo_ordem ;;
  }
  dimension_group: dt_hr_abertura {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dt_hr_abertura ;;
  }
  dimension_group: dt_hr_encerramento {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dt_hr_encerramento ;;
  }
  dimension: fl_data_inconsistente {
    type: yesno
    sql: ${TABLE}.fl_data_inconsistente ;;
  }
  dimension: fl_encerrada {
    type: yesno
    sql: ${TABLE}.fl_encerrada ;;
  }
  dimension: fl_ultima_ordem_equipamento {
    type: yesno
    sql: ${TABLE}.fl_ultima_ordem_equipamento ;;
  }
  dimension: nr_ordem {
    type: number
    sql: ${TABLE}.nr_ordem ;;
  }
  dimension: prefixo {
    type: string
    sql: ${TABLE}.prefixo ;;
  }
  dimension: qt_horas_desde_falha_anterior {
    type: number
    sql: ${TABLE}.qt_horas_desde_falha_anterior ;;
  }
  dimension: qt_horas_reparo {
    type: number
    sql: ${TABLE}.qt_horas_reparo ;;
  }
  dimension: stat_sistema {
    type: string
    sql: ${TABLE}.stat_sistema ;;
  }
  dimension: tp_equipamento {
    type: string
    sql: ${TABLE}.tp_equipamento ;;
  }
  dimension: vl_custo_mao_obra {
    type: number
    sql: ${TABLE}.vl_custo_mao_obra ;;
  }
  dimension: vl_custo_material {
    type: number
    sql: ${TABLE}.vl_custo_material ;;
  }
  dimension: vl_custo_total {
    type: number
    sql: ${TABLE}.vl_custo_total ;;
  }
  measure: count {
    type: count
  }
}
