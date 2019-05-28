<template>
  <v-app>
    <v-navigation-drawer app>
      <v-list>
        <router-link v-for="(item, index) in menu" :key="index" :to="item.rota">
          <v-list-tile>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile>
        </router-link>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar app :title="nomeApp"></v-toolbar>
    <v-content>
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-content>
    <v-footer app></v-footer>
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
</style>
