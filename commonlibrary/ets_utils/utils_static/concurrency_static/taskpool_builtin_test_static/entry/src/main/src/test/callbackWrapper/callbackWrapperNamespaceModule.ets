'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
