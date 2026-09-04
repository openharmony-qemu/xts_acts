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

export namespace CallbackNamespace {
  export function namespaceCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'namespace-callback');
    }, 100);
  }

  export class NamespaceCallbackClass {
    public value: int = 0;

    public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
      setTimeout(() => {
        callback(null, this.value * 3);
      }, 100);
    }
  }

  export namespace NestedNamespace {
    export function nestedCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
      setTimeout(() => {
        callback(null, 'nested-namespace-callback');
      }, 100);
    }
  }

  export function exportedNamespaceCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'exported-namespace-callback');
    }, 100);
  }
}
