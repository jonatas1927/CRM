<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <v-text-field
              v-model="nome"
              :rules="descricaoRules"
              :counter="1000"
              label="Nome"
              required
            ></v-text-field>
            <v-text-field
              v-model="cargo"
              :rules="descricaoRules"
              :counter="1000"
              label="Cargo"
              required
            ></v-text-field>
            <v-text-field
              v-model="email"
              :rules="descricaoRules"
              :counter="1000"
              label="Email"
              required
            ></v-text-field>
            <v-text-field
              v-model="telefone"
              :rules="descricaoRules"
              :counter="1000"
              label="Telefone"
              required
            ></v-text-field>
            <v-text-field
              v-model="cnpjcpf"
              :rules="descricaoRules"
              :counter="1000"
              label="CNPJ/CPF"
              required
            ></v-text-field>
            <v-text-field
              v-model="cnpjcpf"
              :rules="descricaoRules"
              :counter="1000"
              label="Classificação"
              required
            ></v-text-field>
            <v-text-field
              v-model="endereco"
              :rules="descricaoRules"
              :counter="1000"
              label="Endereço"
              required
            ></v-text-field>
            <v-text-field
              v-model="genero"
              :rules="descricaoRules"
              :counter="1000"
              label="Gênero"
              required
            ></v-text-field>
            <v-text-field
              v-model="idEmpresa"
              :rules="descricaoRules"
              :counter="1000"
              label="idEmpresa"
              required
            ></v-text-field>
            <v-text-field
              v-model="obs"
              :rules="descricaoRules"
              :counter="1000"
              label="Obs."
              required
            ></v-text-field>
            <v-text-field
              v-model="principal"
              :rules="descricaoRules"
              :counter="1000"
              label="Principal"
              required
            ></v-text-field>
             <v-text-field
              v-model="redesSociais"
              :rules="descricaoRules"
              :counter="1000"
              label="Redes Sociais"
              required
            ></v-text-field>
            <v-text-field
              v-model="status"
              :rules="descricaoRules"
              :counter="1000"
              label="Status"
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
  createContato(input: {contato: {nome:"${this.nome}",cargo: "${this.cargo}",email:"${this.email}",
  telefone:"${this.telefone}",cnpjcpf:"${this.cnpjcpf}",classificacao:"${this.classificacao}",
  endereco:"${this.endereco}",genero:"${this.genero}",idEmpresa:"${this.idEmpresa}",
  obs:"${this.obs}",principal:"${this.principal}",redesSociais:"${this.redesSociais}",status:"${this.status}"}}) {
    clientMutationId
  }
}`,
          variables: null
        }
      }).then(ret => {
        if (ret.status == 200) {
          this.mensagem = "Registro Salvo com Sucesso";
          this.snackbar = true;
          this.$router.push({ name: "contatosList" });
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
 