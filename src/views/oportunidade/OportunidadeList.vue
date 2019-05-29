<template>
  <v-card>
    asdsadsadas
    <v-card-title v-model="selected" title="Oportunidades">
      <v-text-field
        v-model="pesqDescricao"
        append-icon="search"
        label="Descricao"
        single-line
        hide-details
      />
      <v-spacer/>
      <router-link to="/cargoform">
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
export default {
  data: function() {
    return {
      selected: [],
      pesqDescricao: "",
      pagination: {},
      headers: [
        {
          text: "Importancia",
          align: "left",
          sortable: true,
          value: "importancia"
        },
        {
          text: "Observação",
          align: "left",
          sortable: true,
          value: "obs"
        },
        {
          text: "Valor",
          align: "left",
          sortable: true,
          value: "valor"
        },
        {
          text: "Data Inicio",
          align: "left",
          sortable: true,
          value: "dataInicio"
        },
        {
          text: "data Conclusão",
          align: "left",
          sortable: true,
          value: "dataConclusao"
        },
        {
          text: "Pessoa",
          align: "left",
          sortable: true,
          value: "pessoa"
        }
      ]
    };
  }
};
</script>
