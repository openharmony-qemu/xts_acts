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
import * as stringTest from '../ets/stringTest'

export default function commonStringTest(): void {
  describe("ActsCommonStringTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_CommonString_STATIC_0100
     * @tc.name      test_CommonString_Static_0100
     * @tc.desc      Test basic string round-trip: StringTest passes input string through and returns it unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CommonString_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CommonString_Static_0100 start');
      try {
        let output: string = stringTest.stringTest("aaa");
        expect(output).assertEqual("aaa");
      } catch (e) {
        console.log('test_CommonString_Static_0100 failed', e.message);
        expect().assertFail();
      }
      console.log('test_CommonString_Static_0100 done');
      done();
      console.log('test_CommonString_Static_0100 end');
    });

    /**
     * @tc.number    SUB_Taihe_CommonString_STATIC_0200
     * @tc.name      test_CommonString_Static_0200
     * @tc.desc      Test taihe::string (UTF-8) operations: comparison operators, to_string, iterator, c_str
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CommonString_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CommonString_Static_0200 start');
      try {
        let output: string = stringTest.taiheU8StrTest();
        expect(output).assertEqual("Taihe UTF-8 string test passed");
      } catch (e) {
        console.log('test_CommonString_Static_0200 failed', e.message);
        expect().assertFail();
      }
      console.log('test_CommonString_Static_0200 done');
      done();
      console.log('test_CommonString_Static_0200 end');
    });

    /**
     * @tc.number    SUB_Taihe_CommonString_STATIC_0300
     * @tc.name      test_CommonString_Static_0300
     * @tc.desc      Test taihe::u16string (UTF-16) operations: comparison, iterator, surrogate pair, concat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CommonString_Static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CommonString_Static_0300 start');
      try {
        let output: string = stringTest.taiheU16StrTest();
        expect(output).assertEqual("Taihe UTF-16 string test passed");
      } catch (e) {
        console.log('test_CommonString_Static_0300 failed', e.message);
        expect().assertFail();
      }
      console.log('test_CommonString_Static_0300 done');
      done();
      console.log('test_CommonString_Static_0300 end');
    });

    /**
     * @tc.number    SUB_Taihe_CommonString_STATIC_0400
     * @tc.name      test_CommonString_Static_0400
     * @tc.desc      Test common_string encoding: UTF-8/UTF-16 operations, encoding conversion, malformed input handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CommonString_Static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CommonString_Static_0400 start');
      try {
        let output: string = stringTest.commonStringTest();
        expect(output).assertEqual("common string test passed");
      } catch (e) {
        console.log('test_CommonString_Static_0400 failed', e.message);
        expect().assertFail();
      }
      console.log('test_CommonString_Static_0400 done');
      done();
      console.log('test_CommonString_Static_0400 end');
    });
  })
}