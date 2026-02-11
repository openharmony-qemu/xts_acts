export const add: (a: number, b: number) => number;
export const napiCreateFunction:() => object;

export const nativeMultiply: (a: number, b: number) => number;
export const callArkTS: (func: (a: number, b: number) => number) => number;

export const getAddFunc: () => (a: number, b: number) => number;

// 创建和调用返回类型
interface CreateAndCallResult {
  func: (x: number) => number;
  result: number;
}
export const createAndCallInOneFunc: () => CreateAndCallResult;

export const callChain:(func: (a: number, b: number) => number) => number;

export const runScriptPath:(abcDefaultFunc: () => string)=> boolean;
export const callGetter:()=>boolean;
export const callSetter:()=>boolean;
export const napiDefineClass:() => object;
export const createPromiseAndResolve:() => Promise<string>;