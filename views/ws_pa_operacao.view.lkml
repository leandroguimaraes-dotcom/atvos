# The name of this view in Looker is "Ws Pa Operacao"
view: ws_pa_operacao {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.ws_pa_operacao` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Operacao" in Explore.

  dimension: cd_operacao {
    type: number
    sql: ${TABLE}.cd_operacao ;;
  }

  dimension: cd_tp_equipamento {
    type: number
    sql: ${TABLE}.cd_tp_equipamento ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_carga {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.data_carga ;;
  }

  dimension: de_operacao {
    type: string
    sql: ${TABLE}.de_operacao ;;
  }

  dimension: de_tp_equipamento {
    type: string
    sql: ${TABLE}.de_tp_equipamento ;;
  }

  dimension: fg_classe {
    type: string
    sql: ${TABLE}.fg_classe ;;
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

  dimension: id_periodo_unidade_tipo_oper {
    type: string
    sql: ${TABLE}.id_periodo_unidade_tipo_oper ;;
  }

  dimension: id_unidade {
    type: number
    sql: ${TABLE}.id_unidade ;;
  }

  dimension: odi_session_id {
    type: number
    sql: ${TABLE}.odi_session_id ;;
  }

  dimension: vl_pa {
    type: number
    sql: ${TABLE}.vl_pa ;;
  }
  measure: count {
    type: count
  }
}
