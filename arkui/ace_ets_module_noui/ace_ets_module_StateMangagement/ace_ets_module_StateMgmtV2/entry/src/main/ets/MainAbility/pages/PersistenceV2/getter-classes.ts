// 在实例上定义自有 getter-only 属性（enumerable，Object.keys 可枚举）
export function definePlainGetter(obj: object, prop: string, getter: () => any): void {
    Object.defineProperty(obj, prop, {
      get: getter,
      enumerable: true,
      configurable: true,
    });
  }