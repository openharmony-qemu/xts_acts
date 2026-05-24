'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

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

export interface LooseClassStatic {
  of(a?: Object, b?: Object): Object;
}

class LooseClassStaticAdapter implements LooseClassStatic {
  of(a?: Object, b?: Object): Object {
    if (b !== undefined) {
      throw new Error('Class.of expects 1 argument');
    }
    return Class.of(a!);
  }
}

export function looseClassOf(): LooseClassStatic {
  return new LooseClassStaticAdapter();
}

