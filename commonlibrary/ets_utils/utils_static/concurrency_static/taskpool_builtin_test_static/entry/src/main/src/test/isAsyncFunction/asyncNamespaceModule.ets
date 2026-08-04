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

export namespace AsyncNamespace {
  export async function namespaceAsyncFunc(): Promise<number> {
    return 42;
  }

  export const namespaceAsyncArrow: () => Promise<string> = async (): Promise<string> => {
    return 'namespace';
  };

  export class NamespaceAsyncClass {
    private _value: number = 0;

    get value(): number {
      return this._value;
    }

    set value(val: number) {
      this._value = val;
    }

    async namespaceAsyncMethod(): Promise<number> {
      return this._value * 2;
    }
  }

  export namespace InnerNamespace {
    export async function innerNamespaceAsyncFunc(): Promise<string> {
      return 'inner namespace';
    }

    export class InnerNamespaceClass {
      get id(): number {
        return 0;
      }

      async innerNamespaceAsyncMethod(): Promise<number> {
        return 100;
      }
    }
  }
}
