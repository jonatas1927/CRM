<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <v-text-field
              v-model="form.nome"
              :rules="nomeRules"
              :counter="1000"
              label="Nome"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.email"
              :rules="emailRules"
              :counter="1000"
              label="E-mail"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.celular"
              :rules="celularRules"
              :counter="1000"
              label="Celular"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.endereco"
              :rules="enderecoRules"
              :counter="1000"
              label="Endereço"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.cargo"
              :rules="cargoRules"
              :counter="1000"
              label="Cargo"
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
      form: {
        cargo: "",
        nome: "",
        celular: "",
        endereco: ""
      },
      valid: false
    };
  },
  methods: {
    salvar: function() {
      Request({
        data: {
          query: `mutation {
            createPessoa(input: {pessoa: {nome: "${this.form.nome}", email: "${this.form.email}", celular: "${this.form.celular}", endereco: "${this.form.endereco}", cargo: "${this.form.cargo}"}}) {
              clientMutationId
            }
          }
        `,
          variables: null
        }
      }).then(ret => {
        if (ret.status == 200) {
          this.mensagem = "Registro Salvo com Sucesso";
          this.snackbar = true;
          this.$router.push({ name: "empresa" });
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