export async function jsAsyncFunc() {
  return 'js-async';
}

export const jsAsyncArrowFunc = async () => {
  return 789;
};

export async function* jsAsyncGeneratorFunc() {
  yield 'js-gen-1';
  yield 'js-gen-2';
  yield 'js-gen-3';
}

export class JsTestClass {
  constructor() {
    this._value = 0;
  }
  
  get value() {
    return this._value;
  }
  
  set value(val) {
    this._value = val;
  }
  
  async asyncMethodAfterGetterSetter() {
    return this._value * 5;
  }
  
  async asyncMethodBeforeGetter() {
    return 'before-getter-js';
  }
  
  static async staticAsyncMethod() {
    return 'js-static-async';
  }
}

export async function jsAsyncFuncMultiParams(a, b, c) {
  return `${a}-${b}-${c}`;
}

export async function jsAsyncFuncReturnObject() {
  return { name: 'js-object', value: 456 };
}

export class JsTestClassComplex {
  constructor() {
    this._data = 'data';
    this._count = 0;
  }
  
  get data() {
    return this._data;
  }
  
  set data(val) {
    this._data = val;
  }
  
  async asyncMethod1() {
    return this._data;
  }
  
  get count() {
    return this._count;
  }
  
  set count(val) {
    this._count = val;
  }
  
  async asyncMethod2() {
    return this._count;
  }
}