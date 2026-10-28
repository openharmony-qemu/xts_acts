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

export default function asyncStructTest(): void {
  describe("ActsAsyncStructTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_FromStruct_STATIC_0100
     * @tc.name      test_FromStruct_Static_0001
     * @tc.desc      fromStruct with c=3 should resolve without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FromStruct_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FromStruct_Static_0001 start');
      let pass: boolean = true;
      try {
        await test_async.fromStruct({a: "abc", b: "efg", c: 3});
      } catch (e) {
        pass = false;
        console.log('fromStruct failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_FromStruct_Static_0001 done');
      done();
      console.log('test_FromStruct_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_FromStruct_STATIC_0200
     * @tc.name      test_FromStruct_Static_0002
     * @tc.desc      fromStruct should throw an error when c is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FromStruct_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FromStruct_Static_0002 start');
      let caught: boolean = false;
      let errCode: number = 0;
      let errMsg: string = '';
      try {
        await test_async.fromStruct({a: "abc", b: "efg", c: 0});
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errCode = err.code;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errCode).assertEqual(1);
      expect(errMsg).assertEqual("some error happen in fromStructSyncImpl");
      console.log('test_FromStruct_Static_0002 done');
      done();
      console.log('test_FromStruct_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_ToStruct_STATIC_0100
     * @tc.name      test_ToStruct_Static_0001
     * @tc.desc      toStruct should return Data with fields a/b/c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ToStruct_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ToStruct_Static_0001 start');
      let data: test_async.Data = await test_async.toStruct("aaa", "bbb", 1);
      expect(data.a).assertEqual("aaa");
      expect(data.b).assertEqual("bbb");
      expect(data.c).assertEqual(1);
      console.log('test_ToStruct_Static_0001 done');
      done();
      console.log('test_ToStruct_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ToStruct_STATIC_0200
     * @tc.name      test_ToStruct_Static_0002
     * @tc.desc      toStruct should throw an error when c is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ToStruct_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ToStruct_Static_0002 start');
      let caught: boolean = false;
      let errCode: number = 0;
      let errMsg: string = '';
      try {
        await test_async.toStruct("aaa", "bbb", 0);
      } catch (e) {
        caught = true;
        let err: BusinessError = e as BusinessError;
        errCode = err.code;
        errMsg = err.message;
      }
      expect(caught).assertTrue();
      expect(errCode).assertEqual(1);
      expect(errMsg).assertEqual("some error happen in toStructSyncImpl");
      console.log('test_ToStruct_Static_0002 done');
      done();
      console.log('test_ToStruct_Static_0002 end');
    });
  })
}