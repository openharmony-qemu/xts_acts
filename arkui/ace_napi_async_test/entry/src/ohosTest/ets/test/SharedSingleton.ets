/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { collections, lang, ArkTSUtils } from '@kit.ArkTS';

export class SharedSingleton {
  private static instance: SharedSingleton | null = null;
  private static lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  private nativeObj: lang.ISendable | null = null;
  private sendableArray: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
  private sendableMap: collections.Map<string, lang.ISendable> = new collections.Map<string, lang.ISendable>();
  private sendableSet: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
  private counter: number = 0;

  private constructor() {
    console.info('SharedSingleton constructor called');
  }

  public static getInstance(): SharedSingleton {
    if (SharedSingleton.instance === null) {
      SharedSingleton.instance = new SharedSingleton();
    }
    return SharedSingleton.instance;
  }

  public setNativeObject(obj: lang.ISendable): void {
    this.nativeObj = obj;
  }

  public getNativeObject(): lang.ISendable | null {
    return this.nativeObj;
  }

  public getArray(): collections.Array<lang.ISendable> {
    return this.sendableArray;
  }

  public getMap(): collections.Map<string, lang.ISendable> {
    return this.sendableMap;
  }

  public getSet(): collections.Set<lang.ISendable> {
    return this.sendableSet;
  }

  public async incrementCounter(): Promise<number> {
    return await SharedSingleton.lock.lockAsync((): number => {
      this.counter++;
      return this.counter;
    });
  }

  public getCounter(): number {
    return this.counter;
  }

  public reset(): void {
    this.nativeObj = null;
    this.sendableArray = new collections.Array<lang.ISendable>();
    this.sendableMap = new collections.Map<string, lang.ISendable>();
    this.sendableSet = new collections.Set<lang.ISendable>();
    this.counter = 0;
  }
}