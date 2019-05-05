<template>
  <v-data-table :pagination.sync="pagination" :loading="loading" :headers="headers" :items="items" class="elevation-1">
    <template v-slot:items="item">
      <td class="text-xs-left">{{ item.item.id || "id" }}</td>
      <td class="text-xs-left">{{ item.item.descricao }}</td>
    </template>
  </v-data-table>
</template>
<script>
import { Request } from "../../services/Request";
export default {
  data: function() {
    return {
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
          text: "Descrição",
          align: "left",
          sortable: true,
          value: "descricao"
        }
      ],
      items: [],
      pagination:{}
    };
  },
  mounted() {
    Request({
      url: "http://localhost:3000/graphql",
      data: {
        query: `{
  cargos {
    totalCount
    nodes {
      descricao
      id
    }
  }
}
`
      }
    }).then(e => {
      this.items = e.data.data.cargos.nodes;
      this.loading = false;
    });
  }
};
</script>
