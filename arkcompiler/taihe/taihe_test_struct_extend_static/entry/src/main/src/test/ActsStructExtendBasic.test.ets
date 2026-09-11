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
import {BusinessError} from '@ohos.base';
import * as StructExtendTest from '../ets/struct_extend';

class CImpl implements StructExtendTest.C {
    param1: int = 100;
    param2: int = 200;
    param3: int = 300;
}

export default function actsStructExtendBasicTest(): void {
  describe("ActsStructExtendBasic", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_StructExtend_basic_STATIC_0100
     * @tc.name      test_struct_A
     * @tc.desc      Check and create struct A (no extends).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_struct_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_struct_A start');
      let ins_a: StructExtendTest.A = {param1: 100};
      StructExtendTest.check_A(ins_a);
      let res_a = StructExtendTest.create_A();
      expect(res_a.param1).assertEqual(1);
      console.log('test_struct_A done');
      done();
      console.log('test_struct_A end');

    })

    /**
     * @tc.number    SUB_Taihe_StructExtend_basic_STATIC_0200
     * @tc.name      test_struct_B
     * @tc.desc      Check and create struct B (extends A, flattened fields param1, param2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_struct_B", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_struct_B start');
      let ins_b: StructExtendTest.B = {param1: 100, param2: 200};
      StructExtendTest.check_B(ins_b);
      let res_b = StructExtendTest.create_B();
      expect(res_b.param1).assertEqual(1);
      expect(res_b.param2).assertEqual(2);
      console.log('test_struct_B done');
      done();
      console.log('test_struct_B end');

    })

    /**
     * @tc.number    SUB_Taihe_StructExtend_basic_STATIC_0300
     * @tc.name      test_struct_C
     * @tc.desc      Check and create struct C (extends B, flattened fields).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_struct_C", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_struct_C start');
      let ins_c: StructExtendTest.C = new CImpl();
      StructExtendTest.check_C(ins_c);
      let res_c = StructExtendTest.create_C();
      expect(res_c.param1).assertEqual(1);
      expect(res_c.param2).assertEqual(2);
      expect(res_c.param3).assertEqual(3);
      console.log('test_struct_C done');
      done();
      console.log('test_struct_C end');

    })

    /**
     * @tc.number    SUB_Taihe_StructExtend_basic_STATIC_0400
     * @tc.name      test_struct_D
     * @tc.desc      Check and create struct D (no extends).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_struct_D", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_struct_D start');
      let ins_d: StructExtendTest.D = {param4: 400};
      StructExtendTest.check_D(ins_d);
      let res_d = StructExtendTest.create_D();
      expect(res_d.param4).assertEqual(4);
      console.log('test_struct_D done');
      done();
      console.log('test_struct_D end');

    })

    /**
     * @tc.number    SUB_Taihe_StructExtend_basic_STATIC_0500
     * @tc.name      test_struct_E
     * @tc.desc      Check and create struct E (extends D, flattened fields param4, param5).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_struct_E", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_struct_E start');
      let ins_e: StructExtendTest.E = {param4: 400, param5: 500};
      StructExtendTest.check_E(ins_e);
      let res_e = StructExtendTest.create_E();
      expect(res_e.param4).assertEqual(4);
      expect(res_e.param5).assertEqual(5);
      console.log('test_struct_E done');
      done();
      console.log('test_struct_E end');

    })
  })
}