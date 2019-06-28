<template>
  <v-app>
    <v-navigation-drawer app>
      <template>
        <v-navigation-drawer stateless value="true">
          <v-list>
            <v-list-tile>
              <v-list-tile-action>
                <v-icon>home</v-icon>
              </v-list-tile-action>
              <v-list-tile-title>Home</v-list-tile-title>
            </v-list-tile>

            <v-list-group prepend-icon="account_circle" value="true">
              <template v-slot:activator>
                <v-list-tile>
                  <v-list-tile-title>{{nomeApp}}</v-list-tile-title>
                </v-list-tile>
              </template>
              <v-list-group no-action sub-group value="true">
                <template v-slot:activator>
                  <v-list-tile>
                    <v-list-tile-title>Cadastros</v-list-tile-title>
                  </v-list-tile>
                </template>

                <v-list-tile v-for="(cadastro, i) in menu" :key="i">
                  <router-link :to="cadastro.rota">
                    <v-list-tile-title v-text="cadastro.title"></v-list-tile-title>
                    <v-list-tile-action></v-list-tile-action>
                  </router-link>
                </v-list-tile>
              </v-list-group>

              <v-list-group sub-group no-action>
                <template v-slot:activator>
                  <v-list-tile>
                    <v-list-tile-title>Actions</v-list-tile-title>
                  </v-list-tile>
                </template>
                <v-list-tile v-for="(crud, i) in cruds" :key="i">
                  <v-list-tile-title v-text="crud[0]"></v-list-tile-title>
                  <v-list-tile-action>
                    <v-icon v-text="crud[1]"></v-icon>
                  </v-list-tile-action>
                </v-list-tile>
              </v-list-group>
            </v-list-group>
          </v-list>
        </v-navigation-drawer>
      </template>
    </v-navigation-drawer>
  </v-app>
</template>
<script>
export default {
  data: () => {
    return {
      nomeApp: "CRM",
      drawer: false,
      menu: [
        {
          title: "Cargo",
          rota: "/cargo"
        },
        {
          title: "Produto",
          rota: "/produto"
        },
        {
          title: "Empresa",
          rota: "/empresa"
        },
        {
          title: "Pessoa",
          rota: "/pessoaslist"
        },
        {
          title: "Status Lead",
          rota: "/statusLead"
        },
        {
          title: "Status Oportunidade",
          rota: "/statusOportunidade"
        },
        {
          title: "Contatos",
          rota: "/Contatos"
        },
        {
          title: "Oportunidades",
          rota: "/Oportunidade"
        },
        {
          title: "Lead",
          rota: "/Lead"
        }
      ]
    };
  },
  methods: {},
  mounted() {
    this.$vuetify.lang.current = "pt";
  }
};
</script>
<style>
.drawer {
  transition: 500ms;
}
a{
  text-decoration: none;
}
</style>
