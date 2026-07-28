'use static';
export interface AsyncInterface {
  asyncMethod(): Promise<string>;
  asyncMethodWithParam(param: number): Promise<number>;
}

export class InterfaceImplementClass implements AsyncInterface {
  async asyncMethod(): Promise<string> {
    return 'interface-implemented';
  }

  async asyncMethodWithParam(param: number): Promise<number> {
    return param * 10;
  }
}

export abstract class AbstractTestClass {
  abstract asyncMethod(): Promise<string>;

  async concreteAsyncMethod(): Promise<number> {
    return 100;
  }

  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }
}

export class AbstractDerivedClass extends AbstractTestClass {
  async asyncMethod(): Promise<string> {
    return 'abstract-derived';
  }

  async asyncMethodAfterGetterSetter(): Promise<number> {
    return this.value + 50;
  }
}

export interface AsyncMethodInterface {
  getValue(): Promise<number>;
  setValue(val: number): Promise<void>;
}

export class DualInterfaceClass implements AsyncInterface, AsyncMethodInterface {
  async asyncMethod(): Promise<string> {
    return 'dual-interface';
  }

  async asyncMethodWithParam(param: number): Promise<number> {
    return param + 100;
  }

  async getValue(): Promise<number> {
    return 200;
  }

  async setValue(val: number): Promise<void> {
    return;
  }
}
