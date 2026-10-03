
view: slv_eventos_telemetria {
  derived_table: {
    sql: {% raw %} WITH deduplicado AS (
          -- Remoção de duplicatas baseada no id_evento
          SELECT * EXCEPT(rn)
          FROM (
              SELECT
                  *,
                  ROW_NUMBER() OVER (
                      PARTITION BY id_evento
                      ORDER BY dt_hr_inicio_utc DESC
                  ) AS rn
              FROM `analytics-looker-interno.agro_bronze.solinftec_eventos`
          )
          WHERE rn = 1
      ),
      fuso_horario_equipamento AS (
          -- Busca o fuso horário da unidade vinculada ao equipamento para a conversão de UTC
          SELECT 
              CAST(e.equnr AS INT64) AS cd_equipamento,
              pcu.ds_fuso_horario
          FROM `analytics-looker-interno.agro_bronze.sap_equipamento` e
          LEFT JOIN `analytics-looker-interno.agro_bronze.sap_de_para_centro` sap
              ON CAST(e.centro_sap AS STRING) = CAST(sap.centro_sap AS STRING)
          LEFT JOIN `analytics-looker-interno.agro_bronze.pims_cad_unidade` pcu
              ON sap.cd_unidade = pcu.cd_unidade
      )
      
      SELECT 
          a.id_evento,
          
          -- 1. ID do equipamento: Extrai apenas os números (ex: 10007) e converte para inteiro
          CAST(REGEXP_EXTRACT(a.id_equipamento, r'\d+') AS INT64) AS cd_equipamento,
          
          -- 2. Estado normalizado: Remoção de espaços e conversão para maiúsculas
          TRIM(UPPER(a.ds_estado)) AS ds_estado,
          
          -- 3. UTC -> Horário local: Utiliza o fuso horário cadastrado para a unidade do equipamento
          DATETIME(TIMESTAMP(a.dt_hr_inicio_utc), COALESCE(fuso.ds_fuso_horario, 'America/Sao_Paulo')) AS dt_hr_inicio_local,
          DATETIME(TIMESTAMP(a.dt_hr_fim_utc), COALESCE(fuso.ds_fuso_horario, 'America/Sao_Paulo')) AS dt_hr_fim_local,
          
          -- Manutenção dos campos originais UTC para rastreabilidade
          a.dt_hr_inicio_utc,
          a.dt_hr_fim_utc,
          
          -- 4. Campos do JSON: Extração com JSON_VALUE e conversão de tipos
          CAST(JSON_VALUE(a.payload, '$.velocidade') AS FLOAT64) AS velocidade_kmh,
          CAST(JSON_VALUE(a.payload, '$.rpm') AS INT64) AS rpm_motor,
          CAST(JSON_VALUE(a.payload, '$.consumo') AS FLOAT64) AS consumo_litros,
          JSON_VALUE(a.payload, '$.operador') AS cd_operador
      
      FROM deduplicado a
      LEFT JOIN fuso_horario_equipamento fuso 
          -- Aplica a mesma extração numérica na condição de JOIN para encontrar a unidade correta
          ON CAST(REGEXP_EXTRACT(a.id_equipamento, r'\d+') AS INT64) = fuso.cd_equipamento {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_evento {
    type: number
    sql: ${TABLE}.id_evento ;;
  }

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: ds_estado {
    type: string
    sql: ${TABLE}.ds_estado ;;
  }

  dimension_group: dt_hr_inicio_local {
    type: time
    datatype: datetime
    sql: ${TABLE}.dt_hr_inicio_local ;;
  }

  dimension_group: dt_hr_fim_local {
    type: time
    datatype: datetime
    sql: ${TABLE}.dt_hr_fim_local ;;
  }

  dimension_group: dt_hr_inicio_utc {
    type: time
    sql: ${TABLE}.dt_hr_inicio_utc ;;
  }

  dimension_group: dt_hr_fim_utc {
    type: time
    sql: ${TABLE}.dt_hr_fim_utc ;;
  }

  dimension: velocidade_kmh {
    type: number
    sql: ${TABLE}.velocidade_kmh ;;
  }

  dimension: rpm_motor {
    type: number
    sql: ${TABLE}.rpm_motor ;;
  }

  dimension: consumo_litros {
    type: number
    sql: ${TABLE}.consumo_litros ;;
  }

  dimension: cd_operador {
    type: string
    sql: ${TABLE}.cd_operador ;;
  }

  set: detail {
    fields: [
        id_evento,
	cd_equipamento,
	ds_estado,
	dt_hr_inicio_local_time,
	dt_hr_fim_local_time,
	dt_hr_inicio_utc_time,
	dt_hr_fim_utc_time,
	velocidade_kmh,
	rpm_motor,
	consumo_litros,
	cd_operador
    ]
  }
}
