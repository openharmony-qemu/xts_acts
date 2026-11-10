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
import * as pura from '../ets/pura';
import * as ohos_test from '../ets/@ohos.test';
import * as mate from '../ets/mate';
import bar from '../ets/mate';

export default function actsImportPuraTest(): void {
  describe("ActsImportPuraTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0100
     * @tc.name      test_PuraType_Enum_0001
     * @tc.desc      PuraType enum values A=1, B=2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PuraType_Enum_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_PuraType_Enum_0001 start');
      expect(pura.PuraType.A).assertEqual(1);
      expect(pura.PuraType.B).assertEqual(2);
      console.log('test_PuraType_Enum_0001 done');
      done();
      console.log('test_PuraType_Enum_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0200
     * @tc.name      test_PuraClass_Construct_0001
     * @tc.desc      PuraClass construction with v, u, p fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PuraClass_Construct_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_PuraClass_Construct_0001 start');
      let obj = new pura.PuraClass(1, 2, 3);
      expect(obj.v).assertEqual(1);
      expect(obj.u).assertEqual(2);
      expect(obj.p).assertEqual(3);
      console.log('test_PuraClass_Construct_0001 done');
      done();
      console.log('test_PuraClass_Construct_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0300
     * @tc.name      test_PuraClass_CopyConstruct_0001
     * @tc.desc      PuraClass copy construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PuraClass_CopyConstruct_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_PuraClass_CopyConstruct_0001 start');
      let obj1 = new pura.PuraClass(10, 20, 30);
      let obj2 = new pura.PuraClass(obj1);
      expect(obj2.v).assertEqual(10);
      expect(obj2.u).assertEqual(20);
      expect(obj2.p).assertEqual(30);
      console.log('test_PuraClass_CopyConstruct_0001 done');
      done();
      console.log('test_PuraClass_CopyConstruct_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0400
     * @tc.name      test_baz_BazType_0001
     * @tc.desc      baz namespace BazType struct construction and field access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_baz_BazType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_baz_BazType_0001 start');
      let bazType: pura.baz.BazType = { v: 55 };
      expect(bazType.v).assertEqual(55);
      bazType.v = 77;
      expect(bazType.v).assertEqual(77);
      console.log('test_baz_BazType_0001 done');
      done();
      console.log('test_baz_BazType_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0500
     * @tc.name      test_baz_testFoo_0001
     * @tc.desc      baz.testFoo native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_baz_testFoo_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_baz_testFoo_0001 start');
      let foo: mate.foo.FooType = { v: 3 };
      let caught: boolean = true;
      try {
        pura.baz.testFoo(foo);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_baz_testFoo_0001 done');
      done();
      console.log('test_baz_testFoo_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0600
     * @tc.name      test_baz_testBaz_0001
     * @tc.desc      baz.testBaz native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_baz_testBaz_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_baz_testBaz_0001 start');
      let bazType: pura.baz.BazType = { v: 5 };
      let caught: boolean = true;
      try {
        pura.baz.testBaz(bazType);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_baz_testBaz_0001 done');
      done();
      console.log('test_baz_testBaz_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0700
     * @tc.name      test_testBar_0001
     * @tc.desc      top-level pura.testBar native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testBar_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testBar_0001 start');
      let bar: bar.BarType = { v: 1 };
      let caught: boolean = true;
      try {
        pura.testBar(bar);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testBar_0001 done');
      done();
      console.log('test_testBar_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0800
     * @tc.name      test_testMyStruct_0001
     * @tc.desc      top-level pura.testMyStruct native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testMyStruct_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testMyStruct_0001 start');
      let s: ohos_test.inner.MyStruct = { v: 2 };
      let caught: boolean = true;
      try {
        pura.testMyStruct(s);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testMyStruct_0001 done');
      done();
      console.log('test_testMyStruct_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportPura_FUNC_STATIC_0900
     * @tc.name      test_testPuraClass_0001
     * @tc.desc      top-level pura.testPuraClass native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testPuraClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testPuraClass_0001 start');
      let obj = new pura.PuraClass(1, 2, 3);
      let caught: boolean = true;
      try {
        pura.testPuraClass(obj);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testPuraClass_0001 done');
      done();
      console.log('test_testPuraClass_0001 end');
    });
  })
}