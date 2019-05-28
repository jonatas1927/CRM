<!--> 
nome
email
celular
endereço
cargo
<-->

<template>
<div>
     <v-toolbar color="blue" light>
      <v-toolbar-side-icon></v-toolbar-side-icon>
      <v-toolbar-title>Pessoas</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon>
        <v-icon>search</v-icon>
      </v-btn>
    </v-toolbar>
    <v-form
    ref="form"
    v-model="valid"
    lazy-validation
    ></v-form>
    
    <!-- verificar esses campos -->
    <v-text-field
      v-model="nome"
      v-validate="'required|nome'"
      :error-messages="errors.collect('nome')"
      label="Nome"
      data-vv-nome="nome"
      required
    ></v-text-field>
    
    <v-text-field
      v-model="email"
      v-validate="'required|email'"
      :error-messages="errors.collect('email')"
      label="E-mail"
      data-vv-name="email"
      required
    ></v-text-field>

    <v-text-field
      v-model="endereco"
      v-validate="'required|endereco'"
      :error-messages="errors.collect('endereco')"
      label="Endereço"
      data-vv-name="email"
      required
    ></v-text-field>

    <v-select
      v-model="cargo"
      v-validate="'required'"
      :items="items"
      :error-messages="errors.collect('select')"
      label="Cargo"
      data-vv-name="cargo"
      required
    ></v-select>

</div>    
</template>
