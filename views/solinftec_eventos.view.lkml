# The name of this view in Looker is "Solinftec Eventos"
view: solinftec_eventos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.solinftec_eventos` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ds Estado" in Explore.

  dimension: ds_estado {
    type: string
    sql: ${TABLE}.ds_estado ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_hr_fim_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dt_hr_fim_utc ;;
  }

  dimension_group: dt_hr_inicio_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dt_hr_inicio_utc ;;
  }

  dimension: id_equipamento {
    type: string
    sql: ${TABLE}.id_equipamento ;;
  }

  dimension: id_evento {
    type: number
    sql: ${TABLE}.id_evento ;;
  }

  dimension: payload {
    type: string
    sql: ${TABLE}.payload ;;
  }
  measure: count {
    type: count
  }
}
