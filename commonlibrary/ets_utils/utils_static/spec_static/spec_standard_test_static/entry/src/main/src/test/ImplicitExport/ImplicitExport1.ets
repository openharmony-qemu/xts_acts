'use static'
export class Base {
    id: int = 0
    value:int = 0
}

export class Derived extends Base {
    getValue():int{
      return this.value
  }
}