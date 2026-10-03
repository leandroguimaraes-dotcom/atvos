# The name of this view in Looker is "Sap Equipamento"
view: sap_equipamento {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.sap_equipamento` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ano Fabricacao" in Explore.

  dimension: ano_fabricacao {
    type: number
    sql: ${TABLE}.ano_fabricacao ;;
  }

  dimension: centro_sap {
    type: string
    sql: ${TABLE}.centro_sap ;;
  }

  dimension: equnr {
    type: string
    sql: ${TABLE}.equnr ;;
  }

  dimension: fabricante {
    type: string
    sql: ${TABLE}.fabricante ;;
  }

  dimension: fl_ativo {
    type: string
    sql: ${TABLE}.fl_ativo ;;
  }

  dimension: modelo {
    type: string
    sql: ${TABLE}.modelo ;;
  }

  dimension: prefixo {
    type: string
    sql: ${TABLE}.prefixo ;;
  }

  dimension: tp_equipamento {
    type: string
    sql: ${TABLE}.tp_equipamento ;;
  }

  dimension: tp_frota {
    type: string
    sql: ${TABLE}.tp_frota ;;
  }
  measure: count {
    type: count
  }
}
