
view: slv_equipamento {
  derived_table: {
    sql: {% raw %} SELECT 
          -- Converte a string com zeros à esquerda para inteiro
          CAST(e.equnr AS INT64) AS cd_equipamento,
          
          e.prefixo,
          e.tp_equipamento,
          e.modelo,
          e.fabricante,
          e.ano_fabricacao,
          
          -- Traz a unidade (ex: UAR, UBR) a partir da tabela de/para
          sap.cd_unidade, 
          
          e.centro_sap,
          e.tp_frota,
          
          -- Opcional: Transformar a flag 'X' em um booleano para facilitar as análises no Looker
          CASE 
              WHEN e.fl_ativo = 'X' THEN TRUE 
              ELSE FALSE 
          END AS fl_ativo
      
      FROM `analytics-looker-interno.agro_bronze.sap_equipamento` e
      LEFT JOIN `analytics-looker-interno.agro_bronze.sap_de_para_centro` sap
          ON CAST(e.centro_sap AS STRING) = CAST(sap.centro_sap AS STRING) {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: prefixo {
    type: string
    sql: ${TABLE}.prefixo ;;
  }

  dimension: tp_equipamento {
    type: string
    sql: ${TABLE}.tp_equipamento ;;
  }

  dimension: modelo {
    type: string
    sql: ${TABLE}.modelo ;;
  }

  dimension: fabricante {
    type: string
    sql: ${TABLE}.fabricante ;;
  }

  dimension: ano_fabricacao {
    type: number
    sql: ${TABLE}.ano_fabricacao ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: centro_sap {
    type: string
    sql: ${TABLE}.centro_sap ;;
  }

  dimension: tp_frota {
    type: string
    sql: ${TABLE}.tp_frota ;;
  }

  dimension: fl_ativo {
    type: yesno
    sql: ${TABLE}.fl_ativo ;;
  }

  set: detail {
    fields: [
        cd_equipamento,
	prefixo,
	tp_equipamento,
	modelo,
	fabricante,
	ano_fabricacao,
	cd_unidade,
	centro_sap,
	tp_frota,
	fl_ativo
    ]
  }
}
