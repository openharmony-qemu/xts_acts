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
import * as test_async from '../ets/async_test'

export default function asyncGlobalTest(): void {
  describe("ActsAsyncGlobalTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_AddSync_STATIC_0100
     * @tc.name      test_AddSync_Static_0001
     * @tc.desc      addSync should correctly add 1 + 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AddSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AddSync_Static_0001 start');
      let res: int = test_async.addSync(1, 2);
      expect(res).assertEqual(3);
      console.log('test_AddSync_Static_0001 done');
      done();
      console.log('test_AddSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AddSync_STATIC_0200
     * @tc.name      test_AddSync_Static_0002
     * @tc.desc      addSync should throw an error when first parameter is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AddSync_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AddSync_Static_0002 start');
      let caught: boolean = false;
      let errCode: number = 0;
      let errMsg: string = '';
      try {
        test_async.addSync(0, 2);
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errCode = err.code;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errCode).assertEqual(1);
      expect(errMsg).assertEqual("some error happen in add impl");
      console.log('test_AddSync_Static_0002 done');
      done();
      console.log('test_AddSync_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_AddCallback_STATIC_0100
     * @tc.name      test_AddCallback_Static_0001
     * @tc.desc      add callback should receive 10 + 20 = 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AddCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AddCallback_Static_0001 start');
      let res: int = await new Promise<int>((resolve, reject): void => {
        test_async.add(10, 20, (error: BusinessError | null, data?: int): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            resolve(data!);
          }
        });
      });
      expect(res).assertEqual(30);
      console.log('test_AddCallback_Static_0001 done');
      done();
      console.log('test_AddCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AddCallback_STATIC_0200
     * @tc.name      test_AddCallback_Static_0002
     * @tc.desc      add callback should receive an error when first parameter is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AddCallback_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AddCallback_Static_0002 start');
      let caught: boolean = false;
      let errCode: number = 0;
      let errMsg: string = '';
      try {
        await new Promise<int>((resolve, reject): void => {
          test_async.add(0, 2, (error: BusinessError | null, data?: int): void => {
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
        errCode = err.code;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errCode).assertEqual(1);
      expect(errMsg).assertEqual("some error happen in add impl");
      console.log('test_AddCallback_Static_0002 done');
      done();
      console.log('test_AddCallback_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_AddPromise_STATIC_0100
     * @tc.name      test_AddPromise_Static_0001
     * @tc.desc      add promise should correctly add 1 + 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AddPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AddPromise_Static_0001 start');
      let res: int = await test_async.add(1, 2);
      expect(res).assertEqual(3);
      console.log('test_AddPromise_Static_0001 done');
      done();
      console.log('test_AddPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AddPromise_STATIC_0200
     * @tc.name      test_AddPromise_Static_0002
     * @tc.desc      add promise should throw an error when first parameter is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AddPromise_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AddPromise_Static_0002 start');
      let caught: boolean = false;
      let errCode: number = 0;
      let errMsg: string = '';
      try {
        await test_async.add(0, 2);
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errCode = err.code;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errCode).assertEqual(1);
      expect(errMsg).assertEqual("some error happen in add impl");
      console.log('test_AddPromise_Static_0002 done');
      done();
      console.log('test_AddPromise_Static_0002 end');
    });
  })
}
