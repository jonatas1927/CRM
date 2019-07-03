<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <v-layout row>
              <v-flex xs8 md8>
                <v-text-field
                  v-model="form.razaosocial"
                  :rules="razaosocialRules"
                  :counter="150"
                  label="Razão Social"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs1 md1>
                </v-flex>
              <v-flex xs3 md3>
                <v-menu
                  v-model="dataFundacao"
                  :close-on-content-click="true"
                  :nudge-right="40"
                  lazy
                  transition="scale-transition"
                  offset-y
                  full-width
                  min-width="290px"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="form.fundacao"
                      label="Data Fundação"
                      prepend-icon="event"
                      readonly
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker lang="pt-br" v-model="form.fundacao"></v-date-picker>
                </v-menu>
              </v-flex>
            </v-layout>
            <v-layout row>
              <v-flex xs8 md8>
                <v-text-field
                  v-model="form.endereco"
                  :rules="enderecoRules"
                  :counter="150"
                  label="Endereço"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs1 md1>
                </v-flex>
              <v-flex xs3 md3>
                <v-text-field
                  v-model="form.telefone"
                  :rules="telefoneRules"
                  :counter="1000"
                  label="Telefone"
                  required
                ></v-text-field>
              </v-flex>
            </v-layout>
            <v-layout row>
              <v-flex xs5 md5>
                <v-text-field
                  v-model="form.setor"
                  :rules="setorRules"
                  :counter="1000"
                  label="Setor"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs1 md1>
                </v-flex>
              <v-flex xs6 md6>
                <v-text-field
                  v-model="form.segmento"
                  :rules="segmentoRules"
                  :counter="1000"
                  label="Segmento"
                  required
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs5 md5>
                <v-text-field
                  v-model="form.cnpj"
                  :rules="cnpjRules"
                  :counter="20"
                  label="CNPJ"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs1 md1></v-flex>
              <v-flex xs6 md6>
                <v-text-field
                  v-model="form.email"
                  :rules="emailRules"
                  :counter="40"
                  label="E-mail"
                  required
                ></v-text-field>
              </v-flex>
            </v-layout>
            <v-textarea
              v-model="form.clientes"
              :rules="clientesRules"
              :counter="1000"
              label="Principais Clientes"
              required
            ></v-textarea>
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
        setor: "",
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
            createEmpresa(input: {empresa: {
              razaoSocial: "${this.form.razaosocial}", 
              setor: "${this.form.setor}", 
              endereco: "${this.form.endereco}", 
              email: "${this.form.email}", 
              cnpj: "${this.form.cnpj}", 
              telefone: "${this.form.telefone}", 
              clientes: "${this.form.clientes}", 
              dataFundacao: "${this.form.fundacao.toLocaleString()}", 
              segmento: "${this.form.segmento}"
            }}) {
               clientMutationId
            }
          }`,
          variables: null
        }
      }).then(ret => {
        if (ret.status == 200) {
          this.mensagem = "Registro Salvo com Sucesso";
          this.snackbar = true;
          this.$router.push({ name: "empresalist" });
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
 