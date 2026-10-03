include: "/views/slv_unidade.view.lkml"
include: "/views/slv_talhao.view.lkml"
include: "/views/slv_equipamento.view.lkml"


explore: slv_unidade {
  # required_access_grants: [can_see_project]
}
explore: slv_talhao {
  # required_access_grants: [can_see_project]
}
explore: slv_equipamento {
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
