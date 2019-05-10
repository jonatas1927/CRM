<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <v-text-field
              v-model="descricao"
              :rules="descricaoRules"
              :counter="1000"
              label="Descrição"
              required
            ></v-text-field>
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
      descricao: "",
      descricaoRules: [v => !!v || "Descrição é Obrigatória"]
    };
  },
  methods: {
    salvar: function() {
      Request({
        data: {
          query: `mutation {
  createCargo(input: {cargo: {descricao: "${this.descricao}"}}) {
    clientMutationId
  }
}`,
          variables: null
        }
      }).then(ret => {
        if (ret.status == 200) {
          this.mensagem = "Registro Salvo com Sucesso";
          this.snackbar = true;
          this.$router.push({ name: "cargo" });
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
 