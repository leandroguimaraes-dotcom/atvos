# The name of this view in Looker is "Pims Prod Industrial"
view: pims_prod_industrial {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_prod_industrial` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bagaco T" in Explore.

  dimension: bagaco_t {
    type: number
    sql: ${TABLE}.bagaco_t ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_producao {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_producao ;;
  }

  dimension: energia_exportada_mwh {
    type: number
    sql: ${TABLE}.energia_exportada_mwh ;;
  }

  dimension: etanol_anidro_m3 {
    type: number
    sql: ${TABLE}.etanol_anidro_m3 ;;
  }

  dimension: etanol_hidratado_m3 {
    type: number
    sql: ${TABLE}.etanol_hidratado_m3 ;;
  }

  dimension: hr_parada_industria {
    type: number
    sql: ${TABLE}.hr_parada_industria ;;
  }

  dimension: moagem_t {
    type: number
    sql: ${TABLE}.moagem_t ;;
  }
  measure: count {
    type: count
  }
}
