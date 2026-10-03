# The name of this view in Looker is "Sap De Para Centro"
view: sap_de_para_centro {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.sap_de_para_centro` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Unidade" in Explore.

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: centro_sap {
    type: string
    sql: ${TABLE}.centro_sap ;;
  }

  dimension: descricao {
    type: string
    sql: ${TABLE}.descricao ;;
  }
  measure: count {
    type: count
  }
}
