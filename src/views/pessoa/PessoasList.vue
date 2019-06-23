<template>
  <v-card>
    <v-data-table
      no-data-text="Nenhum dado encontrado"
      rows-per-page-text="Linhas por Página"
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
          <td>{{ props.item.nome }}</td>
          <td>{{ props.item.email }}</td>
          <td>{{ props.item.celular }}</td>
          <td>{{ props.item.endereco }}</td>
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
          text: "Nome",
          align: "left",
          sortable: true,
          value: "nome"
        },
                {
          text: "E-mail",
          align: "left",
          sortable: true,
          value: "email"
        },
                        {
          text: "Celular",
          align: "left",
          sortable: true,
          value: "celular"
        },
                                {
          text: "Endereço",
          align: "left",
          sortable: true,
          value: "endereco"
        }
      ],
      items: [],
      pagination: {}
    };
  },
  watch: {
    pagination: function() {
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
  pessoas(first: $first, offset: $offset) {
    nodes {
            id
            nome
            email
            celular
            endereco
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
        this.items = e.data.data.pessoas.nodes;
        this.loading = false;
        this.pagination.totalItems = e.data.data.pessoa.totalCount;
      });
    }
  },
  mounted() {
    this.buscaDados();
  }
};
</script>
