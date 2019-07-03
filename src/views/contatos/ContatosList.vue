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
      <router-link to="/contatosForm">
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
          <td>{{ props.item.cargo }}</td>
          <td>{{ props.item.classificacao }}</td>
          <td>{{ props.item.cnpjcpf }}</td>
          <td>{{ props.item.email }}</td>
          <td>{{ props.item.endereco }}</td>
          <td>{{ props.item.genero }}</td>
          <td>{{ props.item.idEmpresa }}</td>
          <td>{{ props.item.nome }}</td>
          <td>{{ props.item.obs }}</td>
          <td>{{ props.item.principal }}</td>
          <td>{{ props.item.redesSociais }}</td>
          <td>{{ props.item.status }}</td>
          <td>{{ props.item.telefone }}</td>
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
          text: "id",
          align: "left",
          sortable: true,
          value: "id"
        },
        {
          text: "cargo",
          align: "left",
          sortable: true,
          value: "cargo"
        },
        {
          text: "classificacao",
          align: "left",
          sortable: true,
          value: "classificacao"
        },
        {
          text: "cnpjcpf",
          align: "left",
          sortable: true,
          value: "cnpjcpf"
        },
        {
          text: "email",
          align: "left",
          sortable: true,
          value: "email"
        },
        {
          text: "endereco",
          align: "left",
          sortable: true,
          value: "endereco"
        },
        {
          text: "genero",
          align: "left",
          sortable: true,
          value: "genero"
        },
        {
          text: "idEmpresa",
          align: "left",
          sortable: true,
          value: "idEmpresa"
        },
        {
          text: "nome",
          align: "left",
          sortable: true,
          value: "nome"
        },
        {
          text: "obs",
          align: "left",
          sortable: true,
          value: "obs"
        },
        {
          text: "principal",
          align: "left",
          sortable: true,
          value: "principal"
        },
        {
          text: "redesSociais",
          align: "left",
          sortable: true,
          value: "redesSociais"
        },
        {
          text: "status",
          align: "left",
          sortable: true,
          value: "status"
        },
        {
          text: "telefone",
          align: "left",
          sortable: true,
          value: "telefone"
        }
      ],
      items: [],
      pagination: {}
    };
  },
  methods: {
    toggleAll() {},
    changeSort() {},
    buscaDados() {
      Request({
        url: "http://localhost:3000/graphql",
        data: {
          query: `
query($first:Int, $offset:Int){
  contatoes(first: $first, offset: $offset) {
    nodes {
      cargo
      classificacao
      cnpjcpf
      email
      endereco
      genero
      id
      idEmpresa
      nome
      obs
      principal
      redesSociais
      status
      telefone
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
        this.items = e.data.data.contatoes.nodes;
        this.loading = false;
        this.pagination.totalItems = e.data.data.contatoes.totalCount;
      });
    }
  },
  mounted() {
    this.buscaDados();
  }
};
</script>
