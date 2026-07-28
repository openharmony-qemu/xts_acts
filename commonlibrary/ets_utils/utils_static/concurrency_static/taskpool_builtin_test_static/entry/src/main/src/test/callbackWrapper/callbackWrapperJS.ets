'use static';
export async function jsAsyncFunc(): Promise<string> {
  return 'js-async';
}

export const jsAsyncArrowFunc: () => Promise<number> = async (): Promise<number> => {
  return 789;
};

export interface JsReturnObject {
  name: string;
  value: number;
}

export class JsTestClass {
  private _value: number = 0;

  constructor() {
    this._value = 0;
  }

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetterSetter(): Promise<number> {
    return this._value * 5;
  }

  async asyncMethodBeforeGetter(): Promise<string> {
    return 'before-getter-js';
  }

  static async staticAsyncMethod(): Promise<string> {
    return 'js-static-async';
  }
}

export async function jsAsyncFuncMultiParams(a: number, b: string, c: boolean): Promise<string> {
  return `${a}-${b}-${c}`;
}

export async function jsAsyncFuncReturnObject(): Promise<JsReturnObject> {
  const result: JsReturnObject = { name: 'js-object', value: 456 };
  return result;
}

export class JsTestClassComplex {
  private _data: string = 'data';
  private _count: number = 0;

  constructor() {
    this._data = 'data';
    this._count = 0;
  }

  get data(): string {
    return this._data;
  }

  set data(val: string) {
    this._data = val;
  }

  async asyncMethod1(): Promise<string> {
    return this._data;
  }

  get count(): number {
    return this._count;
  }

  set count(val: number) {
    this._count = val;
  }

  async asyncMethod2(): Promise<number> {
    return this._count;
  }
}
