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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import * as hello from '../ets/Index';

export default function asyncBasicTest(): void {
  describe("ActsAsyncBasicTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0001
     * @tc.name      test_AsyncTypes_Static_0001
     * @tc.desc      futureResultReturnsPromise should return "C++AsyncProcessed-InitialValue"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0001 start');
      let res: string = await hello.futureResultReturnsPromise((1000).toLong(), "InitialValue");
      expect(res).assertEqual("C++AsyncProcessed-InitialValue");
      console.log('test_AsyncTypes_Static_0001 done');
      done();
      console.log('test_AsyncTypes_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0002
     * @tc.name      test_AsyncTypes_Static_0002
     * @tc.desc      futureResultWithCallback should return "C++AsyncProcessed-InitialValue"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0002 start');
      let res: string = await new Promise<string>((resolve, reject): void => {
        hello.futureResultWithCallback((1000).toLong(), "InitialValue",
          (error: BusinessError | null, data?: string | undefined): void => {
            if (error != null) {
              reject(error as Error);
            } else {
              resolve(data!);
            }
          });
      });
      expect(res).assertEqual("C++AsyncProcessed-InitialValue");
      console.log('test_AsyncTypes_Static_0002 done');
      done();
      console.log('test_AsyncTypes_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0003
     * @tc.name      test_AsyncTypes_Static_0003
     * @tc.desc      futureResultReturnsPromise with ms=-1 should throw sync error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0003 start');
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        hello.futureResultReturnsPromise((-1).toLong(), "InitialValue");
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("ms cannot be negative");
      console.log('test_AsyncTypes_Static_0003 done');
      done();
      console.log('test_AsyncTypes_Static_0003 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0004
     * @tc.name      test_AsyncTypes_Static_0004
     * @tc.desc      futureResultWithCallback with ms=-1 should throw sync error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0004 start');
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        hello.futureResultWithCallback((-1).toLong(), "InitialValue",
          (error: BusinessError | null, data?: string | undefined): void => {
            if (error != null) {
              errMsg = error.message;
            }
          });
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("ms cannot be negative");
      console.log('test_AsyncTypes_Static_0004 done');
      done();
      console.log('test_AsyncTypes_Static_0004 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0005
     * @tc.name      test_AsyncTypes_Static_0005
     * @tc.desc      futureResultReturnsPromise with empty string should reject with async error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0005 start');
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        await hello.futureResultReturnsPromise((1000).toLong(), "");
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("val cannot be empty");
      console.log('test_AsyncTypes_Static_0005 done');
      done();
      console.log('test_AsyncTypes_Static_0005 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0006
     * @tc.name      test_AsyncTypes_Static_0006
     * @tc.desc      futureResultWithCallback with empty string should reject with async error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0006 start');
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        await new Promise<string>((resolve, reject): void => {
          hello.futureResultWithCallback((1000).toLong(), "",
            (error: BusinessError | null, data?: string | undefined): void => {
              if (error != null) {
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
      expect(errMsg).assertEqual("val cannot be empty");
      console.log('test_AsyncTypes_Static_0006 done');
      done();
      console.log('test_AsyncTypes_Static_0006 end');
    });
  })
}
