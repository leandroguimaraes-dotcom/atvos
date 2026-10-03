# The name of this view in Looker is "Sap Ordem Manutencao"
view: sap_ordem_manutencao {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.sap_ordem_manutencao` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Auart" in Explore.

  dimension: auart {
    type: string
    sql: ${TABLE}.auart ;;
  }

  dimension: aufnr {
    type: string
    sql: ${TABLE}.aufnr ;;
  }

  dimension: equnr {
    type: string
    sql: ${TABLE}.equnr ;;
  }

  dimension: erdat {
    type: string
    sql: ${TABLE}.erdat ;;
  }

  dimension: erzeit {
    type: string
    sql: ${TABLE}.erzeit ;;
  }

  dimension: getri {
    type: string
    sql: ${TABLE}.getri ;;
  }

  dimension: getrz {
    type: string
    sql: ${TABLE}.getrz ;;
  }

  dimension: kostl {
    type: string
    sql: ${TABLE}.kostl ;;
  }

  dimension: ktext {
    type: string
    sql: ${TABLE}.ktext ;;
  }

  dimension: stat_sistema {
    type: string
    sql: ${TABLE}.stat_sistema ;;
  }

  dimension: vl_custo_mao_obra {
    type: string
    sql: ${TABLE}.vl_custo_mao_obra ;;
  }

  dimension: vl_custo_material {
    type: string
    sql: ${TABLE}.vl_custo_material ;;
  }

  dimension: waers {
    type: string
    sql: ${TABLE}.waers ;;
  }

  dimension: werks {
    type: string
    sql: ${TABLE}.werks ;;
  }
  measure: count {
    type: count
  }
}
