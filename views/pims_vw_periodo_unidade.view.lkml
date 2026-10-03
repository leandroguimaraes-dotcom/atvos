# The name of this view in Looker is "Pims Vw Periodo Unidade"
view: pims_vw_periodo_unidade {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_vw_periodo_unidade` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ano Mes" in Explore.

  dimension: ano_mes {
    type: number
    sql: ${TABLE}.ano_mes ;;
  }

  dimension: cd_safra {
    type: number
    sql: ${TABLE}.cd_safra ;;
  }

  dimension: chave {
    type: string
    sql: ${TABLE}.chave ;;
  }

  dimension: cod_periodo_unidade {
    type: string
    sql: ${TABLE}.cod_periodo_unidade ;;
  }

  dimension: cod_periodo_unidade_tipo {
    type: string
    sql: ${TABLE}.cod_periodo_unidade_tipo ;;
  }

  dimension: cod_unidade {
    type: number
    sql: ${TABLE}.cod_unidade ;;
  }

  dimension: data_dia {
    type: string
    sql: ${TABLE}.data_dia ;;
  }

  dimension: fg_tp_oper {
    type: string
    sql: ${TABLE}.fg_tp_oper ;;
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

  dimension: id_periodo_unidade_tipo_oper {
    type: string
    sql: ${TABLE}.id_periodo_unidade_tipo_oper ;;
  }

  dimension: id_tipo {
    type: number
    sql: ${TABLE}.id_tipo ;;
  }

  dimension: id_unidade {
    type: number
    sql: ${TABLE}.id_unidade ;;
  }

  dimension: nome_mes {
    type: string
    sql: ${TABLE}.nome_mes ;;
  }

  dimension: nome_safra {
    type: string
    sql: ${TABLE}.nome_safra ;;
  }

  dimension: num_dia {
    type: number
    sql: ${TABLE}.num_dia ;;
  }

  dimension: num_mes {
    type: number
    sql: ${TABLE}.num_mes ;;
  }

  dimension: ordem_mes {
    type: number
    sql: ${TABLE}.ordem_mes ;;
  }

  dimension: qtd_dia {
    type: number
    sql: ${TABLE}.qtd_dia ;;
  }
  measure: count {
    type: count
  }
}
