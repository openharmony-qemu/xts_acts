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
import * as UnionTest1 from '../ets/test_union';

let instance: UnionTest1.MyInterface = UnionTest1.getInterface();

export default function actsUnionInterfacePrimitiveReturnTest(): void {
  describe("ActsUnionInterfacePrimitiveReturn", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0100
     * @tc.name      test_func_union_primitive_return_s
     * @tc.desc      FuncUnionPrimitiveReturn with "s" returns string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return_s", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return_s start');
      let res = instance.funcUnionPrimitiveReturn("s");
      expect(res).assertEqual("string");
      console.log('test_func_union_primitive_return_s done');
      done();
      console.log('test_func_union_primitive_return_s end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0200
     * @tc.name      test_func_union_primitive_return_i8
     * @tc.desc      FuncUnionPrimitiveReturn with "i8" returns i8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return_i8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return_i8 start');
      let res = instance.funcUnionPrimitiveReturn("i8");
      expect(res).assertEqual(1);
      console.log('test_func_union_primitive_return_i8 done');
      done();
      console.log('test_func_union_primitive_return_i8 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0300
     * @tc.name      test_func_union_primitive_return1_i8
     * @tc.desc      FuncUnionPrimitiveReturn1 with "i8" returns i8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return1_i8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return1_i8 start');
      let res = instance.funcUnionPrimitiveReturn1("i8");
      expect(res).assertEqual(1);
      console.log('test_func_union_primitive_return1_i8 done');
      done();
      console.log('test_func_union_primitive_return1_i8 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0400
     * @tc.name      test_func_union_primitive_return1_i16
     * @tc.desc      FuncUnionPrimitiveReturn1 with "i16" returns i16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return1_i16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return1_i16 start');
      let res = instance.funcUnionPrimitiveReturn1("i16");
      expect(res).assertEqual(12);
      console.log('test_func_union_primitive_return1_i16 done');
      done();
      console.log('test_func_union_primitive_return1_i16 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0700
     * @tc.name      test_func_union_primitive_return3_i16
     * @tc.desc      FuncUnionPrimitiveReturn3 with "i16" returns i16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return3_i16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return3_i16 start');
      let res = instance.funcUnionPrimitiveReturn3("i16");
      expect(res).assertEqual(12);
      console.log('test_func_union_primitive_return3_i16 done');
      done();
      console.log('test_func_union_primitive_return3_i16 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0800
     * @tc.name      test_func_union_primitive_return3_i32
     * @tc.desc      FuncUnionPrimitiveReturn3 with "i32" returns i32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return3_i32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return3_i32 start');
      let res = instance.funcUnionPrimitiveReturn3("i32");
      expect(res).assertEqual(123);
      console.log('test_func_union_primitive_return3_i32 done');
      done();
      console.log('test_func_union_primitive_return3_i32 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_0900
     * @tc.name      test_func_union_primitive_return4_i32
     * @tc.desc      FuncUnionPrimitiveReturn4 with "i32" returns i32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return4_i32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return4_i32 start');
      let res = instance.funcUnionPrimitiveReturn4("i32");
      expect(res).assertEqual(123);
      console.log('test_func_union_primitive_return4_i32 done');
      done();
      console.log('test_func_union_primitive_return4_i32 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_1300
     * @tc.name      test_func_union_primitive_return6_s
     * @tc.desc      FuncUnionPrimitiveReturn6 with "s" returns string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return6_s", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return6_s start');
      let res = instance.funcUnionPrimitiveReturn6("s");
      expect(res).assertEqual("hello");
      console.log('test_func_union_primitive_return6_s done');
      done();
      console.log('test_func_union_primitive_return6_s end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_1400
     * @tc.name      test_func_union_primitive_return6_b
     * @tc.desc      FuncUnionPrimitiveReturn6 with "b" returns bool.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return6_b", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return6_b start');
      let res = instance.funcUnionPrimitiveReturn6("b");
      expect(res).assertEqual(true);
      console.log('test_func_union_primitive_return6_b done');
      done();
      console.log('test_func_union_primitive_return6_b end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_1500
     * @tc.name      test_func_union_primitive_return7_b
     * @tc.desc      FuncUnionPrimitiveReturn7 with "b" returns bool.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return7_b", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return7_b start');
      let res = instance.funcUnionPrimitiveReturn7("b");
      expect(res).assertEqual(true);
      console.log('test_func_union_primitive_return7_b done');
      done();
      console.log('test_func_union_primitive_return7_b end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceprimitivereturn_STATIC_1600
     * @tc.name      test_func_union_primitive_return7_i8
     * @tc.desc      FuncUnionPrimitiveReturn7 with "i8" returns i8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_primitive_return7_i8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_return7_i8 start');
      let res = instance.funcUnionPrimitiveReturn7("i8");
      expect(res).assertEqual(1);
      console.log('test_func_union_primitive_return7_i8 done');
      done();
      console.log('test_func_union_primitive_return7_i8 end');

    })

      })
}