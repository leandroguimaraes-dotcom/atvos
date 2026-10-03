# The name of this view in Looker is "Pims Di Frente"
view: pims_di_frente {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_di_frente` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Fren Tran" in Explore.

  dimension: cd_fren_tran {
    type: number
    sql: ${TABLE}.cd_fren_tran ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_carga {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.data_carga ;;
  }

  dimension: de_fren_tran {
    type: string
    sql: ${TABLE}.de_fren_tran ;;
  }

  dimension: frente {
    type: string
    sql: ${TABLE}.frente ;;
  }

  dimension: id_frente {
    type: number
    sql: ${TABLE}.id_frente ;;
  }

  dimension: odi_session_id {
    type: number
    sql: ${TABLE}.odi_session_id ;;
  }
  measure: count {
    type: count
  }
}
