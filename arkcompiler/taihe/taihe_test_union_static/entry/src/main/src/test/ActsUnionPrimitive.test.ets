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

export default function actsUnionPrimitiveTest() {
  describe('ActsUnionPrimitive', () => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_STRING_STATIC_0100
     * @tc.name      test_print_union_string
     * @tc.desc      PrintUnion with string returns "s".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_string start');
      let res = UnionTest1.printUnion("name");
      expect(res).assertEqual("s");
      console.log('test_print_union_string done');
      done();
      console.log('test_print_union_string end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_I8_STATIC_0100
     * @tc.name      test_print_union_i8
     * @tc.desc      PrintUnion with i8 returns "i8".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_i8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_i8 start');
      let res = UnionTest1.printUnion((1).toByte());
      expect(res).assertEqual("i8");
      console.log('test_print_union_i8 done');
      done();
      console.log('test_print_union_i8 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_I16_STATIC_0100
     * @tc.name      test_print_union_i16
     * @tc.desc      PrintUnion with i16 returns "i16".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_i16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_i16 start');
      let res = UnionTest1.printUnion((123).toShort());
      expect(res).assertEqual("i16");
      console.log('test_print_union_i16 done');
      done();
      console.log('test_print_union_i16 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_I32_STATIC_0100
     * @tc.name      test_print_union_i32
     * @tc.desc      PrintUnion with i32 returns "i32".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_i32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_i32 start');
      let res = UnionTest1.printUnion((123456).toInt());
      expect(res).assertEqual("i32");
      console.log('test_print_union_i32 done');
      done();
      console.log('test_print_union_i32 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_F32_STATIC_0100
     * @tc.name      test_print_union_f32
     * @tc.desc      PrintUnion with f32 returns "f32".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_f32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_f32 start');
      let res = UnionTest1.printUnion(1.23f);
      expect(res).assertEqual("f32");
      console.log('test_print_union_f32 done');
      done();
      console.log('test_print_union_f32 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_F64_STATIC_0100
     * @tc.name      test_print_union_f64
     * @tc.desc      PrintUnion with f64 returns "f64".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_f64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_f64 start');
      let res = UnionTest1.printUnion((1.2345).toDouble());
      expect(res).assertEqual("f64");
      console.log('test_print_union_f64 done');
      done();
      console.log('test_print_union_f64 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_BOOL_STATIC_0100
     * @tc.name      test_print_union_bool
     * @tc.desc      PrintUnion with bool returns "bool".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_print_union_bool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_union_bool start');
      let res = UnionTest1.printUnion(true);
      expect(res).assertEqual("bool");
      let res2 = UnionTest1.printUnion(false);
      expect(res2).assertEqual("bool");
      console.log('test_print_union_bool done');
      done();
      console.log('test_print_union_bool end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_MAKESTRING_STATIC_0100
     * @tc.name      test_make_union_string
     * @tc.desc      MakeUnion returns string variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_make_union_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_make_union_string start');
      let result = UnionTest1.makeUnion("s");
      expect(result).assertEqual("string");
      console.log('test_make_union_string done');
      done();
      console.log('test_make_union_string end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_MAKEI8_STATIC_0100
     * @tc.name      test_make_union_i8
     * @tc.desc      MakeUnion returns i8 variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_make_union_i8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_make_union_i8 start');
      let result = UnionTest1.makeUnion("i8");
      expect(result).assertEqual(1);
      console.log('test_make_union_i8 done');
      done();
      console.log('test_make_union_i8 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_MAKEI16_STATIC_0100
     * @tc.name      test_make_union_i16
     * @tc.desc      MakeUnion returns i16 variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_make_union_i16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_make_union_i16 start');
      let result = UnionTest1.makeUnion("i16");
      expect(result).assertEqual(123);
      console.log('test_make_union_i16 done');
      done();
      console.log('test_make_union_i16 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_MAKEI32_STATIC_0100
     * @tc.name      test_make_union_i32
     * @tc.desc      MakeUnion returns i32 variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_make_union_i32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_make_union_i32 start');
      let result = UnionTest1.makeUnion("i32");
      expect(result).assertEqual(1234);
      console.log('test_make_union_i32 done');
      done();
      console.log('test_make_union_i32 end');
    })

    /**
     * @tc.number    SUB_Taihe_UnionPrimitive_MAKEBOOL_STATIC_0100
     * @tc.name      test_make_union_bool
     * @tc.desc      MakeUnion returns bool variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_make_union_bool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_make_union_bool start');
      let result = UnionTest1.makeUnion("bool");
      expect(result).assertEqual(true);
      console.log('test_make_union_bool done');
      done();
      console.log('test_make_union_bool end');
    })
  })
}