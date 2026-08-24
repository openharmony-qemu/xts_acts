'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {BusinessError} from "@ohos.base";
import * as hello from "./hello";

export * from "./hello";

export class SyncBoolUserTypeImpl implements hello.SyncOrAsyncUserType {
  baz(): hello.syncOrAsyncBool {
    return true;
  }
}

export class AsyncBoolUserTypeImpl implements hello.SyncOrAsyncUserType {
  baz(): hello.syncOrAsyncBool {
    return new Promise<boolean>((resolve, reject): void => {
      setTimeout(() => {
        resolve(false);
      }, 100);
    });
  }
}

export class UserTypeImpl implements hello.UserType {
  fooWithCallback(ms: long, result: string,
    set: (error: BusinessError | null, data: string | undefined) => void): void {
    setTimeout(() => {
      set(null, "EtsAsyncProcessed-" + result);
    }, ms.toInt());
  }
  fooReturnsPromise(ms: long, result: string): Promise<string> {
    return new Promise<string>((resolve, reject): void => {
      setTimeout(() => {
        resolve("EtsAsyncProcessed-" + result);
      }, ms.toInt());
    });
  }
}

export class SyncErrorUserTypeImpl implements hello.UserType {
  fooWithCallback(ms: long, result: string,
    set: (error: BusinessError | null, data: string | undefined) => void): void {
    throw new BusinessError(1, "Synchronous error in fooWithCallback");
  }
  fooReturnsPromise(ms: long, result: string): Promise<string> {
    throw new BusinessError(1, "Synchronous error in fooReturnsPromise");
  }
}

export class AsyncErrorUserTypeImpl implements hello.UserType {
  fooWithCallback(ms: long, result: string,
    set: (error: BusinessError | null, data: string | undefined) => void): void {
    setTimeout(() => {
      set(new BusinessError(1, "Asynchronous error in fooWithCallback"), undefined);
    }, ms.toInt());
  }
  fooReturnsPromise(ms: long, result: string): Promise<string> {
    return new Promise<string>((resolve, reject): void => {
      setTimeout(() => {
        reject(new BusinessError(1, "Asynchronous error in fooReturnsPromise"));
      }, ms.toInt());
    });
  }
}

export class VoidAsyncUserTypeImpl implements hello.VoidAsyncUserType {
  barWithCallback(set: (error: BusinessError | null, data: void | undefined) => void): void {
    setTimeout(() => {
      set(null, undefined);
    }, 100);
  }
  barReturnsPromise(): Promise<void> {
    return new Promise<void>((resolve, reject): void => {
      setTimeout(() => {
        resolve(undefined);
      }, 100);
    });
  }
}
