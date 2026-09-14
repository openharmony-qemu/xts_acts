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

export namespace PromiseNamespace {
  export function namespacePromiseFunc(): Promise<string> {
    return Promise.resolve<string>('namespace')
      .then((v: string): string => {
        return v + '-chain';
      });
  }

  export const namespacePromiseArrow: () => Promise<number> = (): Promise<number> => {
    return Promise.resolve<number>(100)
      .then((v: number): number => {
        return v / 2;
      });
  };

  export class NamespacePromiseClass {
    private _value: number = 0;

    get value(): number {
      return this._value;
    }

    set value(val: number) {
      this._value = val;
    }

    namespacePromiseMethod(): Promise<string> {
      return Promise.resolve<string>('namespace-class')
        .then((v: string): string => {
          return v + '-method';
        });
    }
  }

  export namespace InnerPromiseNamespace {
    export function innerNamespacePromiseFunc(): Promise<string> {
      return Promise.resolve<string>('inner-namespace')
        .then((v: string): string => {
          return v + '-inner';
        });
    }

    export class InnerNamespacePromiseClass {
      innerNamespacePromiseMethod(): Promise<number> {
        return Promise.resolve<number>(50)
          .then((v: number): number => {
            return v + 50;
          });
      }
    }
  }
}
