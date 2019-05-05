import Vue from "vue";
import Router from "vue-router";
import CargoList from "./views/cargo/CargoList";
import StatusLeadList from "./views/statusLead/StatusLeadList";
import StatusOportunidadeList from "./views/statusOportunidade/StatusOportunidadeList";
import ContatosList from "./views/contatos/ContatosList";
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
    }
  ]
});
