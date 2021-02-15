<template>
  <div>
    <h1>Hello world!</h1>
    <div class="square">
      <Edge class="left" />
      <Edge class="top" />
      <Edge class="bottom" />
      <Edge class="right" />
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({})
</script>

<style>
.square {
  position: relative;
  width: 60px;
  height: 60px;
}
</style>
