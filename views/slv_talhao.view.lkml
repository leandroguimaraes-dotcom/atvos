
view: slv_talhao {
  derived_table: {
    sql: {% raw %} SELECT
          cd_fazenda,
          cd_talhao,
          dt_vigencia_ini,
          nm_fazenda,
          cd_unidade,
          area_ha,
          variedade,
          estagio_corte,
          tipo_propriedade,
          cd_fornecedor,
          distancia_industria_km,
          dt_vigencia_fim,

          -- Flag de versão vigente: se a data fim for nula, é a versão atual ativa
          CASE
              WHEN dt_vigencia_fim IS NULL THEN TRUE
              ELSE FALSE
          END AS flag_versao_vigente

      FROM `analytics-looker-interno.agro_bronze.pims_cad_talhao` {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pk_fazenda_talhao_vigencia {
    primary_key: yes
    hidden: yes # Oculta o campo na interface do explorador, pois serve apenas para o sistema
    type: string
    description: "Chave primária composta por cd_fazenda, cd_talhao e dt_vigencia_ini"
    sql: CONCAT(CAST(${TABLE}.cd_fazenda AS STRING), '_', CAST(${TABLE}.cd_talhao AS STRING), '_', CAST(${TABLE}.dt_vigencia_ini AS STRING)) ;;
  }

  dimension: cd_fazenda {
    type: number
    sql: ${TABLE}.cd_fazenda ;;
  }

  dimension: cd_talhao {
    type: string
    sql: ${TABLE}.cd_talhao ;;
  }

  dimension: dt_vigencia_ini {
    type: date
    datatype: date
    sql: ${TABLE}.dt_vigencia_ini ;;
  }

  dimension: nm_fazenda {
    type: string
    sql: ${TABLE}.nm_fazenda ;;
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: area_ha {
    type: number
    sql: ${TABLE}.area_ha ;;
  }

  dimension: variedade {
    type: string
    sql: ${TABLE}.variedade ;;
  }

  dimension: estagio_corte {
    type: string
    sql: ${TABLE}.estagio_corte ;;
  }

  dimension: tipo_propriedade {
    type: string
    sql: ${TABLE}.tipo_propriedade ;;
  }

  dimension: cd_fornecedor {
    type: number
    sql: ${TABLE}.cd_fornecedor ;;
  }

  dimension: distancia_industria_km {
    type: number
    sql: ${TABLE}.distancia_industria_km ;;
  }

  dimension: dt_vigencia_fim {
    type: date
    datatype: date
    sql: ${TABLE}.dt_vigencia_fim ;;
  }

  dimension: flag_versao_vigente {
    type: yesno
    sql: ${TABLE}.flag_versao_vigente ;;
  }

  set: detail {
    fields: [
        cd_fazenda,
  cd_talhao,
  dt_vigencia_ini,
  nm_fazenda,
  cd_unidade,
  area_ha,
  variedade,
  estagio_corte,
  tipo_propriedade,
  cd_fornecedor,
  distancia_industria_km,
  dt_vigencia_fim,
  flag_versao_vigente
    ]
  }
}
