
view: slv_entrada_cana {
  derived_table: {
    sql: {% raw %} WITH deduplicado AS (
          SELECT * EXCEPT(rn)
          FROM (
              SELECT
                  *,
                  ROW_NUMBER() OVER (
                      PARTITION BY nr_ticket
                      ORDER BY dt_carga DESC
                  ) AS rn
              FROM `analytics-looker-interno.agro_bronze.pims_entrada_cana`
          )
          WHERE rn = 1
      )
      
      SELECT 
          nr_ticket,
          dt_carga,
          
          -- 1. Unidade padronizada: remove espaços extras e força maiúsculas
          TRIM(UPPER(cd_unidade)) AS cd_unidade,
          
          peso_bruto_kg,
          peso_tara_kg,
          
          -- 2. Peso líquido recalculado
          (peso_bruto_kg - peso_tara_kg) AS peso_liquido_kg_recalculado,
          
          -- 3. Flag de pesagem inválida: junta a verificação de nulos e a regra matemática
          CASE 
              WHEN peso_bruto_kg IS NULL OR peso_tara_kg IS NULL THEN TRUE
              WHEN peso_tara_kg >= peso_bruto_kg THEN TRUE 
              ELSE FALSE 
          END AS flag_pesagem_invalida,
          
          -- 4. Safra: Ano-Safra base Abril/Março (ex: 2023/24)
          CASE 
              WHEN EXTRACT(MONTH FROM dt_carga) >= 4 
                  THEN CONCAT(CAST(EXTRACT(YEAR FROM dt_carga) AS STRING), '/', SUBSTR(CAST(EXTRACT(YEAR FROM dt_carga) + 1 AS STRING), 3, 2))
              ELSE 
                  CONCAT(CAST(EXTRACT(YEAR FROM dt_carga) - 1 AS STRING), '/', SUBSTR(CAST(EXTRACT(YEAR FROM dt_carga) AS STRING), 3, 2))
          END AS safra,
          
          cd_frente,   
          cd_fazenda,   
          cd_talhao,
          tp_cana,
          cd_fornecedor,
          cd_caminhao,
          placa
      
          
      FROM deduplicado {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nr_ticket {
    type: number
    sql: ${TABLE}.nr_ticket ;;
  }

  dimension_group: dt_carga {
    type: time
    datatype: datetime
    sql: ${TABLE}.dt_carga ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: peso_bruto_kg {
    type: number
    sql: ${TABLE}.peso_bruto_kg ;;
  }

  dimension: peso_tara_kg {
    type: number
    sql: ${TABLE}.peso_tara_kg ;;
  }

  dimension: peso_liquido_kg_recalculado {
    type: number
    sql: ${TABLE}.peso_liquido_kg_recalculado ;;
  }

  dimension: flag_pesagem_invalida {
    type: yesno
    sql: ${TABLE}.flag_pesagem_invalida ;;
  }

  dimension: safra {
    type: string
    sql: ${TABLE}.safra ;;
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

  dimension: tp_cana {
    type: string
    sql: ${TABLE}.tp_cana ;;
  }

  dimension: cd_fornecedor {
    type: number
    sql: ${TABLE}.cd_fornecedor ;;
  }

  dimension: cd_caminhao {
    type: number
    sql: ${TABLE}.cd_caminhao ;;
  }

  dimension: placa {
    type: string
    sql: ${TABLE}.placa ;;
  }

  set: detail {
    fields: [
        nr_ticket,
	dt_carga_time,
	cd_unidade,
	peso_bruto_kg,
	peso_tara_kg,
	peso_liquido_kg_recalculado,
	flag_pesagem_invalida,
	safra,
	cd_frente,
	cd_fazenda,
	cd_talhao,
	tp_cana,
	cd_fornecedor,
	cd_caminhao,
	placa
    ]
  }
}
