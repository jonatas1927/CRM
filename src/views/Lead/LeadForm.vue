<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <v-text-field v-model="id" :rules="idRules" :counter="1000" label="ID do Lead" required></v-text-field>
            <v-text-field v-model="obs" :counter="1000" label="Observação" required></v-text-field>
          </v-flex>
          <v-flex>
            <v-btn color="success" @submit="salvar" @click="salvar">Salvar</v-btn>
          </v-flex>
        </v-layout>
      </v-container>
    </v-form>
    <v-snackbar
      v-model="snackbar"
      :top="true"
      multi-line="multi-line"
      :right="true"
      :timeout="6000"
    >
      {{ mensagem }}
      <v-btn color="pink" flat @click="snackbar = false">Close</v-btn>
    </v-snackbar>
  </v-card>
</template>
<script>
import { Request } from "../../services/Request";
export default {
  data() {
    return {
      snackbar: false,
      mensagem: "dasdasd",
      valid: false,
      idcompleto: "",
      idRules: [v => !!v || "É necessário informar um ID"]
    };
  },
  methods: {
    salvar: function() {
      Request({
        data: {
          query: `
          mutation {
  createLead(input: {lead: {id: "${this.id}"}}) {
    clientMutationId
  }
}`,
          variables: null
        }
      }).then(ret => {
        if (ret.status == 200) {
          this.mensagem = "Registro Salvo com Sucesso";
          this.snackbar = true;
          this.$router.push({ name: "lead" });
        } else {
          this.mensagem = "Houve um erro ao salvar o registro";
          this.snackbar = true;
        }
      });
    }
  },
  mounted() {}
};
</script>
 