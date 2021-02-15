<template>
  <button
    :class="{ edge: true, isFriendly, isEnemy }"
    :disabled="isFriendly || isEnemy"
    @click="onButtonClick"
  ></button>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      isFriendly: false,
      isEnemy: false,
    }
  },
  methods: {
    onButtonClick() {
      this.isFriendly = true
    },
  },
})
</script>

<style>
.edge {
  position: absolute;
  padding: 0;
  --thickness: max(10%, 10px);
}

.edge.top,
.edge.bottom {
  left: var(--thickness);
  width: calc(100% - (var(--thickness) * 2));
  height: var(--thickness);
}

.edge.left,
.edge.right {
  top: var(--thickness);
  width: var(--thickness);
  height: calc(100% - (var(--thickness) * 2));
}

.edge.top {
  top: 0;
}

.edge.bottom {
  bottom: 0;
}

.edge.left {
  left: 0;
}

.edge.right {
  right: 0;
}

.edge.isFriendly {
  background: blue;
}

.edge.isEnemy {
  background: red;
}
</style>
