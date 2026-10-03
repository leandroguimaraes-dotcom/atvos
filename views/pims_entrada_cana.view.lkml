# The name of this view in Looker is "Pims Entrada Cana"
view: pims_entrada_cana {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_entrada_cana` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Caminhao" in Explore.

  dimension: cd_caminhao {
    type: number
    sql: ${TABLE}.cd_caminhao ;;
  }

  dimension: cd_fazenda {
    type: number
    sql: ${TABLE}.cd_fazenda ;;
  }

  dimension: cd_fornecedor {
    type: number
    sql: ${TABLE}.cd_fornecedor ;;
  }

  dimension: cd_frente {
    type: number
    sql: ${TABLE}.cd_frente ;;
  }

  dimension: cd_talhao {
    type: string
    sql: ${TABLE}.cd_talhao ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_carga {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dt_carga ;;
  }

  dimension_group: dt_hr_pesagem {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dt_hr_pesagem ;;
  }

  dimension: nr_ticket {
    type: number
    sql: ${TABLE}.nr_ticket ;;
  }

  dimension: peso_bruto_kg {
    type: number
    sql: ${TABLE}.peso_bruto_kg ;;
  }

  dimension: peso_liquido_kg {
    type: number
    sql: ${TABLE}.peso_liquido_kg ;;
  }

  dimension: peso_tara_kg {
    type: number
    sql: ${TABLE}.peso_tara_kg ;;
  }

  dimension: placa {
    type: string
    sql: ${TABLE}.placa ;;
  }

  dimension: tp_cana {
    type: string
    sql: ${TABLE}.tp_cana ;;
  }
  measure: count {
    type: count
  }
}
