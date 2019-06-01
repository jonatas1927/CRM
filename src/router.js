import Vue from "vue";
import Router from "vue-router";
import CargoList from "./views/cargo/CargoList";
import CargoForm from "./views/cargo/CargoForm";
import ProdutoList from "./views/produto/ProdutoList";
import ProdutoForm from "./views/produto/ProdutoForm";
import StatusLeadList from "./views/statusLead/StatusLeadList";
import StatusOportunidadeList from "./views/statusOportunidade/StatusOportunidadeList";
import ContatosList from "./views/contatos/ContatosList";
import EmpresaList from "./views/empresa/EmpresaList";
import EmpresaForm from "./views/empresa/EmpresaForm";
import OportunidadeList from "./views/oportunidade/OportunidadeList";
import OportunidadeForm from "./views/oportunidade/OportunidadeForm";
import NotFoundcomponent from './views/NotFoundcomponent'
Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/cargo",
      name: "cargo",
      component: CargoList
    },
    {
      path: "/cargoform",
      name: "cargo form",
      component: CargoForm
    },
    {
      path: "/produto",
      name: "produto",
      component: ProdutoList
    },
    {
      path: "/produtoform",
      name: "produto form",
      component: ProdutoForm
    },

    {
      path: "/statusLead",
      name: "statusLead",
      component: StatusLeadList
    },
    {
      path: "/statusOportunidade",
      name: "statusOportunidade",
      component: StatusOportunidadeList
    },
    {
      path: "/Contatos",
      name: "Contatos",
      component: ContatosList
    },
    {
      path: "/empresa",
      name: "empresalist",
      component: EmpresaList
    },
    {
      path: "/empresaform",
      name: "empresaform",
      component: EmpresaForm
    },
    {
      path: "/Oportunidade",
      name: "Oportunidadelist",
      component: OportunidadeList
    },
    {
      path: "/Oportunidadeform",
      name: "Oportunidadeform",
      component: OportunidadeForm
    },
    {
      path: "*",
      name: "404",
      component: NotFoundcomponent
    }
  ]
});
