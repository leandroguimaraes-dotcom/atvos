
view: slv_lab_ctt {
  derived_table: {
    sql: {% raw %} SELECT 
          cd_amostra,
          
          -- 1. Chave do ticket extraída
          CAST(REGEXP_EXTRACT(cd_amostra, r'\d+') AS INT64) AS nr_ticket,
          
          -- Padronização da unidade
          TRIM(UPPER(cd_unidade)) AS cd_unidade,
          
          -- 2. Conversão da data corrigida para o formato "15/04/2026 18:27"
          PARSE_DATETIME('%d/%m/%Y %H:%M', dt_analise) AS dt_analise,
          
          -- Métricas de laboratório
          atr_kg_t,
          pol_cana_pct,
          fibra_pct,
          pureza_pct,
          impureza_mineral_kg_t,
          impureza_vegetal_kg_t
      
      FROM `analytics-looker-interno.agro_bronze.pims_lab_ctt` {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cd_amostra {
    type: string
    sql: ${TABLE}.cd_amostra ;;
  }

  dimension: nr_ticket {
    type: number
    sql: ${TABLE}.nr_ticket ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension_group: dt_analise {
    type: time
    datatype: datetime
    sql: ${TABLE}.dt_analise ;;
  }

  dimension: atr_kg_t {
    type: number
    sql: ${TABLE}.atr_kg_t ;;
  }

  dimension: pol_cana_pct {
    type: number
    sql: ${TABLE}.pol_cana_pct ;;
  }

  dimension: fibra_pct {
    type: number
    sql: ${TABLE}.fibra_pct ;;
  }

  dimension: pureza_pct {
    type: number
    sql: ${TABLE}.pureza_pct ;;
  }

  dimension: impureza_mineral_kg_t {
    type: number
    sql: ${TABLE}.impureza_mineral_kg_t ;;
  }

  dimension: impureza_vegetal_kg_t {
    type: number
    sql: ${TABLE}.impureza_vegetal_kg_t ;;
  }

  set: detail {
    fields: [
        cd_amostra,
	nr_ticket,
	cd_unidade,
	dt_analise_time,
	atr_kg_t,
	pol_cana_pct,
	fibra_pct,
	pureza_pct,
	impureza_mineral_kg_t,
	impureza_vegetal_kg_t
    ]
  }
}
