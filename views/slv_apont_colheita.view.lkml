
view: slv_apont_colheita {
  derived_table: {
    sql: {% raw %} WITH deduplicado AS (
          -- Garante 1 linha por id_apontamento
          SELECT * EXCEPT(rn)
          FROM (
              SELECT
                  *,
                  ROW_NUMBER() OVER (
                      PARTITION BY id_apontamento
                      ORDER BY dt_apontamento DESC
                  ) AS rn
              FROM `analytics-looker-interno.agro_bronze.pims_apont_colheita`
          )
          WHERE rn = 1
      ),
      equipamentos_ativos AS (
          -- Simula a tabela de equipamentos para verificar o vínculo
          SELECT DISTINCT CAST(equnr AS INT64) AS cd_equipamento
          FROM `analytics-looker-interno.agro_bronze.sap_equipamento`
      ),
      tratamento_horas AS (
          SELECT 
              *,
              -- 1. Trata hr_inicio: Se tiver ':', separa horas e minutos e converte para decimal. Senão, troca vírgula por ponto.
              CASE 
                  WHEN CAST(hr_inicio AS STRING) IS NULL THEN NULL
                  WHEN CAST(hr_inicio AS STRING) LIKE '%:%' THEN 
                      SAFE_CAST(SPLIT(CAST(hr_inicio AS STRING), ':')[SAFE_OFFSET(0)] AS FLOAT64) + 
                      (SAFE_CAST(SPLIT(CAST(hr_inicio AS STRING), ':')[SAFE_OFFSET(1)] AS FLOAT64) / 60.0)
                  ELSE SAFE_CAST(REPLACE(CAST(hr_inicio AS STRING), ',', '.') AS FLOAT64)
              END AS hr_inicio_dec,
              
              -- 2. Trata hr_fim: Aplica a mesma regra
              CASE 
                  WHEN CAST(hr_fim AS STRING) IS NULL THEN NULL
                  WHEN CAST(hr_fim AS STRING) LIKE '%:%' THEN 
                      SAFE_CAST(SPLIT(CAST(hr_fim AS STRING), ':')[SAFE_OFFSET(0)] AS FLOAT64) + 
                      (SAFE_CAST(SPLIT(CAST(hr_fim AS STRING), ':')[SAFE_OFFSET(1)] AS FLOAT64) / 60.0)
                  ELSE SAFE_CAST(REPLACE(CAST(hr_fim AS STRING), ',', '.') AS FLOAT64)
              END AS hr_fim_dec
      
          FROM deduplicado
      )
      
      SELECT 
          a.id_apontamento,
          
          COALESCE(
              SAFE.PARSE_DATE('%d/%m/%Y', a.dt_apontamento),
              SAFE.PARSE_DATE('%Y-%m-%d', a.dt_apontamento)
          ) AS dt_apontamento,
          
          REPLACE(TRIM(UPPER(a.safra)), '-', '/') AS safra,
          
          a.turno,
          TRIM(UPPER(a.cd_unidade)) AS cd_unidade,
          a.cd_frente,
          a.cd_fazenda,
          a.cd_talhao,
          a.cd_equipamento,
          a.cd_operador,
          
          a.hr_inicio_dec AS hr_inicio,
          a.hr_fim_dec AS hr_fim,
          
          -- 3. Horas do turno: Agora com os valores matematicamente corretos em decimal
          CASE 
              WHEN a.hr_fim_dec < a.hr_inicio_dec THEN (a.hr_fim_dec + 24.0) - a.hr_inicio_dec
              ELSE a.hr_fim_dec - a.hr_inicio_dec
          END AS horas_turno,
          
          CASE 
              WHEN eq.cd_equipamento IS NULL THEN TRUE 
              ELSE FALSE 
          END AS flag_equipamento_orfao
      
      FROM tratamento_horas a
      LEFT JOIN equipamentos_ativos eq 
          ON CAST(a.cd_equipamento AS INT64) = eq.cd_equipamento {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_apontamento {
    type: number
    sql: ${TABLE}.id_apontamento ;;
  }

  dimension: dt_apontamento {
    type: date
    datatype: date
    sql: ${TABLE}.dt_apontamento ;;
  }

  dimension: safra {
    type: string
    sql: ${TABLE}.safra ;;
  }

  dimension: turno {
    type: string
    sql: ${TABLE}.turno ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: cd_frente {
    type: number
    sql: ${TABLE}.cd_frente ;;
  }

  dimension: cd_fazenda {
    type: number
    sql: ${TABLE}.cd_fazenda ;;
  }

  dimension: cd_talhao {
    type: string
    sql: ${TABLE}.cd_talhao ;;
  }

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: cd_operador {
    type: number
    sql: ${TABLE}.cd_operador ;;
  }

  dimension: hr_inicio {
    type: number
    sql: ${TABLE}.hr_inicio ;;
  }

  dimension: hr_fim {
    type: number
    sql: ${TABLE}.hr_fim ;;
  }

  dimension: horas_turno {
    type: number
    sql: ${TABLE}.horas_turno ;;
  }

  dimension: flag_equipamento_orfao {
    type: yesno
    sql: ${TABLE}.flag_equipamento_orfao ;;
  }

  set: detail {
    fields: [
        id_apontamento,
	dt_apontamento,
	safra,
	turno,
	cd_unidade,
	cd_frente,
	cd_fazenda,
	cd_talhao,
	cd_equipamento,
	cd_operador,
	hr_inicio,
	hr_fim,
	horas_turno,
	flag_equipamento_orfao
    ]
  }
}
