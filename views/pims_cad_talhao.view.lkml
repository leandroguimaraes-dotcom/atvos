# The name of this view in Looker is "Pims Cad Talhao"
view: pims_cad_talhao {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_cad_talhao` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Area Ha" in Explore.

  dimension: area_ha {
    type: number
    sql: ${TABLE}.area_ha ;;
  }

  dimension: cd_fazenda {
    type: number
    sql: ${TABLE}.cd_fazenda ;;
  }

  dimension: cd_fornecedor {
    type: number
    sql: ${TABLE}.cd_fornecedor ;;
  }

  dimension: cd_talhao {
    type: string
    sql: ${TABLE}.cd_talhao ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: distancia_industria_km {
    type: number
    sql: ${TABLE}.distancia_industria_km ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_vigencia_fim {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_vigencia_fim ;;
  }

  dimension_group: dt_vigencia_ini {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_vigencia_ini ;;
  }

  dimension: estagio_corte {
    type: string
    sql: ${TABLE}.estagio_corte ;;
  }

  dimension: nm_fazenda {
    type: string
    sql: ${TABLE}.nm_fazenda ;;
  }

  dimension: tipo_propriedade {
    type: string
    sql: ${TABLE}.tipo_propriedade ;;
  }

  dimension: variedade {
    type: string
    sql: ${TABLE}.variedade ;;
  }
  measure: count {
    type: count
  }
}
