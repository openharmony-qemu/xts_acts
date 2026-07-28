'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export interface ICallbackInterface {
  callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void;
}

export class InterfaceCallbackImpl implements ICallbackInterface {
  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'interface-implementation');
    }, 100);
  }
}

export abstract class AbstractCallbackClass {
  public abstract callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void;

  public concreteMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'abstract-concrete');
    }, 100);
  }
}

export class ConcreteCallbackImpl extends AbstractCallbackClass {
  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'concrete-implementation');
    }, 100);
  }
}
