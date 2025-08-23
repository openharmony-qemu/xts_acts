class Student {
  private age: int;
  private name: string;

  constructor(age: int, name: string) {
    this.age = age;
    this.name = name;
  }

  test(): string {
    return this.name;
  }
}

class Worker {
  private _age: int;
  private _name: string;

  constructor(age: int, name: string) {
    this._age = age;
    this._name = name;
  }

  get age(): int {
    return this._age;
  }

  set age(value: int) {
    this._age = value;
  }

  get name(): string {
    return this._name;
  }

  set name(value: string) {
    this._name = value;
  }
}

function getArray(): string[] {
  let a: string[] = ['Leechy', 'Rocket', 'Bird', 'hello', 'world'];
  return a;
}

function getNumericArray(): int[] {
  let a: int[] = [1, 2, 3, 4, 5];
  return a;
}