# The name of this view in Looker is "Pims Di Unidade"
view: pims_di_unidade {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_di_unidade` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cod Hyperion" in Explore.

  dimension: cod_hyperion {
    type: number
    sql: ${TABLE}.cod_hyperion ;;
  }

  dimension: cod_pims {
    type: number
    sql: ${TABLE}.cod_pims ;;
  }

  dimension: flag_fuso {
    type: string
    sql: ${TABLE}.flag_fuso ;;
  }

  dimension: id_unidade {
    type: number
    sql: ${TABLE}.id_unidade ;;
  }

  dimension: nome_polo {
    type: string
    sql: ${TABLE}.nome_polo ;;
  }

  dimension: nome_unidade {
    type: string
    sql: ${TABLE}.nome_unidade ;;
  }

  dimension: num_ordem {
    type: number
    sql: ${TABLE}.num_ordem ;;
  }

  dimension: sigla_unidade {
    type: string
    sql: ${TABLE}.sigla_unidade ;;
  }
  measure: count {
    type: count
  }
}
