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
import * as opaque_test from '../ets/opaque_test';

class A {
  constructor() {}
}

export default function opaqueGlobalTest(): void {
  describe("ActsOpaqueGlobalTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Opaque_IsStringWithObject_STATIC_0100
     * @tc.name      test_Opaque_IsStringWithObject_Static_0001
     * @tc.desc      is_string should return false when given a non-string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opaque_IsStringWithObject_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opaque_IsStringWithObject_Static_0001 start');
      const a = new A();
      const result = opaque_test.is_string(a);
      expect(result).assertFalse();
      console.log('test_Opaque_IsStringWithObject_Static_0001 done');
      done();
      console.log('test_Opaque_IsStringWithObject_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opaque_IsStringWithString_STATIC_0100
     * @tc.name      test_Opaque_IsStringWithString_Static_0001
     * @tc.desc      is_string should return true when given a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opaque_IsStringWithString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opaque_IsStringWithString_Static_0001 start');
      const result = opaque_test.is_string("hello");
      expect(result).assertTrue();
      console.log('test_Opaque_IsStringWithString_Static_0001 done');
      done();
      console.log('test_Opaque_IsStringWithString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opaque_GetObject_STATIC_0100
     * @tc.name      test_Opaque_GetObject_Static_0001
     * @tc.desc      get_object should return "BBB"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opaque_GetObject_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opaque_GetObject_Static_0001 start');
      const obj = opaque_test.get_object();
      expect(obj).assertEqual("BBB");
      console.log('test_Opaque_GetObject_Static_0001 done');
      done();
      console.log('test_Opaque_GetObject_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opaque_IsOpaqueWithPerson_STATIC_0100
     * @tc.name      test_Opaque_IsOpaqueWithPerson_Static_0001
     * @tc.desc      is_opaque should return true for a Person struct (opaque value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opaque_IsOpaqueWithPerson_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opaque_IsOpaqueWithPerson_Static_0001 start');
      const a: opaque_test.Person = {name: "aaa"};
      expect(opaque_test.is_opaque(a)).assertTrue();
      console.log('test_Opaque_IsOpaqueWithPerson_Static_0001 done');
      done();
      console.log('test_Opaque_IsOpaqueWithPerson_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opaque_IsOpaqueWithString_STATIC_0100
     * @tc.name      test_Opaque_IsOpaqueWithString_Static_0001
     * @tc.desc      is_opaque should return false for a plain string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opaque_IsOpaqueWithString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opaque_IsOpaqueWithString_Static_0001 start');
      expect(opaque_test.is_opaque("bbb")).assertFalse();
      console.log('test_Opaque_IsOpaqueWithString_Static_0001 done');
      done();
      console.log('test_Opaque_IsOpaqueWithString_Static_0001 end');
    });
  })
}