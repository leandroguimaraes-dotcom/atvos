
view: slv_ordem_manutencao {
  derived_table: {
    sql: {% raw %} WITH transformacao_tipos AS (
          SELECT 
              aufnr AS nr_ordem,
              auart AS tipo_ordem,
              ktext AS ds_ordem,
              
              -- ID do Equipamento padronizado (removendo zeros à esquerda e prefixos)
              CAST(REGEXP_EXTRACT(equnr, r'\d+') AS INT64) AS cd_equipamento,
              
              werks AS centro_sap,
              kostl AS centro_custo,
              
              -- 1 e 2. Datas SAP e Data "zerada": SAP costuma enviar '00000000' para datas vazias
              CASE 
                  WHEN erdat IN ('00000000', '0000-00-00', '') OR erdat IS NULL THEN NULL
                  WHEN erdat LIKE '%-%' THEN SAFE.PARSE_DATE('%Y-%m-%d', erdat)
                  ELSE SAFE.PARSE_DATE('%Y%m%d', erdat) 
              END AS dt_abertura,
              
              CASE 
                  WHEN getri IN ('00000000', '0000-00-00', '') OR getri IS NULL THEN NULL
                  WHEN getri LIKE '%-%' THEN SAFE.PARSE_DATE('%Y-%m-%d', getri)
                  ELSE SAFE.PARSE_DATE('%Y%m%d', getri) 
              END AS dt_encerramento,
              
              erzeit AS hr_abertura,
              getrz AS hr_encerramento,
              stat_sistema,
              
              -- 3. Sinal negativo à direita (ex: "150.50-"): Move o '-' para o início e converte para número
              CAST(
                  CASE 
                      WHEN CAST(vl_custo_material AS STRING) LIKE '%-' 
                      THEN CONCAT('-', REPLACE(CAST(vl_custo_material AS STRING), '-', ''))
                      ELSE CAST(vl_custo_material AS STRING)
                  END 
              AS FLOAT64) AS vl_custo_material,
              
              CAST(
                  CASE 
                      WHEN CAST(vl_custo_mao_obra AS STRING) LIKE '%-' 
                      THEN CONCAT('-', REPLACE(CAST(vl_custo_mao_obra AS STRING), '-', ''))
                      ELSE CAST(vl_custo_mao_obra AS STRING)
                  END 
              AS FLOAT64) AS vl_custo_mao_obra,
              
              waers AS moeda
              
          FROM `analytics-looker-interno.agro_bronze.sap_ordem_manutencao`
      )
      
      SELECT 
          t.*,
          
          -- 4. Centro sem de-para: Traz a unidade correspondente e cria uma flag caso não exista mapeamento
          sap.cd_unidade,
          CASE 
              WHEN sap.cd_unidade IS NULL AND t.centro_sap IS NOT NULL THEN TRUE 
              ELSE FALSE 
          END AS flag_centro_sem_depara,
          
          -- 5. Status encerrada: Verifica siglas padrões do SAP (TECO = Technical Completion, CLSD = Closed, ENCE = Encerrada)
          CASE 
              WHEN t.stat_sistema LIKE '%TECO%' 
                OR t.stat_sistema LIKE '%CLSD%' 
                OR t.stat_sistema LIKE '%ENCE%' THEN TRUE 
              ELSE FALSE 
          END AS flag_encerrada,
          
          -- 6. Datas inconsistentes: Identifica ordens onde a data de encerramento é anterior à data de abertura
          CASE 
              WHEN t.dt_encerramento IS NOT NULL 
               AND t.dt_abertura IS NOT NULL 
               AND t.dt_encerramento < t.dt_abertura THEN TRUE 
              ELSE FALSE 
          END AS flag_datas_inconsistentes
      
      FROM transformacao_tipos t
      LEFT JOIN `analytics-looker-interno.agro_bronze.sap_de_para_centro` sap
          ON CAST(t.centro_sap AS STRING) = CAST(sap.centro_sap AS STRING) {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nr_ordem {
    type: string
    sql: ${TABLE}.nr_ordem ;;
  }

  dimension: tipo_ordem {
    type: string
    sql: ${TABLE}.tipo_ordem ;;
  }

  dimension: ds_ordem {
    type: string
    sql: ${TABLE}.ds_ordem ;;
  }

  dimension: cd_equipamento {
    type: number
    sql: ${TABLE}.cd_equipamento ;;
  }

  dimension: centro_sap {
    type: string
    sql: ${TABLE}.centro_sap ;;
  }

  dimension: centro_custo {
    type: string
    sql: ${TABLE}.centro_custo ;;
  }

  dimension: dt_abertura {
    type: date
    datatype: date
    sql: ${TABLE}.dt_abertura ;;
  }

  dimension: dt_encerramento {
    type: date
    datatype: date
    sql: ${TABLE}.dt_encerramento ;;
  }

  dimension: hr_abertura {
    type: string
    sql: ${TABLE}.hr_abertura ;;
  }

  dimension: hr_encerramento {
    type: string
    sql: ${TABLE}.hr_encerramento ;;
  }

  dimension: stat_sistema {
    type: string
    sql: ${TABLE}.stat_sistema ;;
  }

  dimension: vl_custo_material {
    type: number
    sql: ${TABLE}.vl_custo_material ;;
  }

  dimension: vl_custo_mao_obra {
    type: number
    sql: ${TABLE}.vl_custo_mao_obra ;;
  }

  dimension: moeda {
    type: string
    sql: ${TABLE}.moeda ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: flag_centro_sem_depara {
    type: yesno
    sql: ${TABLE}.flag_centro_sem_depara ;;
  }

  dimension: flag_encerrada {
    type: yesno
    sql: ${TABLE}.flag_encerrada ;;
  }

  dimension: flag_datas_inconsistentes {
    type: yesno
    sql: ${TABLE}.flag_datas_inconsistentes ;;
  }

  set: detail {
    fields: [
        nr_ordem,
	tipo_ordem,
	ds_ordem,
	cd_equipamento,
	centro_sap,
	centro_custo,
	dt_abertura,
	dt_encerramento,
	hr_abertura,
	hr_encerramento,
	stat_sistema,
	vl_custo_material,
	vl_custo_mao_obra,
	moeda,
	cd_unidade,
	flag_centro_sem_depara,
	flag_encerrada,
	flag_datas_inconsistentes
    ]
  }
}
