
view: slv_unidade {
  derived_table: {
    sql: {% raw %} SELECT 
          pcu.cd_unidade,
          pcu.nm_unidade,
          pcu.ds_polo,
          pcu.sg_uf,
          pcu.nm_municipio,
          pcu.ds_fuso_horario,
          pcu.qt_capacidade_moagem_t_dia,
          sap.centro_sap,
          wdu.codigo_regional,
          wdu.regional
      FROM `analytics-looker-interno.agro_bronze.pims_cad_unidade` pcu
      LEFT JOIN `analytics-looker-interno.agro_bronze.sap_de_para_centro` sap 
          ON pcu.cd_unidade = sap.cd_unidade
      LEFT JOIN `analytics-looker-interno.agro_bronze.ws_di_unidade` wdu 
          ON pcu.cd_unidade = wdu.sigla_unidade
      LEFT JOIN `analytics-looker-interno.agro_bronze.pims_di_unidade` pdu 
          ON pcu.cd_unidade = pdu.sigla_unidade {% endraw %} ;;
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

  dimension: codigo_regional {
    type: number
    sql: ${TABLE}.codigo_regional ;;
  }

  dimension: regional {
    type: string
    sql: ${TABLE}.regional ;;
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
	codigo_regional,
	regional
    ]
  }
}
