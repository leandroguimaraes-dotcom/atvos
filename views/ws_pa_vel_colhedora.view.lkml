# The name of this view in Looker is "Ws Pa Vel Colhedora"
view: ws_pa_vel_colhedora {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.ws_pa_vel_colhedora` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_carga {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.data_carga ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Descricao Frente" in Explore.

  dimension: descricao_frente {
    type: string
    sql: ${TABLE}.descricao_frente ;;
  }

  dimension: descricao_grupo_operacao {
    type: string
    sql: ${TABLE}.descricao_grupo_operacao ;;
  }

  dimension: descricao_operacao {
    type: string
    sql: ${TABLE}.descricao_operacao ;;
  }

  dimension: descricao_unidade {
    type: string
    sql: ${TABLE}.descricao_unidade ;;
  }

  dimension: equipamento {
    type: number
    sql: ${TABLE}.equipamento ;;
  }

  dimension: frente {
    type: number
    sql: ${TABLE}.frente ;;
  }

  dimension: grupo_operacao {
    type: number
    sql: ${TABLE}.grupo_operacao ;;
  }

  dimension: id_periodo {
    type: number
    sql: ${TABLE}.id_periodo ;;
  }

  dimension: id_periodo_unidade {
    type: string
    sql: ${TABLE}.id_periodo_unidade ;;
  }

  dimension: instancia {
    type: number
    sql: ${TABLE}.instancia ;;
  }

  dimension: odi_session_id {
    type: number
    sql: ${TABLE}.odi_session_id ;;
  }

  dimension: operacao {
    type: number
    sql: ${TABLE}.operacao ;;
  }

  dimension: vl_ton_calc {
    type: number
    sql: ${TABLE}.vl_ton_calc ;;
  }

  dimension: vl_ton_calc_pond {
    type: number
    sql: ${TABLE}.vl_ton_calc_pond ;;
  }
  measure: count {
    type: count
  }
}
