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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import * as hello from '../ets/Index';

export default function asyncReverseTest(): void {
  describe("ActsAsyncReverseTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0007
     * @tc.name      test_AsyncTypes_Static_0007
     * @tc.desc      ProcessUserTypeReturnsPromise should return "C++AsyncProcessed-EtsAsyncProcessed-C++SyncProcessed-InitialValue"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0007 start');
      let user: hello.UserTypeImpl = new hello.UserTypeImpl();
      let res: string = await hello.processUserTypeReturnsPromise(user, (500).toLong(), (500).toLong(), "InitialValue");
      expect(res).assertEqual("C++AsyncProcessed-EtsAsyncProcessed-C++SyncProcessed-InitialValue");
      console.log('test_AsyncTypes_Static_0007 done');
      done();
      console.log('test_AsyncTypes_Static_0007 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0008
     * @tc.name      test_AsyncTypes_Static_0008
     * @tc.desc      ProcessUserTypeWithCallback should return "C++AsyncProcessed-EtsAsyncProcessed-C++SyncProcessed-InitialValue"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0008 start');
      let user: hello.UserTypeImpl = new hello.UserTypeImpl();
      let res: string = await new Promise<string>((resolve, reject): void => {
        hello.processUserTypeWithCallback(user, (500).toLong(), (500).toLong(), "InitialValue",
          (error: BusinessError | null, data?: string | undefined): void => {
            if (error !== null && error.code !== 0) {
              reject(error as Error);
            } else {
              resolve(data!);
            }
          });
      });
      expect(res).assertEqual("C++AsyncProcessed-EtsAsyncProcessed-C++SyncProcessed-InitialValue");
      console.log('test_AsyncTypes_Static_0008 done');
      done();
      console.log('test_AsyncTypes_Static_0008 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0009
     * @tc.name      test_AsyncTypes_Static_0009
     * @tc.desc      ProcessUserTypeReturnsPromise with sync error in fooReturnsPromise should reject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0009 start');
      let user: hello.SyncErrorUserTypeImpl = new hello.SyncErrorUserTypeImpl();
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        await hello.processUserTypeReturnsPromise(user, (500).toLong(), (500).toLong(), "InitialValue");
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("Synchronous error in fooReturnsPromise");
      console.log('test_AsyncTypes_Static_0009 done');
      done();
      console.log('test_AsyncTypes_Static_0009 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0010
     * @tc.name      test_AsyncTypes_Static_0010
     * @tc.desc      ProcessUserTypeWithCallback with sync error in fooWithCallback should reject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0010 start');
      let user: hello.SyncErrorUserTypeImpl = new hello.SyncErrorUserTypeImpl();
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        await new Promise<string>((resolve, reject): void => {
          hello.processUserTypeWithCallback(user, (500).toLong(), (500).toLong(), "InitialValue",
            (error: BusinessError | null, data?: string | undefined): void => {
              if (error !== null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data!);
              }
            });
        });
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("Synchronous error in fooWithCallback");
      console.log('test_AsyncTypes_Static_0010 done');
      done();
      console.log('test_AsyncTypes_Static_0010 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0011
     * @tc.name      test_AsyncTypes_Static_0011
     * @tc.desc      ProcessUserTypeReturnsPromise with async error in fooReturnsPromise should reject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0011 start');
      let user: hello.AsyncErrorUserTypeImpl = new hello.AsyncErrorUserTypeImpl();
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        await hello.processUserTypeReturnsPromise(user, (500).toLong(), (500).toLong(), "InitialValue");
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("Asynchronous error in fooReturnsPromise");
      console.log('test_AsyncTypes_Static_0011 done');
      done();
      console.log('test_AsyncTypes_Static_0011 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0012
     * @tc.name      test_AsyncTypes_Static_0012
     * @tc.desc      ProcessUserTypeWithCallback with async error in fooWithCallback should reject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0012 start');
      let user: hello.AsyncErrorUserTypeImpl = new hello.AsyncErrorUserTypeImpl();
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        await new Promise<string>((resolve, reject): void => {
          hello.processUserTypeWithCallback(user, (500).toLong(), (500).toLong(), "InitialValue",
            (error: BusinessError | null, data?: string | undefined): void => {
              if (error !== null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data!);
              }
            });
        });
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("Asynchronous error in fooWithCallback");
      console.log('test_AsyncTypes_Static_0012 done');
      done();
      console.log('test_AsyncTypes_Static_0012 end');
    });
  })
}
