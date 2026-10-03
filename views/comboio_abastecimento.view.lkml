# The name of this view in Looker is "Comboio Abastecimento"
view: comboio_abastecimento {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.comboio_abastecimento` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Comboio" in Explore.

  dimension: cd_comboio {
    type: string
    sql: ${TABLE}.cd_comboio ;;
  }

  dimension: cd_equipamento {
    type: string
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: ds_combustivel {
    type: string
    sql: ${TABLE}.ds_combustivel ;;
  }

  dimension: dt_hr_abastecimento {
    type: string
    sql: ${TABLE}.dt_hr_abastecimento ;;
  }

  dimension: id_abastecimento {
    type: number
    sql: ${TABLE}.id_abastecimento ;;
  }

  dimension: qt_litros {
    type: string
    sql: ${TABLE}.qt_litros ;;
  }

  dimension: vl_horimetro {
    type: string
    sql: ${TABLE}.vl_horimetro ;;
  }

  dimension: vl_preco_litro {
    type: string
    sql: ${TABLE}.vl_preco_litro ;;
  }
  measure: count {
    type: count
  }
}
