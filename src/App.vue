<template>
  <div>
    <v-toolbar>
      <v-toolbar-side-icon></v-toolbar-side-icon>
      <v-toolbar-title>{{ nomeApp }}</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-sm-and-down">
        <v-btn flat>Link One</v-btn>
        <v-btn flat>Link Two</v-btn>
        <v-btn icon>
          <v-icon>search</v-icon>
        </v-btn>
      </v-toolbar-items>
    </v-toolbar>
    <router-view />
  </div>
</template>
<script>
export default {
  data: () => {
    return {
      nomeApp: "CRM"
    };
  },
  methods: {},
  mounted(){
    this.$vuetify.lang.current = 'pt'
  }
};
</script>
