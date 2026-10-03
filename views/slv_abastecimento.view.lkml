
view: slv_abastecimento {
  derived_table: {
    sql: {% raw %} WITH deduplicado AS (
          -- Remove duplicatas mantendo o apontamento mais recente baseado no id_abastecimento
          SELECT * EXCEPT(rn)
          FROM (
              SELECT
                  *,
                  ROW_NUMBER() OVER (
                      PARTITION BY id_abastecimento
                      ORDER BY dt_hr_abastecimento DESC
                  ) AS rn
              FROM `analytics-looker-interno.agro_bronze.comboio_abastecimento`
          )
          WHERE rn = 1
      )
      
      SELECT 
          id_abastecimento,
          
          -- 1. Data BR -> Datetime: Trata o formato DD/MM/YYYY HH:MM:SS
          -- O COALESCE garante que, se não houver segundos na string, ele tente o formato só com horas e minutos
          COALESCE(
              SAFE.PARSE_DATETIME('%d/%m/%Y %H:%M:%S', dt_hr_abastecimento),
              SAFE.PARSE_DATETIME('%d/%m/%Y %H:%M', dt_hr_abastecimento)
          ) AS dt_hr_abastecimento,
          
          -- Padronização de chaves de unidade e equipamento
          TRIM(UPPER(cd_unidade)) AS cd_unidade,
          CAST(REGEXP_EXTRACT(cd_equipamento, r'\d+') AS INT64) AS cd_equipamento,
          cd_comboio,
          
          -- 2. Combustível padronizado: Remove espaços extras e converte para maiúsculo (ex: " diesel " -> "DIESEL")
          TRIM(UPPER(ds_combustivel)) AS ds_combustivel,
          
          -- 3. Decimal com vírgula: Substitui a vírgula por ponto para permitir a conversão para número (FLOAT64)
          SAFE_CAST(REPLACE(CAST(qt_litros AS STRING), ',', '.') AS FLOAT64) AS qt_litros,
          SAFE_CAST(REPLACE(CAST(vl_horimetro AS STRING), ',', '.') AS FLOAT64) AS vl_horimetro,
          SAFE_CAST(REPLACE(CAST(vl_preco_litro AS STRING), ',', '.') AS FLOAT64) AS vl_preco_litro,
          
          -- Opcional: Cálculo do valor total do abastecimento
          (SAFE_CAST(REPLACE(CAST(qt_litros AS STRING), ',', '.') AS FLOAT64) * 
           SAFE_CAST(REPLACE(CAST(vl_preco_litro AS STRING), ',', '.') AS FLOAT64)) AS vl_total_abastecimento
      
      FROM deduplicado {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_abastecimento {
    type: number
    sql: ${TABLE}.id_abastecimento ;;
  }

  dimension_group: dt_hr_abastecimento {
    type: time
    datatype: datetime
    sql: ${TABLE}.dt_hr_abastecimento ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: cd_comboio {
    type: string
    sql: ${TABLE}.cd_comboio ;;
  }

  dimension: ds_combustivel {
    type: string
    sql: ${TABLE}.ds_combustivel ;;
  }

  dimension: qt_litros {
    type: number
    sql: ${TABLE}.qt_litros ;;
  }

  dimension: vl_horimetro {
    type: number
    sql: ${TABLE}.vl_horimetro ;;
  }

  dimension: vl_preco_litro {
    type: number
    sql: ${TABLE}.vl_preco_litro ;;
  }

  dimension: vl_total_abastecimento {
    type: number
    sql: ${TABLE}.vl_total_abastecimento ;;
  }

  set: detail {
    fields: [
        id_abastecimento,
	dt_hr_abastecimento_time,
	cd_unidade,
	cd_equipamento,
	cd_comboio,
	ds_combustivel,
	qt_litros,
	vl_horimetro,
	vl_preco_litro,
	vl_total_abastecimento
    ]
  }
}
