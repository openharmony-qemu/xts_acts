// 在实例上定义自有 getter-only 属性（enumerable，Object.keys 可枚举）
export function definePlainGetter<T>(obj: object, prop: string, getter: () => T): void {
  Object.defineProperty(obj, prop, {
    get: getter,
    enumerable: true,
    configurable: true,
  });
}

export function getValue(obj: object): number {
  return (obj as Record<string, number>)['value'];
}
