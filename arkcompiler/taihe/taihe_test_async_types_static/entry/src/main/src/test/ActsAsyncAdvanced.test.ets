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

export default function asyncAdvancedTest(): void {
  describe("ActsAsyncAdvancedTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0017
     * @tc.name      test_AsyncTypes_Static_0017
     * @tc.desc      testSyncOrAsync with sync value should return "C++SyncBool-true"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0017 start');
      let result: string = await hello.testSyncOrAsync(new hello.SyncBoolUserTypeImpl());
      expect(result).assertEqual("C++SyncBool-true");
      console.log('test_AsyncTypes_Static_0017 done');
      done();
      console.log('test_AsyncTypes_Static_0017 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0018
     * @tc.name      test_AsyncTypes_Static_0018
     * @tc.desc      testSyncOrAsync with async value should return "C++AsyncBool-false"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0018 start');
      let result: string = await hello.testSyncOrAsync(new hello.AsyncBoolUserTypeImpl());
      expect(result).assertEqual("C++AsyncBool-false");
      console.log('test_AsyncTypes_Static_0018 done');
      done();
      console.log('test_AsyncTypes_Static_0018 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0019
     * @tc.name      test_AsyncTypes_Static_0019
     * @tc.desc      getDoubleAsyncResults should return both first and second results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0019 start');
      let result: hello.DoubleAsyncResults = hello.getDoubleAsyncResults("First", (21).toLong());
      expect(await result.first).assertEqual("C++AsyncProcessed-First");
      expect(await result.second).assertEqual((42).toLong());
      console.log('test_AsyncTypes_Static_0019 done');
      done();
      console.log('test_AsyncTypes_Static_0019 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0020
     * @tc.name      test_AsyncTypes_Static_0020
     * @tc.desc      getManyAsyncResults should return array of 3 async results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0020 start');
      let result: string[] = await Promise.all(hello.getManyAsyncResults((3).toLong(), "Batch"));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("C++AsyncProcessed-Batch-0");
      expect(result[1]).assertEqual("C++AsyncProcessed-Batch-1");
      expect(result[2]).assertEqual("C++AsyncProcessed-Batch-2");
      console.log('test_AsyncTypes_Static_0020 done');
      done();
      console.log('test_AsyncTypes_Static_0020 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0021
     * @tc.name      test_AsyncTypes_Static_0021
     * @tc.desc      getComplexAsyncResult should return struct with str/num/flag fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0021 start');
      let result: hello.ComplexAsyncResult = await hello.getComplexAsyncResult("Complex", (7).toLong(), true);
      expect(result.str).assertEqual("Complex");
      expect(result.num).assertEqual((7).toLong());
      expect(result.flag).assertTrue();
      console.log('test_AsyncTypes_Static_0021 done');
      done();
      console.log('test_AsyncTypes_Static_0021 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0022
     * @tc.name      test_AsyncTypes_Static_0022
     * @tc.desc      getStringOrNumber with asString=true should return string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0022 start');
      let result: string | long = await hello.getStringOrNumber(true, "StringValue", (9).toLong());
      expect(result).assertEqual("StringValue");
      console.log('test_AsyncTypes_Static_0022 done');
      done();
      console.log('test_AsyncTypes_Static_0022 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0023
     * @tc.name      test_AsyncTypes_Static_0023
     * @tc.desc      getStringOrNumber with asString=false should return number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0023 start');
      let result: string | long = await hello.getStringOrNumber(false, "StringValue", (9).toLong());
      expect(result).assertEqual((9).toLong());
      console.log('test_AsyncTypes_Static_0023 done');
      done();
      console.log('test_AsyncTypes_Static_0023 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0024
     * @tc.name      test_AsyncTypes_Static_0024
     * @tc.desc      getContainer should return ["alpha", "beta", "gamma"]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0024 start');
      let result: string[] = await hello.getContainer();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("alpha");
      expect(result[1]).assertEqual("beta");
      expect(result[2]).assertEqual("gamma");
      console.log('test_AsyncTypes_Static_0024 done');
      done();
      console.log('test_AsyncTypes_Static_0024 end');
    });

    /**
     * @tc.number    SUB_Taihe_AsyncTypes_STATIC_0025
     * @tc.name      test_AsyncTypes_Static_0025
     * @tc.desc      getNestedFuture should return "C++NestedFuture" after double await
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AsyncTypes_Static_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AsyncTypes_Static_0025 start');
      let outer = await hello.getNestedFuture();
      let value = await outer;
      expect(value).assertEqual("C++NestedFuture");
      console.log('test_AsyncTypes_Static_0025 done');
      done();
      console.log('test_AsyncTypes_Static_0025 end');
    });
  })
}