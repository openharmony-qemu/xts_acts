'use static';
export async function tsAsyncFunc(): Promise<string> {
  return 'ts-async';
}

export let tsAsyncArrowFunc: () => Promise<number> = async (): Promise<number> => {
  return 456;
};

export interface TsReturnObject {
  name: string;
  value: number;
}

export class TsTestClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetterSetter(): Promise<number> {
    return this._value * 10;
  }

  async asyncMethodBeforeGetter(): Promise<string> {
    return 'before-getter-ts';
  }

  static async staticAsyncMethod(): Promise<string> {
    return 'ts-static-async';
  }
}

export async function tsAsyncFuncMultiParams(a: number, b: string, c: boolean): Promise<string> {
  return `${a}-${b}-${c}`;
}

export async function tsAsyncFuncReturnObject(): Promise<TsReturnObject> {
  const result: TsReturnObject = { name: 'ts-object', value: 123 };
  return result;
}

export class TsTestClassComplex {
  private _data: string = 'data';
  private _count: number = 0;

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
