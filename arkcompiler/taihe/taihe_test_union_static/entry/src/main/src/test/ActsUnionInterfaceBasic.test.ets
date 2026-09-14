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
import * as UnionTest1 from '../ets/test_union';

let instance: UnionTest1.MyInterface = UnionTest1.getInterface();

export default function actsUnionInterfaceBasicTest() {
  describe('ActsUnionInterfaceBasic', () => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_STRINGBOOL_STATIC_0100
     * @tc.name      test_func_union_primitive_string_bool
     * @tc.desc      FuncUnionPrimitive with string and bool.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_string_bool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_string_bool start');
      let res = instance.funcUnionPrimitive("Hello", true);
      expect(res).assertEqual("s");
      console.log('test_func_union_primitive_string_bool done');
      done();
      console.log('test_func_union_primitive_string_bool end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_STRINGI8_STATIC_0100
     * @tc.name      test_func_union_primitive_string_i8
     * @tc.desc      FuncUnionPrimitive with string and i8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_string_i8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_string_i8 start');
      let res = instance.funcUnionPrimitive("World", (42).toByte());
      expect(res).assertEqual("s");
      console.log('test_func_union_primitive_string_i8 done');
      done();
      console.log('test_func_union_primitive_string_i8 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_I8I16_STATIC_0100
     * @tc.name      test_func_union_primitive_i8_i16
     * @tc.desc      FuncUnionPrimitive with i8 and i16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_i8_i16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_i8_i16 start');
      let res = instance.funcUnionPrimitive((1).toByte(), (12).toShort());
      expect(res).assertEqual("i8");
      console.log('test_func_union_primitive_i8_i16 done');
      done();
      console.log('test_func_union_primitive_i8_i16 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_I16I32_STATIC_0100
     * @tc.name      test_func_union_primitive_i16_i32
     * @tc.desc      FuncUnionPrimitive with i16 and i32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_i16_i32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_i16_i32 start');
      let res = instance.funcUnionPrimitive((12).toShort(), (123).toInt());
      expect(res).assertEqual("i16");
      console.log('test_func_union_primitive_i16_i32 done');
      done();
      console.log('test_func_union_primitive_i16_i32 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_I32F32_STATIC_0100
     * @tc.name      test_func_union_primitive_i32_f32
     * @tc.desc      FuncUnionPrimitive with i32 and f32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_i32_f32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_i32_f32 start');
      let res = instance.funcUnionPrimitive((123).toInt(), 1.23);
      expect(res).assertEqual("i32");
      console.log('test_func_union_primitive_i32_f32 done');
      done();
      console.log('test_func_union_primitive_i32_f32 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_F32F64_STATIC_0100
     * @tc.name      test_func_union_primitive_f32_f64
     * @tc.desc      FuncUnionPrimitive with f32 and f64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_f32_f64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_f32_f64 start');
      let res = instance.funcUnionPrimitive(1.23f, (1.2345).toDouble());
      expect(res).assertEqual("f32");
      console.log('test_func_union_primitive_f32_f64 done');
      done();
      console.log('test_func_union_primitive_f32_f64 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_BOOLI8_STATIC_0100
     * @tc.name      test_func_union_primitive_bool_i8
     * @tc.desc      FuncUnionPrimitive with bool and i8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_bool_i8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_bool_i8 start');
      let res = instance.funcUnionPrimitive(true, (42).toByte());
      expect(res).assertEqual("bool");
      console.log('test_func_union_primitive_bool_i8 done');
      done();
      console.log('test_func_union_primitive_bool_i8 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_BOOLI16_STATIC_0100
     * @tc.name      test_func_union_primitive_bool_i16
     * @tc.desc      FuncUnionPrimitive with bool and i16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_bool_i16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_bool_i16 start');
      let res = instance.funcUnionPrimitive(false, (123).toShort());
      expect(res).assertEqual("bool");
      console.log('test_func_union_primitive_bool_i16 done');
      done();
      console.log('test_func_union_primitive_bool_i16 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_STRINGF32_STATIC_0100
     * @tc.name      test_func_union_primitive_string_f32
     * @tc.desc      FuncUnionPrimitive with string and f32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_string_f32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_string_f32 start');
      let res = instance.funcUnionPrimitive("Test", 3.14);
      expect(res).assertEqual("s");
      console.log('test_func_union_primitive_string_f32 done');
      done();
      console.log('test_func_union_primitive_string_f32 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_I32F64_STATIC_0100
     * @tc.name      test_func_union_primitive_i32_f64
     * @tc.desc      FuncUnionPrimitive with i32 and f64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_i32_f64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_i32_f64 start');
      let res = instance.funcUnionPrimitive((12345).toInt(), (2.71828).toDouble());
      expect(res).assertEqual("i32");
      console.log('test_func_union_primitive_i32_f64 done');
      done();
      console.log('test_func_union_primitive_i32_f64 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_5PARAM1_STATIC_0100
     * @tc.name      test_func_union_primitive_5param_1
     * @tc.desc      FuncUnionPrimitive5Param with various types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_5param_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_5param_1 start');
      let res = instance.funcUnionPrimitive5Param(
        (12345).toInt(), (2.71828).toDouble(), (12).toShort(), (1).toByte(), "hello");
      expect(res).assertEqual("func_union_primitive_5param");
      console.log('test_func_union_primitive_5param_1 done');
      done();
      console.log('test_func_union_primitive_5param_1 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionInterfaceBasic_5PARAM2_STATIC_0100
     * @tc.name      test_func_union_primitive_5param_2
     * @tc.desc      FuncUnionPrimitive5Param with different types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_func_union_primitive_5param_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_primitive_5param_2 start');
      let res = instance.funcUnionPrimitive5Param(
        (42).toInt(), (3.14).toDouble(), (100).toShort(), (2).toByte(), "world");
      expect(res).assertEqual("func_union_primitive_5param");
      console.log('test_func_union_primitive_5param_2 done');
      done();
      console.log('test_func_union_primitive_5param_2 end');
    })
  })
}