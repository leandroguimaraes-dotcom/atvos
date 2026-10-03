
view: slv_meta_safra {
  derived_table: {
    sql: {% raw %} WITH prepara_colunas AS (
          SELECT 
              TRIM(UPPER(safra)) AS safra,
              TRIM(UPPER(unidade)) AS unidade,
              TRIM(indicador) AS indicador,
              CAST(abr AS STRING) AS abr,
              CAST(mai AS STRING) AS mai,
              CAST(jun AS STRING) AS jun,
              CAST(jul AS STRING) AS jul,
              CAST(ago AS STRING) AS ago,
              CAST(`set` AS STRING) AS `set`,
              CAST(`out` AS STRING) AS `out`,
              CAST(nov AS STRING) AS nov,
              CAST(dez AS STRING) AS dez,
              CAST(jan AS STRING) AS jan,
              CAST(fev AS STRING) AS fev,
              CAST(mar AS STRING) AS mar
          FROM `analytics-looker-interno.agro_bronze.sharepoint_meta_safra`
      ),
      dados_unpivot AS (
          SELECT 
              safra, 
              unidade, 
              indicador, 
              mes, 
              valor_texto
          FROM prepara_colunas
          UNPIVOT(
              valor_texto FOR mes IN (abr, mai, jun, jul, ago, `set`, `out`, nov, dez, jan, fev, mar)
          )
      )
      
      SELECT 
          safra,
          unidade,
          indicador,
          LOWER(mes) AS mes,
          
          -- Percentual em texto -> número com função ENDS_WITH
          CASE 
              WHEN ENDS_WITH(TRIM(valor_texto), '%') THEN 
                  SAFE_CAST(REPLACE(REPLACE(valor_texto, '%', ''), ',', '.') AS FLOAT64) / 100.0
              ELSE 
                  SAFE_CAST(REPLACE(valor_texto, ',', '.') AS FLOAT64)
          END AS valor_meta
      
      FROM dados_unpivot
      WHERE valor_texto IS NOT NULL 
        AND TRIM(valor_texto) != '' {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: safra {
    type: string
    sql: ${TABLE}.safra ;;
  }

  dimension: unidade {
    type: string
    sql: ${TABLE}.unidade ;;
  }

  dimension: indicador {
    type: string
    sql: ${TABLE}.indicador ;;
  }

  dimension: mes {
    type: string
    sql: ${TABLE}.mes ;;
  }

  dimension: valor_meta {
    type: number
    sql: ${TABLE}.valor_meta ;;
  }

  set: detail {
    fields: [
        safra,
	unidade,
	indicador,
	mes,
	valor_meta
    ]
  }
}
