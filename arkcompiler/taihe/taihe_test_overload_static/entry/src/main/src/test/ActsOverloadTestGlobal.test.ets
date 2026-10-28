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
import {BusinessError} from '@ohos.base';
import * as overload_test from '../ets/overload_test';

export default function overloadTestGlobalTest(): void {
  describe("ActsOverloadTestGlobalTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_OverloadTestGlobal_add_int_0001
     * @tc.name      test_add_numbers
     * @tc.desc      Test overloaded add function with int parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_add_numbers", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_add_numbers start');
      const result = overload_test.add(1, 2);
      expect(result).assertEqual(3);
      console.log('test_add_numbers done');
      done();
      console.log('test_add_numbers end');
    });

    /**
     * @tc.number    SUB_Taihe_OverloadTestGlobal_add_str_0002
     * @tc.name      test_add_strings
     * @tc.desc      Test overloaded add function with string parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_add_strings", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_add_strings start');
      const result = overload_test.add("1", "2");
      expect(result).assertEqual("12");
      console.log('test_add_strings done');
      done();
      console.log('test_add_strings end');
    });

    /**
     * @tc.number    SUB_Taihe_OverloadTestGlobal_foo_bar_int_0003
     * @tc.name      test_Foo_bar_number
     * @tc.desc      Test overloaded Foo.bar function with int parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Foo_bar_number", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Foo_bar_number start');
      const foo = overload_test.makeFoo();
      const result = foo.bar(123);
      expect(result).assertEqual(123);
      console.log('test_Foo_bar_number done');
      done();
      console.log('test_Foo_bar_number end');
    });

    /**
     * @tc.number    SUB_Taihe_OverloadTestGlobal_foo_bar_str_0004
     * @tc.name      test_Foo_bar_string
     * @tc.desc      Test overloaded Foo.bar function with string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Foo_bar_string", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Foo_bar_string start');
      const foo = overload_test.makeFoo();
      const result = foo.bar("Hello");
      expect(result).assertEqual("Hello");
      console.log('test_Foo_bar_string done');
      done();
      console.log('test_Foo_bar_string end');
    });
  });
}