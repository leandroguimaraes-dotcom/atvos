# The name of this view in Looker is "Pims Lab Ctt"
view: pims_lab_ctt {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_lab_ctt` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Atr Kg T" in Explore.

  dimension: atr_kg_t {
    type: number
    sql: ${TABLE}.atr_kg_t ;;
  }

  dimension: cd_amostra {
    type: string
    sql: ${TABLE}.cd_amostra ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: dt_analise {
    type: string
    sql: ${TABLE}.dt_analise ;;
  }

  dimension: fibra_pct {
    type: number
    sql: ${TABLE}.fibra_pct ;;
  }

  dimension: impureza_mineral_kg_t {
    type: number
    sql: ${TABLE}.impureza_mineral_kg_t ;;
  }

  dimension: impureza_vegetal_kg_t {
    type: number
    sql: ${TABLE}.impureza_vegetal_kg_t ;;
  }

  dimension: pol_cana_pct {
    type: number
    sql: ${TABLE}.pol_cana_pct ;;
  }

  dimension: pureza_pct {
    type: number
    sql: ${TABLE}.pureza_pct ;;
  }
  measure: count {
    type: count
  }
}
