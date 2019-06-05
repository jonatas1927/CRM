<template>
  <v-card>
    <v-card-title>
      <v-text-field
        v-model="pesqRazaoSocial"
        append-icon="search"
        label="Razão Social"
        single-line
        hide-details
      ></v-text-field>
      <v-spacer></v-spacer>
      <router-link to='/empresaform'>
        <v-btn color="primary" fab small dark title="Adicionar" @click="buscaDados()">
          <v-icon>add</v-icon>
        </v-btn>
      </router-link>
    </v-card-title>

    <v-data-table
      no-data-text="Nenhum dado encontrado"
      rows-per-page-text="Linhas por Página"
      :search="pesqRazaoSocial"
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
          <td>{{ props.item.razaoSocial }}</td>
          <td>{{ props.item.setor }}</td>
          <td>{{ props.item.endereco }}</td>
          <td>{{ props.item.email }}</td>
          <td>{{ props.item.cnpj }}</td>
          <td>{{ props.item.clientes }}</td>
          <td>{{ props.item.telefone }}</td>
          <td>{{ props.item.dataFundacao }}</td>
          <td>{{ props.item.segmento }}</td>
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
          text: "Razão Social",
          align: "left",
          sortable: true,
          value: "razaoSocial"
        },
        {
          text: "Setor",
          align: "left",
          sortable: true,
          value: "setor"
        },
        {
          text: "Endereço",
          align: "left",
          sortable: true,
          value: "endereco"
        },
        {
          text: "E-mail",
          align: "left",
          sortable: true,
          value: "email"
        },
        {
          text: "CNPJ",
          align: "left",
          sortable: true,
          value: "cnpj"
        },
        {
          text: "Clientes",
          align: "left",
          sortable: true,
          value: "clientes"
        },
        {
          text: "Telefone",
          align: "left",
          sortable: true,
          value: "telefone"
        },
        {
          text: "Data Fundação",
          align: "left",
          sortable: true,
          value: "dataFundacao"
        },
        {
          text: "Segmento",
          align: "left",
          sortable: true,
          value: "segmento"
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
query ($first: Int, $offset: Int) {
  empresas(first: $first, offset: $offset) {
    nodes {
      id
      razaoSocial
      setor
      endereco
      email
      cnpj
      clientes
      telefone
      dataFundacao
      segmento
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
        this.items = e.data.data.empresas.nodes;
        this.loading = false;
        this.pagination.totalItems = e.data.data.empresas.totalCount;
      });
    }
  },
  mounted() {
    this.buscaDados();
  }
};
</script>
