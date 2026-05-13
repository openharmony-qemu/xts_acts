export function wrapVoidFn(fn: () => (void | undefined)): () => void {
  return (): void => {
    fn();
  };
}

export interface LooseReflect {
  createInstance(a?: Object, b?: Object, c?: Object, d?: Object, e?: Object): Object;
  getInstanceField(a?: Object, b?: Object, c?: Object, d?: Object): Object;
  getInstanceFields(a?: Object, b?: Object): Object;
  getInstanceMethod(a?: Object, b?: Object, c?: Object, d?: Object, e?: Object, f?: Object): Object;
  getStaticField(a?: Object, b?: Object, c?: Object, d?: Object): Object;
  getStaticFields(a?: Object, b?: Object): Object;
  getStaticMethod(a?: Object, b?: Object, c?: Object, d?: Object, e?: Object, f?: Object): Object;
  getName(a?: Object, b?: Object): Object;
  initialize(a?: Object, b?: Object): void;
}

export function looseReflect(obj: Object): LooseReflect {
  return obj as LooseReflect;
}

export interface LooseConstructor {
  equals(a?: Object | null, b?: Object, c?: Object): boolean;
  getParameterType(a?: Object, b?: Object, c?: Object): Object;
  getParameterTypes(a?: Object, b?: Object, c?: Object, d?: Object, e?: Object, f?: Object): Object;
}

export function looseConstructor(obj: Object): LooseConstructor {
  return obj as LooseConstructor;
}
