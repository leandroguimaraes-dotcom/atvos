# The name of this view in Looker is "Pims Apont Colheita"
view: pims_apont_colheita {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_apont_colheita` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Equipamento" in Explore.

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: cd_fazenda {
    type: number
    sql: ${TABLE}.cd_fazenda ;;
  }

  dimension: cd_frente {
    type: number
    sql: ${TABLE}.cd_frente ;;
  }

  dimension: cd_operador {
    type: number
    sql: ${TABLE}.cd_operador ;;
  }

  dimension: cd_talhao {
    type: string
    sql: ${TABLE}.cd_talhao ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: dt_apontamento {
    type: string
    sql: ${TABLE}.dt_apontamento ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_carga {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dt_carga ;;
  }

  dimension: hr_fim {
    type: string
    sql: ${TABLE}.hr_fim ;;
  }

  dimension: hr_inicio {
    type: string
    sql: ${TABLE}.hr_inicio ;;
  }

  dimension: id_apontamento {
    type: number
    sql: ${TABLE}.id_apontamento ;;
  }

  dimension: qt_area_colhida_ha {
    type: number
    sql: ${TABLE}.qt_area_colhida_ha ;;
  }

  dimension: qt_toneladas {
    type: string
    sql: ${TABLE}.qt_toneladas ;;
  }

  dimension: safra {
    type: string
    sql: ${TABLE}.safra ;;
  }

  dimension: turno {
    type: string
    sql: ${TABLE}.turno ;;
  }
  measure: count {
    type: count
  }
}
