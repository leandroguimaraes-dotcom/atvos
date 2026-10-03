
view: slv_prod_industrial {
  derived_table: {
    sql: {% raw %} WITH deduplicado AS (
          -- 1. Deduplicação: Garante apenas 1 linha por unidade e dia
          SELECT * EXCEPT(rn)
          FROM (
              SELECT
                  *,
                  ROW_NUMBER() OVER (
                      PARTITION BY cd_unidade, dt_producao
                      ORDER BY moagem_t DESC -- Em caso de duplicata exata, traz a linha com maior moagem registrada
                  ) AS rn
              FROM `analytics-looker-interno.agro_bronze.pims_prod_industrial`
          )
          WHERE rn = 1
      )
      
      SELECT 
          -- 2. Padronização de datas
          CAST(dt_producao AS DATE) AS dt_producao,
          
          -- 3. Padronização de chaves de cruzamento (remover espaços e forçar maiúscula)
          TRIM(UPPER(cd_unidade)) AS cd_unidade,
          
          -- 4. Tipagem de decimais: Substitui vírgula por ponto (preventivo) e garante o formato FLOAT64
          SAFE_CAST(REPLACE(CAST(moagem_t AS STRING), ',', '.') AS FLOAT64) AS moagem_t,
          SAFE_CAST(REPLACE(CAST(etanol_hidratado_m3 AS STRING), ',', '.') AS FLOAT64) AS etanol_hidratado_m3,
          SAFE_CAST(REPLACE(CAST(etanol_anidro_m3 AS STRING), ',', '.') AS FLOAT64) AS etanol_anidro_m3,
          SAFE_CAST(REPLACE(CAST(energia_exportada_mwh AS STRING), ',', '.') AS FLOAT64) AS energia_exportada_mwh,
          SAFE_CAST(REPLACE(CAST(bagaco_t AS STRING), ',', '.') AS FLOAT64) AS bagaco_t,
          SAFE_CAST(REPLACE(CAST(hr_parada_industria AS STRING), ',', '.') AS FLOAT64) AS hr_parada_industria
      
      FROM deduplicado {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dt_producao {
    type: date
    datatype: date
    sql: ${TABLE}.dt_producao ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: moagem_t {
    type: number
    sql: ${TABLE}.moagem_t ;;
  }

  dimension: etanol_hidratado_m3 {
    type: number
    sql: ${TABLE}.etanol_hidratado_m3 ;;
  }

  dimension: etanol_anidro_m3 {
    type: number
    sql: ${TABLE}.etanol_anidro_m3 ;;
  }

  dimension: energia_exportada_mwh {
    type: number
    sql: ${TABLE}.energia_exportada_mwh ;;
  }

  dimension: bagaco_t {
    type: number
    sql: ${TABLE}.bagaco_t ;;
  }

  dimension: hr_parada_industria {
    type: number
    sql: ${TABLE}.hr_parada_industria ;;
  }

  set: detail {
    fields: [
        dt_producao,
	cd_unidade,
	moagem_t,
	etanol_hidratado_m3,
	etanol_anidro_m3,
	energia_exportada_mwh,
	bagaco_t,
	hr_parada_industria
    ]
  }
}
