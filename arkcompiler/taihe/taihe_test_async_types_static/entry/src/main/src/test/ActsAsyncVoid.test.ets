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

export default function asyncVoidTest(): void {
  describe("ActsAsyncVoidTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0013
     * @tc.name      test_AsyncTypes_Static_0013
     * @tc.desc      testVoidAsyncWithCallback should resolve without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0013 start');
      let pass: boolean = true;
      try {
        await new Promise<void>((resolve, reject): void => {
          hello.testVoidAsyncWithCallback((100).toLong(), (error: BusinessError | null): void => {
            if (error) {
              reject(error as Error);
            } else {
              resolve(undefined);
            }
          });
        });
      } catch (e) {
        pass = false;
      }
      expect(pass).assertTrue();
      console.log('test_AsyncTypes_Static_0013 done');
      done();
      console.log('test_AsyncTypes_Static_0013 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0014
     * @tc.name      test_AsyncTypes_Static_0014
     * @tc.desc      testVoidAsyncReturnsPromise should resolve without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0014 start');
      let pass: boolean = true;
      try {
        await hello.testVoidAsyncReturnsPromise((100).toLong());
      } catch (e) {
        pass = false;
      }
      expect(pass).assertTrue();
      console.log('test_AsyncTypes_Static_0014 done');
      done();
      console.log('test_AsyncTypes_Static_0014 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0015
     * @tc.name      test_AsyncTypes_Static_0015
     * @tc.desc      testReverseVoidAsyncWithCallback should resolve without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0015 start');
      let user: hello.VoidAsyncUserTypeImpl = new hello.VoidAsyncUserTypeImpl();
      let pass: boolean = true;
      try {
        await new Promise<void>((resolve, reject): void => {
          hello.testReverseVoidAsyncWithCallback(user, (error: BusinessError | null): void => {
            if (error) {
              reject(error as Error);
            } else {
              resolve(undefined);
            }
          });
        });
      } catch (e) {
        pass = false;
      }
      expect(pass).assertTrue();
      console.log('test_AsyncTypes_Static_0015 done');
      done();
      console.log('test_AsyncTypes_Static_0015 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0016
     * @tc.name      test_AsyncTypes_Static_0016
     * @tc.desc      testReverseVoidAsyncReturnsPromise should resolve without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0016 start');
      let user: hello.VoidAsyncUserTypeImpl = new hello.VoidAsyncUserTypeImpl();
      let pass: boolean = true;
      try {
        await hello.testReverseVoidAsyncReturnsPromise(user);
      } catch (e) {
        pass = false;
      }
      expect(pass).assertTrue();
      console.log('test_AsyncTypes_Static_0016 done');
      done();
      console.log('test_AsyncTypes_Static_0016 end');
    });
  })
}