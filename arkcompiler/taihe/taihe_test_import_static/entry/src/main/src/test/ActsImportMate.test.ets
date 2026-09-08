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
import * as mate from '../ets/mate';
import * as pura from '../ets/pura';
import bar from '../ets/mate';

export default function actsImportMateTest(): void {
  describe("ActsImportMateTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0100
     * @tc.name      test_MateType_Union_0001
     * @tc.desc      MateType union type with string, boolean, undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MateType_Union_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MateType_Union_0001 start');
      let mateStr: mate.MateType = "hello";
      expect(mateStr).assertEqual("hello");
      let mateBool: mate.MateType = true;
      expect(mateBool).assertTrue();
      let mateUndef: mate.MateType = undefined;
      expect(mateUndef).assertUndefined();
      console.log('test_MateType_Union_0001 done');
      done();
      console.log('test_MateType_Union_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0101
     * @tc.name      test_bar_BarType_0001
     * @tc.desc      bar namespace BarType struct construction and field access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bar_BarType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bar_BarType_0001 start');
      let barType: bar.BarType = { v: 42 };
      expect(barType.v).assertEqual(42);
      barType.v = 100;
      expect(barType.v).assertEqual(100);
      console.log('test_bar_BarType_0001 done');
      done();
      console.log('test_bar_BarType_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0102
     * @tc.name      test_bar_testFoo_0001
     * @tc.desc      bar.testFoo native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bar_testFoo_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bar_testFoo_0001 start');
      let foo: mate.foo.FooType = { v: 10 };
      let caught: boolean = true;
      try {
        bar.testFoo(foo);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_bar_testFoo_0001 done');
      done();
      console.log('test_bar_testFoo_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0103
     * @tc.name      test_foo_FooType_0001
     * @tc.desc      foo namespace FooType struct construction and field access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_FooType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_FooType_0001 start');
      let fooType: mate.foo.FooType = { v: 7 };
      expect(fooType.v).assertEqual(7);
      fooType.v = 99;
      expect(fooType.v).assertEqual(99);
      console.log('test_foo_FooType_0001 done');
      done();
      console.log('test_foo_FooType_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0104
     * @tc.name      test_foo_testMate_0001
     * @tc.desc      foo.testMate native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_testMate_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_testMate_0001 start');
      let mateVal: mate.MateType = "test";
      let caught: boolean = true;
      try {
        mate.foo.testMate(mateVal);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_foo_testMate_0001 done');
      done();
      console.log('test_foo_testMate_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0105
     * @tc.name      test_foo_testNova_0001
     * @tc.desc      foo.testNova native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_testNova_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_testNova_0001 start');
      let caught: boolean = true;
      try {
        mate.foo.testNova({});
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_foo_testNova_0001 done');
      done();
      console.log('test_foo_testNova_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0106
     * @tc.name      test_foo_testPura_0001
     * @tc.desc      foo.testPura native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_testPura_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_testPura_0001 start');
      let caught: boolean = true;
      try {
        mate.foo.testPura(pura.PuraType.A);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_foo_testPura_0001 done');
      done();
      console.log('test_foo_testPura_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportMate_FUNC_STATIC_0107
     * @tc.name      test_testBar_0001
     * @tc.desc      top-level testBar native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testBar_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testBar_0001 start');
      let barType: bar.BarType = { v: 1 };
      let caught: boolean = true;
      try {
        mate.testBar(barType);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testBar_0001 done');
      done();
      console.log('test_testBar_0001 end');
    });
  })
}