
view: slv_unidade {
  derived_table: {
    sql: {% raw %} SELECT
          u.cd_unidade,
          TRIM(u.nm_unidade) AS nm_unidade,
          TRIM(u.ds_polo) AS ds_polo,
          UPPER(TRIM(u.sg_uf)) AS sg_uf,
          TRIM(u.nm_municipio) AS nm_municipio,
          TRIM(u.ds_fuso_horario) AS ds_fuso_horario,
          u.qt_capacidade_moagem_t_dia,
          d.centro_sap,
          d.descricao AS descricao_centro_sap
      FROM `analytics-looker-interno.agro_bronze.pims_cad_unidade` AS u
      LEFT JOIN `analytics-looker-interno.agro_bronze.sap_de_para_centro` AS d
          ON u.cd_unidade = d.cd_unidade {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cd_unidade {
    type: string
    sql: ${TABLE}.cd_unidade ;;
  }

  dimension: nm_unidade {
    type: string
    sql: ${TABLE}.nm_unidade ;;
  }

  dimension: ds_polo {
    type: string
    sql: ${TABLE}.ds_polo ;;
  }

  dimension: sg_uf {
    type: string
    sql: ${TABLE}.sg_uf ;;
  }

  dimension: nm_municipio {
    type: string
    sql: ${TABLE}.nm_municipio ;;
  }

  dimension: ds_fuso_horario {
    type: string
    sql: ${TABLE}.ds_fuso_horario ;;
  }

  dimension: qt_capacidade_moagem_t_dia {
    type: number
    sql: ${TABLE}.qt_capacidade_moagem_t_dia ;;
  }

  dimension: centro_sap {
    type: string
    sql: ${TABLE}.centro_sap ;;
  }

  dimension: descricao_centro_sap {
    type: string
    sql: ${TABLE}.descricao_centro_sap ;;
  }

  set: detail {
    fields: [
        cd_unidade,
	nm_unidade,
	ds_polo,
	sg_uf,
	nm_municipio,
	ds_fuso_horario,
	qt_capacidade_moagem_t_dia,
	centro_sap,
	descricao_centro_sap
    ]
  }
}
