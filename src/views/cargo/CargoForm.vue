<template>
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
</template>
<script>
import { Request } from "../../services/Request";
export default {
  data() {
    return {
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
        console.log(ret);
      });
    }
  }
};
</script>
 