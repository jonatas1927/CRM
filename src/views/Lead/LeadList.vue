<template>
  <v-card>
    <v-card-title>
      <v-text-field
        v-model="pesqDescricao"
        append-icon="search"
        label="Descricao"
        single-line
        hide-details
      ></v-text-field>
      <v-spacer></v-spacer>
      <router-link to='/leadform'>
        <v-btn color="primary" fab small dark title="Adicionar" @click="buscaDados()">
          <v-icon>add</v-icon>
        </v-btn>
      </router-link>
    </v-card-title>

    <v-data-table
      no-data-text="Nenhum dado encontrado"
      rows-per-page-text="Linhas por Pagina"
      :search="pesqDescricao"
      v-model="selected"
      :headers="headers"
      :items="items"
      :pagination.sync="pagination"
      select-all
      item-key="id"
      class="elevation-1"
      virtual-rows
    >
      <template v-slot:items="props">
        <tr :active="props.selected" @click="props.selected = !props.selected">
          <td>
            <v-checkbox :input-value="props.selected" primary hide-details></v-checkbox>
          </td>
          <td>{{ props.item.id }}</td>
          <td>{{ props.item.descricao }}</td>
        </tr>
      </template>
    </v-data-table>
  </v-card>
</template>

<script>
import { Request } from "../../services/Request";
export default {
  data: function() {
    return {
      pesqDescricao: "",
      selected: [],
      loading: true,
      headers: [
        {
          text: "Id",
          align: "left",
          sortable: true,
          value: "id",
          hidden: true
        },
        {
          text: "Observacao",
          align: "left",
          sortable: true,
          value: "obs"
        }
      ],
      items: [],
      pagination: {}
    };
  },
  watch:{ 
    pagination: function (){
      this.buscaDados();
    }
  },
  methods: {
    toggleAll() {},
    changeSort() {},
    buscaDados() {
      Request({
        data: {
          query: `
query($first:Int, $offset:Int){
  leads (first: $first, offset: $offset) {
    nodes {
     id
     obs
    }
    totalCount
  }
}
`,
          variables: `{
  "first": ${this.pagination.rowsPerPage},
  "offset": ${this.pagination.rowsPerPage * (this.pagination.page - 1)}
}`
        }
      }).then(e => {
        this.items = e.data.data.leads.nodes;
        this.loading = false;
        this.pagination.totalItems = e.data.data.leads.totalCount;
      });
    }
  },
  mounted() {
    this.buscaDados();
  }
};
</script>
<style >

</style>