<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <v-text-field
              v-model="form.razaosocial"
              :rules="razaosocialRules"
              :counter="1000"
              label="Razão Social"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.setor"
              :rules="setorRules"
              :counter="1000"
              label="Setor"
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
              v-model="form.email"
              :rules="emailRules"
              :counter="1000"
              label="E-mail"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.cnpj"
              :rules="cnpjRules"
              :counter="1000"
              label="CNPJ"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.clientes"
              :rules="clientesRules"
              :counter="1000"
              label="Clientes"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.telefone"
              :rules="telefoneRules"
              :counter="1000"
              label="Telefone"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.fundacao"
              :rules="fundacaoRules"
              :counter="1000"
              label="Data Fundação"
              required
            ></v-text-field>
            <v-text-field
              v-model="form.segmento"
              :rules="segmentoRules"
              :counter="1000"
              label="Segmento"
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
        razaosocial: "",
        setor:  "",
        endereco: "",
        email: "",
        cnpj: "",
        clientes: "",
        telefone: "",
        fundacao: "",
        segmento: ""
      },
      valid: false
    };
  },
  methods: {
    salvar: function() {
      Request({
        data: {
          query: `mutation {
             createEmpresa(input: {empresa: {razaoSocial: "${this.form.razaosocial}", setor: "${this.form.setor}", endereco: "${this.form.endereco}", email: "${this.form.email}", cnpj: "${this.form.cnpj}", telefone: "${this.form.telefone}", clientes: "${this.form.clientes}", dataFundacao: "${this.form.fundacao}", segmento: "${this.form.segmento}"}}) {
               clientMutationId
                  }
               }`,
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
 