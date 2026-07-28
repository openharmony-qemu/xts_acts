'use static';
export namespace TestNamespace {
  export async function namespaceAsyncFunc(): Promise<string> {
    return 'namespace-async';
  }

  export const namespaceAsyncArrowFunc: () => Promise<number> = async (): Promise<number> => {
    return 2000;
  };

  export class NamespaceTestClass {
    private _value: number = 0;

    get value(): number {
      return this._value;
    }

    set value(val: number) {
      this._value = val;
    }

    async asyncMethodAfterGetterSetter(): Promise<number> {
      return this._value + 300;
    }

    async asyncMethodBeforeGetter(): Promise<string> {
      return 'namespace-before-getter';
    }
  }

  export async function namespaceAsyncFuncMultiParams(a: number, b: string, c: boolean): Promise<string> {
    return `${a}-${b}-${c}`;
  }
}

export namespace NestedNamespace {
  export namespace InnerNamespace {
    export async function nestedAsyncFunc(): Promise<string> {
      return 'nested-async';
    }

    export class NestedTestClass {
      async nestedAsyncMethod(): Promise<number> {
        return 3000;
      }
    }
  }
}

export namespace OuterNamespace {
  export async function outerAsyncFunc(): Promise<string> {
    return 'outer-async';
  }

  export namespace MiddleNamespace {
    export async function middleAsyncFunc(): Promise<string> {
      return 'middle-async';
    }

    export class MiddleTestClass {
      async middleAsyncMethod(): Promise<string> {
        return 'middle-method';
      }
    }
  }
}
