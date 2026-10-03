# The name of this view in Looker is "Pims Cad Fornecedor"
view: pims_cad_fornecedor {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `agro_bronze.pims_cad_fornecedor` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cd Fornecedor" in Explore.

  dimension: cd_fornecedor {
    type: number
    sql: ${TABLE}.cd_fornecedor ;;
  }

  dimension: cd_unidade_principal {
    type: string
    sql: ${TABLE}.cd_unidade_principal ;;
  }

  dimension: nm_fornecedor {
    type: string
    sql: ${TABLE}.nm_fornecedor ;;
  }

  dimension: nr_documento_mascarado {
    type: string
    sql: ${TABLE}.nr_documento_mascarado ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tp_pessoa {
    type: string
    sql: ${TABLE}.tp_pessoa ;;
  }
  measure: count {
    type: count
  }
}
