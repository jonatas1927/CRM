<template>
  <v-app>
    <v-navigation-drawer app></v-navigation-drawer>
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
      drawer: false
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
