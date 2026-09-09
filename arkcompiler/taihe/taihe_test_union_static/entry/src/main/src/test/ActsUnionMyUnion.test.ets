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
import * as UnionTest from '../ets/union_ani';

export default function actsUnionMyUnionTest(): void {
  describe("ActsUnionMyUnion", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0100
     * @tc.name      test_print_my_union_undefined
     * @tc.desc      PrintMyUnion with undefined value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_print_my_union_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_print_my_union_undefined start');
      let res = UnionTest.printMyUnion(undefined);
      expect(res).assertEqual("u");
      console.log('test_print_my_union_undefined done');
      done();
      console.log('test_print_my_union_undefined end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0200
     * @tc.name      test_print_my_union_string
     * @tc.desc      PrintMyUnion with string value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_print_my_union_string", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_print_my_union_string start');
      let res = UnionTest.printMyUnion("name");
      expect(res).assertEqual("s");
      console.log('test_print_my_union_string done');
      done();
      console.log('test_print_my_union_string end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0300
     * @tc.name      test_print_my_union_float
     * @tc.desc      PrintMyUnion with float value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_print_my_union_float", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_print_my_union_float start');
      let res = UnionTest.printMyUnion(123.456f);
      expect(res).assertEqual("f");
      console.log('test_print_my_union_float done');
      done();
      console.log('test_print_my_union_float end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0400
     * @tc.name      test_print_my_union_pair
     * @tc.desc      PrintMyUnion with Pair struct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_print_my_union_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_print_my_union_pair start');
      let pair: UnionTest.Pair = {a: "a", b: "b"};
      let res = UnionTest.printMyUnion(pair);
      expect(res).assertEqual("p");
      console.log('test_print_my_union_pair done');
      done();
      console.log('test_print_my_union_pair end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0500
     * @tc.name      test_make_my_union_string
     * @tc.desc      MakeMyUnion returns string variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_my_union_string", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_my_union_string start');
      const result = UnionTest.makeMyUnion("s");
      expect(result).assertEqual("string");
      console.log('test_make_my_union_string done');
      done();
      console.log('test_make_my_union_string end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0600
     * @tc.name      test_make_my_union_float
     * @tc.desc      MakeMyUnion returns float variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_my_union_float", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_my_union_float start');
      const result = UnionTest.makeMyUnion("f");
      expect(result).assertEqual(123);
      console.log('test_make_my_union_float done');
      done();
      console.log('test_make_my_union_float end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0700
     * @tc.name      test_make_my_union_pair
     * @tc.desc      MakeMyUnion returns Pair variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_my_union_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_my_union_pair start');
      const result = UnionTest.makeMyUnion("p");
      if (result instanceof UnionTest.Pair) {
        expect(result!.a).assertEqual("a");
        expect(result!.b).assertEqual("b");
        console.log('test_make_my_union_pair done');
        done();
        console.log('test_make_my_union_pair end');
      } else {
        throw new Error("Result type error");
      }

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0800
     * @tc.name      test_make_my_union_undefined
     * @tc.desc      MakeMyUnion returns undefined variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_my_union_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_my_union_undefined start');
      const result = UnionTest.makeMyUnion("u");
      expect(result).assertEqual(undefined);
      console.log('test_make_my_union_undefined done');
      done();
      console.log('test_make_my_union_undefined end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_0900
     * @tc.name      test_make_and_show_basic_union
     * @tc.desc      MakeAndShowBasicUnion roundtrip with all primitive types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_and_show_basic_union", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_and_show_basic_union start');
      let i8Result = UnionTest.makeAndShowBasicUnion((1).toByte());
      expect(i8Result).assertEqual(1);
      let i16Result = UnionTest.makeAndShowBasicUnion((123).toShort());
      expect(i16Result).assertEqual(123);
      let i32Result = UnionTest.makeAndShowBasicUnion((123456).toInt());
      expect(i32Result).assertEqual(123456);
      let i64Result = UnionTest.makeAndShowBasicUnion((123456789).toLong());
      expect(i64Result).assertEqual(123456789);
      let stringResult = UnionTest.makeAndShowBasicUnion("this is string data");
      expect(stringResult).assertEqual("this is string data");
      let boolResult = UnionTest.makeAndShowBasicUnion(true);
      expect(boolResult).assertEqual(true);
      let boolResult1 = UnionTest.makeAndShowBasicUnion(false);
      expect(boolResult1).assertEqual(false);
      let nullResult = UnionTest.makeAndShowBasicUnion(null);
      expect(nullResult).assertEqual(null);
      console.log('test_make_and_show_basic_union done');
      done();
      console.log('test_make_and_show_basic_union end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_1000
     * @tc.name      test_make_and_show_typed_array_union
     * @tc.desc      MakeAndShowTypedArrayUnion roundtrip with all typed array types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_and_show_typed_array_union", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_and_show_typed_array_union start');
      let u8Arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let u8ArrResult = UnionTest.makeAndShowTypedArrayUnion(u8Arr) as Uint8Array;
      expect(u8ArrResult.toString()).assertEqual(u8Arr.toString());
      let i8Arr: Int8Array = new Int8Array([-1, -2, -3]);
      let i8ArrResult = UnionTest.makeAndShowTypedArrayUnion(i8Arr) as Int8Array;
      expect(i8ArrResult.toString()).assertEqual(i8Arr.toString());
      let u16Arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let u16ArrResult = UnionTest.makeAndShowTypedArrayUnion(u16Arr) as Uint16Array;
      expect(u16ArrResult.toString()).assertEqual(u16Arr.toString());
      let i16Arr: Int16Array = new Int16Array([-10, -20, -30]);
      let i16ArrResult = UnionTest.makeAndShowTypedArrayUnion(i16Arr) as Int16Array;
      expect(i16ArrResult.toString()).assertEqual(i16Arr.toString());
      let u32Arr: Uint32Array = new Uint32Array([100, 200, 300]);
      let u32ArrResult = UnionTest.makeAndShowTypedArrayUnion(u32Arr) as Uint32Array;
      expect(u32ArrResult.toString()).assertEqual(u32Arr.toString());
      let i32Arr: Int32Array = new Int32Array([-100, -200, -300]);
      let i32ArrResult = UnionTest.makeAndShowTypedArrayUnion(i32Arr) as Int32Array;
      expect(i32ArrResult.toString()).assertEqual(i32Arr.toString());
      let u64Arr: BigUint64Array = new BigUint64Array([1000n, 2000n, 3000n]);
      let u64ArrResult = UnionTest.makeAndShowTypedArrayUnion(u64Arr) as BigUint64Array;
      expect(u64ArrResult.toString()).assertEqual(u64Arr.toString());
      let i64Arr: BigInt64Array = new BigInt64Array([-1000n, -2000n, -3000n]);
      let i64ArrResult = UnionTest.makeAndShowTypedArrayUnion(i64Arr) as BigInt64Array;
      expect(i64ArrResult.toString()).assertEqual(i64Arr.toString());
      let f32Arr: Float32Array = new Float32Array([1.23, -2.14, 3.16]);
      let f32ArrResult = UnionTest.makeAndShowTypedArrayUnion(f32Arr) as Float32Array;
      expect(f32ArrResult.toString()).assertEqual(f32Arr.toString());
      let f64Arr: Float64Array = new Float64Array([1.234567, -2.145789, 3.161862]);
      let f64ArrResult = UnionTest.makeAndShowTypedArrayUnion(f64Arr) as Float64Array;
      expect(f64ArrResult.toString()).assertEqual(f64Arr.toString());
      let nullResult = UnionTest.makeAndShowTypedArrayUnion(null);
      expect(nullResult).assertEqual(null);
      console.log('test_make_and_show_typed_array_union done');
      done();
      console.log('test_make_and_show_typed_array_union end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_1100
     * @tc.name      test_make_and_show_array_union
     * @tc.desc      MakeAndShowArrayUnion roundtrip with ArrayStruct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_and_show_array_union", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_and_show_array_union start');
      let arrStruct: UnionTest.ArrayStruct = {
      float32Array: [1.23f, -2.14f, 3.16f],
      float64Array: [1.234567, -2.145789, 3.161862]
      };
      let arrResult = UnionTest.makeAndShowArrayUnion(arrStruct) as UnionTest.ArrayStruct;
      expect(arrResult.float32Array.length).assertEqual(3);
      expect(arrResult.float64Array.length).assertEqual(3);
      let nullResult = UnionTest.makeAndShowArrayUnion(null);
      expect(nullResult).assertEqual(null);
      console.log('test_make_and_show_array_union done');
      done();
      console.log('test_make_and_show_array_union end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_myunion_STATIC_1200
     * @tc.name      test_make_and_show_struct_union
     * @tc.desc      MakeAndShowStructUnion roundtrip with StrStruct and IntStruct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_and_show_struct_union", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_and_show_struct_union start');
      let strStruct: UnionTest.StrStruct = {a: "StrStruct a", b: "StrStruct b"};
      let strResult = UnionTest.makeAndShowStructUnion(strStruct) as UnionTest.StrStruct;
      expect(strResult.a).assertEqual("StrStruct a");
      expect(strResult.b).assertEqual("StrStruct b");
      let intStruct: UnionTest.IntStruct = {a: 1, b: 2};
      let intResult = UnionTest.makeAndShowStructUnion(intStruct) as UnionTest.IntStruct;
      expect(intResult.a).assertEqual(1);
      expect(intResult.b).assertEqual(2);
      let nullResult = UnionTest.makeAndShowStructUnion(null);
      expect(nullResult).assertEqual(null);
      console.log('test_make_and_show_struct_union done');
      done();
      console.log('test_make_and_show_struct_union end');

    })
  })
}