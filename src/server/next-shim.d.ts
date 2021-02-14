// https://github.com/nuxt/nuxt.js/issues/7651#issuecomment-630558204
declare module 'nuxt' {
  export class Nuxt {
    constructor(config: any)

    public render(): Promise<void>
  }

  export class Builder {
    constructor(nuxt: Nuxt)

    public build(): Promise<void>
  }
}
