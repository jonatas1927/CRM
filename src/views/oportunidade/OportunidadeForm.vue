<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout row>
          <v-flex xs12 md12>
            <v-text-field
              v-model="form.descricao"
              :rules="descricaoRules"
              :counter="1000"
              label="Descrição"
              required
            ></v-text-field>
          </v-flex>
          <v-flex xs12 md12>
            <v-text-field v-model="form.nome" :counter="1000" label="Nome" required></v-text-field>
          </v-flex>
          <v-flex xs12 md12>
            <v-autocomplete
              v-model="form.pessoa_id"
              :items="pessoas"
              :label="`Pessoa`"
              item-text="nome"
              item-value="id"
            />
          </v-flex>
        </v-layout>
        <v-layout row>
          <v-flex xs12>
            <v-textarea name="input-7-1" label="Observação" v-model="form.obs"></v-textarea>
          </v-flex>
        </v-layout>
        <v-layout row>
          <v-flex>
            <v-menu
              v-model="dataInicioCalendar"
              :close-on-content-click="false"
              :nudge-right="40"
              lazy
              transition="scale-transition"
              offset-y
              full-width
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                  v-model="form.dataInicio"
                  label="Data de Inicio"
                  prepend-icon="event"
                  readonly
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker lang="pt-br" v-model="form.dataInicio"></v-date-picker>
            </v-menu>
          </v-flex>
          <v-flex>
            <v-menu
              v-model="dataConclusaoCalendar"
              :close-on-content-click="false"
              :nudge-right="40"
              lazy
              transition="scale-transition"
              offset-y
              full-width
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                  v-model="form.dataConclusao"
                  label="Data de Conclusão"
                  prepend-icon="event"
                  readonly
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker lang="pt-br" v-model="form.dataConclusao"></v-date-picker>
            </v-menu>
          </v-flex>
          <v-flex>
            <v-slider label="Importancia" min="0" max="5" v-model="form.importancia"></v-slider>
          </v-flex>
          <v-flex>
            <v-text-field v-model="form.valor" label="valor"></v-text-field>
          </v-flex>
        </v-layout>
        <v-layout row>
          <v-flex>
            <v-btn color="success" @submit="salvar" @click="salvar">Salvar</v-btn>
          </v-flex>
        </v-layout>
      </v-container>
    </v-form>
  </v-card>
</template>
<script>
import { Request } from "../../services/Request";
export default {
  data() {
    return {
      form: {
        descricao: "",
        pessoa_id: "",
        nome: "",
        importancia: 0,
        obs: "",
        valor: 0,
        dataConclusao: "",
        dataInicio: "",
        id_empresa: "",
        id_statusOportunidade: "",
        id_lead: ""
      },
      dataInicioCalendar: false,
      dataConclusaoCalendar: false,
      valid: false,
      descricaoRules: [v => !!v || "Descrição é Obrigatória"],
      pessoas: []
    };
  },
  methods: {
    salvar: function() {
      Request({
        data: {
          query: `mutation {
  createProduto(input: {produto: {
    descricao: "${this.descricao}"
    nome: "${this.nome}"
    valorBase: "${this.valorBase}"

    
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
          this.$router.push({ name: "produto" });
        } else {
          this.mensagem = "Houve um erro ao salvar o registro";
          this.snackbar = true;
        }
      });
    },
    buscarPessoas: function() {
      const quer = `
      {
  pessoas{
    nodes{
      id
      nome
    }
  }
}
      `;
      Request({
        data: {
          query: quer,
          variables: null
        }
      }).then(ret => {
        this.pessoas = ret.data.data.pessoas.nodes;
      });
    },
    salvar: function(){
let query = `
mutation{
  createOportunidade(input:{oportunidade:{
    idPessoa:${this.form.pessoa_id},
    importancia:${this.form.importancia},
    obs:${this.form.obs},
    valor:${this.form.valor},
    dataConclusao:${this.form.dataConclusao.toLocaleSting()},
    dataInicio:${this.form.dataInicio.toLocaleString()},
    idEmpresa:${this.form.id_empresa},
    idStatusOportunidade:${this.form.id_statusOportunidade},
    idLead:${this.form.id_lead}
  }}){
    oportunidade{
      nodeId
    }
  }
}
`
  Request({
        data: {
          query: query,
          variables: null
        }
      }).then(ret => {
        if (ret.status == 200) {
          this.mensagem = "Registro Salvo com Sucesso";
          this.snackbar = true;
          this.$router.push({ name: "Oportunidadelist" });
        } else {
          this.mensagem = "Houve um erro ao salvar o registro";
          this.snackbar = true;
        }
      });
    }
  },
  mounted() {
    this.buscarPessoas();
  }
};
</script>
 