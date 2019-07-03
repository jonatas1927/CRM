import Vue from "vue";
import Router from "vue-router";
import CargoList from "./views/cargo/CargoList";
import CargoForm from "./views/cargo/CargoForm";
import ProdutoList from "./views/produto/ProdutoList";
import ProdutoForm from "./views/produto/ProdutoForm";
import StatusLeadList from "./views/statusLead/StatusLeadList";
import StatusLeadForm from "./views/statusLead/StatusLeadForm";
import StatusOportunidadeList from "./views/statusOportunidade/StatusOportunidadeList";
import StatusOportunidadeForm from "./views/statusOportunidade/StatusOportunidadeForm";
import ContatosList from "./views/contatos/ContatosList";
import EmpresaList from "./views/empresa/EmpresaList";
import EmpresaForm from "./views/empresa/EmpresaForm";
import OportunidadeList from "./views/oportunidade/OportunidadeList";
import OportunidadeForm from "./views/oportunidade/OportunidadeForm";
import LeadList from "./views/Lead/LeadList";
import LeadForm from "./views/Lead/LeadForm";
import PessoasList from "./views/pessoa/PessoasList";
import NotFoundcomponent from "./views/NotFoundcomponent";
import PessoasForm from "./views/pessoa/PessoasForm";
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
      path: "/PessoasForm",
      name: "pessoas form",
      component: PessoasForm
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
      path: "/statusLeadForm",
      name: "statusLeadForm",
      component: StatusLeadForm
    },
    {
      path: "/statusOportunidade",
      name: "statusOportunidade",
      component: StatusOportunidadeList
    },
    {
      path: "/StatusOportunidadeForm",
      name: "StatusOportunidadeForm",
      component: StatusOportunidadeForm
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
      path: "/Lead",
      name: "Leadlist",
      component: LeadList
    },
    {
      path: "/Leadform",
      name: "Leadform",
      component: LeadForm
    },
    {
      path: "/PessoasList",
      name: "PessoasList",
      component: PessoasList
    },
    {
      path: "*",
      name: "404",
      component: NotFoundcomponent
    }
  ]
});
