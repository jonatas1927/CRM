<template>
  <v-card>
    <v-form v-model="valid">
      <v-container>
        <v-layout>
          <v-flex xs12 md12>
            <!-- <v-text-field v-model="id" :rules="idRules" :counter="1000" label="ID do Lead" required></v-text-field> -->
            <v-text-field v-model="form.obs" :counter="1000" label="Observação" required></v-text-field>
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
              <v-flex xs12 md12>
            <v-autocomplete
              v-model="form.statusLead_id"
              :items="statusLead"
              :label="`Status`"
              item-text="descricao"
              item-value="id"
          />
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
      form:{
        obs:``,
        pessoa_id:``,
        statusLead_id:``
      },
       pessoas: [],
       statusLead:[]
      // idRules: [v => !!v || "É necessário informar um ID"]
    };
  },
  methods: {
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
       buscarStatus: function() {
      const quer = `
{
  statusLeads {
    nodes {
      descricao
      id
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
        this.statusLead = ret.data.data.statusLeads.nodes;
      });
    },
    salvar: function() {
      Request({
        data: {
          query: `
mutation {
  createLead(input: {lead: {obs: "${this.form.obs}", idStatusLead: "${this.form.statusLead_id}", idPessoa: "${this.form.pessoa_id}"}})
}

`,
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
  mounted() {
    this.buscarPessoas();
    this.buscarStatus(); 
  }
};
</script>
 