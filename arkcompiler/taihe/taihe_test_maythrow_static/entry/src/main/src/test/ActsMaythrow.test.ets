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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import * as test from '../ets/Index'

export default function maythrowTest(): void {
  describe("ActsMaythrowTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Maythrow_FUNC1_STATIC_0100
     * @tc.name      test_maythrow_success_Static_0001
     * @tc.desc      maythrow(1) with non-zero input should return a + 10 = 11
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_maythrow_success_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_maythrow_success_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.maythrow(1);
        expect(result).assertEqual(11);
      } catch (e) {
        pass = false;
        console.log('maythrow_success failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_maythrow_success_Static_0001 done');
      done();
      console.log('test_maythrow_success_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Maythrow_FUNC2_STATIC_0100
     * @tc.name      test_maythrow_another_value_Static_0001
     * @tc.desc      maythrow(5) with non-zero input should return 15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_maythrow_another_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_maythrow_another_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.maythrow(5);
        expect(result).assertEqual(15);
      } catch (e) {
        pass = false;
        console.log('maythrow_another_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_maythrow_another_value_Static_0001 done');
      done();
      console.log('test_maythrow_another_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Maythrow_FUNC3_STATIC_0100
     * @tc.name      test_maythrow_throw_error_Static_0001
     * @tc.desc      maythrow(0) with zero input should throw "some error happen"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_maythrow_throw_error_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_maythrow_throw_error_Static_0001 start');
      let pass: boolean = false;
      try {
        let result = test.maythrow(0);
        console.log('maythrow_throw_error should have thrown, got result', result);
      } catch (e) {
        console.log('maythrow_throw_error caught expected error', e.message);
        pass = true;
      }
      expect(pass).assertTrue();
      console.log('test_maythrow_throw_error_Static_0001 done');
      done();
      console.log('test_maythrow_throw_error_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Maythrow_FUNC4_STATIC_0100
     * @tc.name      test_get_data_maythrow_throw_error_Static_0001
     * @tc.desc      getDataMaythrow() should throw "error in getDataMaythrow"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_get_data_maythrow_throw_error_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_get_data_maythrow_throw_error_Static_0001 start');
      let pass: boolean = false;
      try {
        let data = test.getDataMaythrow();
        console.log('get_data_maythrow should have thrown, got data');
      } catch (e) {
        console.log('get_data_maythrow caught expected error', e.message);
        pass = true;
      }
      expect(pass).assertTrue();
      console.log('test_get_data_maythrow_throw_error_Static_0001 done');
      done();
      console.log('test_get_data_maythrow_throw_error_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Maythrow_FUNC5_STATIC_0100
     * @tc.name      test_no_return_maythrow_throw_error_Static_0001
     * @tc.desc      noReturnMaythrow() should throw "error in noReturnMaythrow"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_no_return_maythrow_throw_error_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_no_return_maythrow_throw_error_Static_0001 start');
      let pass: boolean = false;
      try {
        test.noReturnMaythrow();
        console.log('no_return_maythrow should have thrown');
      } catch (e) {
        console.log('no_return_maythrow caught expected error', e.message);
        pass = true;
      }
      expect(pass).assertTrue();
      console.log('test_no_return_maythrow_throw_error_Static_0001 done');
      done();
      console.log('test_no_return_maythrow_throw_error_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Maythrow_FUNC6_STATIC_0100
     * @tc.name      test_no_return_business_error_throw_Static_0001
     * @tc.desc      noReturnBusinessError() should throw a BusinessError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_no_return_business_error_throw_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_no_return_business_error_throw_Static_0001 start');
      let pass: boolean = false;
      try {
        test.noReturnBusinessError();
        console.log('no_return_business_error should have thrown');
      } catch (e) {
        console.log('no_return_business_error caught expected error', e.message);
        pass = true;
      }
      expect(pass).assertTrue();
      console.log('test_no_return_business_error_throw_Static_0001 done');
      done();
      console.log('test_no_return_business_error_throw_Static_0001 end');
    });
  });
}