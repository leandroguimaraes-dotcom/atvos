# The name of this view in Looker is "Pims Di Tipo Recurso"
view: pims_di_tipo_recurso {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_di_tipo_recurso` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Tp Recurso" in Explore.

  dimension: cd_tp_recurso {
    type: string
    sql: ${TABLE}.cd_tp_recurso ;;
  }

  dimension: de_tp_recurso {
    type: string
    sql: ${TABLE}.de_tp_recurso ;;
  }

  dimension: fg_tp_oper {
    type: string
    sql: ${TABLE}.fg_tp_oper ;;
  }

  dimension: id_tipo_recurso {
    type: number
    sql: ${TABLE}.id_tipo_recurso ;;
  }
  measure: count {
    type: count
  }
}
