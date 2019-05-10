<template>
  <v-app>
    <v-navigation-drawer app>
      <v-list>
        <v-list-tile>
          <router-link v-for="(item, index) in menu" :key="index" :to="item.rota">
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </router-link>
        </v-list-tile>
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
