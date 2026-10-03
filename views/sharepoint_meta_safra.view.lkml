# The name of this view in Looker is "Sharepoint Meta Safra"
view: sharepoint_meta_safra {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.sharepoint_meta_safra` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Abr" in Explore.

  dimension: abr {
    type: string
    sql: ${TABLE}.abr ;;
  }

  dimension: ago {
    type: string
    sql: ${TABLE}.ago ;;
  }

  dimension: dez {
    type: string
    sql: ${TABLE}.dez ;;
  }

  dimension: fev {
    type: string
    sql: ${TABLE}.fev ;;
  }

  dimension: indicador {
    type: string
    sql: ${TABLE}.indicador ;;
  }

  dimension: jan {
    type: string
    sql: ${TABLE}.jan ;;
  }

  dimension: jul {
    type: string
    sql: ${TABLE}.jul ;;
  }

  dimension: jun {
    type: string
    sql: ${TABLE}.jun ;;
  }

  dimension: mai {
    type: string
    sql: ${TABLE}.mai ;;
  }

  dimension: mar {
    type: string
    sql: ${TABLE}.mar ;;
  }

  dimension: nov {
    type: string
    sql: ${TABLE}.nov ;;
  }

  dimension: out {
    type: string
    sql: ${TABLE}.out ;;
  }

  dimension: safra {
    type: string
    sql: ${TABLE}.safra ;;
  }

  dimension: set {
    type: string
    sql: ${TABLE}.`set` ;;
  }

  dimension: unidade {
    type: string
    sql: ${TABLE}.unidade ;;
  }
  measure: count {
    type: count
  }
}
