include: "/views/slv_unidade.view.lkml"
include: "/views/slv_talhao.view.lkml"
include: "/views/slv_equipamento.view.lkml"
include: "/views/slv_entrada_cana.view.lkml"
include: "/views/slv_lab_ctt.view.lkml"
include: "/views/slv_apont_colheita.view.lkml"
include: "/views/slv_eventos_telemetria.view.lkml"
include: "/views/slv_ordem_manutencao.view.lkml"
include: "/views/slv_abastecimento.view.lkml"
include: "/views/slv_meta_safra.view.lkml"
include: "/views/slv_prod_industrial.view.lkml"


explore: slv_unidade {
  # required_access_grants: [can_see_project]
}
explore: slv_talhao {
  # required_access_grants: [can_see_project]
}
explore: slv_equipamento {
  # required_access_grants: [can_see_project]
}
explore: slv_entrada_cana {
  # required_access_grants: [can_see_project]
}
explore: slv_lab_ctt {
  # required_access_grants: [can_see_project]
}
explore: slv_apont_colheita {
  # required_access_grants: [can_see_project]
}
explore: slv_eventos_telemetria {
  # required_access_grants: [can_see_project]
}
explore: slv_ordem_manutencao {
  # required_access_grants: [can_see_project]
}
explore: slv_abastecimento {
  # required_access_grants: [can_see_project]
}
explore: slv_meta_safra {
  # required_access_grants: [can_see_project]
}
explore: slv_prod_industrial {
  # required_access_grants: [can_see_project]
}
# include: "/views/slv_unidade.view.lkml"
# include: "/views/slv_talhao.view.lkml"

# explore: slv_unidade {
#   # required_access_grants: [can_see_project]

#   join: slv_talhao {
#     type: left_outer
#     sql_on: ${slv_talhao.cd_unidade} = ${slv_unidade.cd_unidade} ;;
#     relationship: one_to_many
#   }
# }
