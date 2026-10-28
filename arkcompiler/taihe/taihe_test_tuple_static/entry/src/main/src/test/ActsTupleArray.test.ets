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
import * as TupleTest from '../ets/tuple_test';

export default function actsTupleArrayTest(): void {
  describe("ActsTupleArray", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0100
     * @tc.name      test_make_int_pair_array
     * @tc.desc      Create Array<IntPair> via makeIntPairArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_int_pair_array", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_int_pair_array start');
      let arr: Array<TupleTest.IntPair> = TupleTest.makeIntPairArray(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(0);
      expect(arr[0][1]).assertEqual(0);
      expect(arr[1][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(10);
      expect(arr[2][0]).assertEqual(2);
      expect(arr[2][1]).assertEqual(20);
      console.log('test_make_int_pair_array done');
      done();
      console.log('test_make_int_pair_array end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0200
     * @tc.name      test_sum_int_pair_array
     * @tc.desc      Sum all IntPair values in an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_sum_int_pair_array", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_sum_int_pair_array start');
      let arr: Array<TupleTest.IntPair> = [[1, 2], [3, 4], [5, 6]];
      let total = TupleTest.sumIntPairArray(arr);
      expect(total).assertEqual(21);
      console.log('test_sum_int_pair_array done');
      done();
      console.log('test_sum_int_pair_array end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0300
     * @tc.name      test_make_array_tuple
     * @tc.desc      Create ArrayTuple containing label and Array<i32>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_array_tuple", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_array_tuple start');
      let t = TupleTest.makeArrayTuple("data", 3);
      expect(t[0]).assertEqual("data");
      expect(t[1].length).assertEqual(3);
      expect(t[1][0]).assertEqual(10);
      expect(t[1][1]).assertEqual(20);
      expect(t[1][2]).assertEqual(30);
      console.log('test_make_array_tuple done');
      done();
      console.log('test_make_array_tuple end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0400
     * @tc.name      test_sum_array_tuple
     * @tc.desc      Sum array values in ArrayTuple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_sum_array_tuple", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_sum_array_tuple start');
      let values: int[] = [10, 20, 30];
      let t: TupleTest.ArrayTuple = ["result", values];
      let desc = TupleTest.sumArrayTuple(t);
      expect(desc).assertEqual("result:60");
      console.log('test_sum_array_tuple done');
      done();
      console.log('test_sum_array_tuple end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0500
     * @tc.name      test_transpose_my_tuple4x4
     * @tc.desc      Transpose a 4x4 matrix of MyTuple4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_transpose_my_tuple4x4", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_transpose_my_tuple4x4 start');
      let a: TupleTest.MyTuple4 = [1, 2, 3, 4];
      let b: TupleTest.MyTuple4 = [5, 6, 7, 8];
      let c: TupleTest.MyTuple4 = [9, 10, 11, 12];
      let d: TupleTest.MyTuple4 = [13, 14, 15, 16];
      let t: TupleTest.MyTuple4x4 = [a, b, c, d];
      let transposed = TupleTest.transposeMyTuple4x4(t);
      expect(transposed[0][0]).assertEqual(t[0][0]);
      expect(transposed[0][1]).assertEqual(t[1][0]);
      expect(transposed[0][2]).assertEqual(t[2][0]);
      expect(transposed[0][3]).assertEqual(t[3][0]);
      expect(transposed[1][0]).assertEqual(t[0][1]);
      expect(transposed[1][1]).assertEqual(t[1][1]);
      expect(transposed[1][2]).assertEqual(t[2][1]);
      expect(transposed[1][3]).assertEqual(t[3][1]);
      expect(transposed[2][0]).assertEqual(t[0][2]);
      expect(transposed[2][1]).assertEqual(t[1][2]);
      expect(transposed[2][2]).assertEqual(t[2][2]);
      expect(transposed[2][3]).assertEqual(t[3][2]);
      expect(transposed[3][0]).assertEqual(t[0][3]);
      expect(transposed[3][1]).assertEqual(t[1][3]);
      expect(transposed[3][2]).assertEqual(t[2][3]);
      expect(transposed[3][3]).assertEqual(t[3][3]);
      console.log('test_transpose_my_tuple4x4 done');
      done();
      console.log('test_transpose_my_tuple4x4 end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0600
     * @tc.name      test_transpose_my_tuple4_array
     * @tc.desc      Transpose MyTuple4Array to Array<MyTuple4>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_transpose_my_tuple4_array", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_transpose_my_tuple4_array start');
      let t: TupleTest.MyTuple4Array = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16],
      ];
      let transposed = TupleTest.transposeMyTuple4Array(t);
      for (let i = 0; i < 4; i++) {
      expect(transposed[i][0]).assertEqual(t[0][i]);
      expect(transposed[i][1]).assertEqual(t[1][i]);
      expect(transposed[i][2]).assertEqual(t[2][i]);
      expect(transposed[i][3]).assertEqual(t[3][i]);
      }
      console.log('test_transpose_my_tuple4_array done');
      done();
      console.log('test_transpose_my_tuple4_array end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0700
     * @tc.name      test_transpose_array_my_tuple4
     * @tc.desc      Transpose Array<MyTuple4> back to MyTuple4Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_transpose_array_my_tuple4", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_transpose_array_my_tuple4 start');
      let t: Array<TupleTest.MyTuple4> = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16],
      ];
      let transposed = TupleTest.transposeArrayMyTuple4(t);
      for (let i = 0; i < 4; i++) {
      expect(transposed[0][i]).assertEqual(t[i][0]);
      expect(transposed[1][i]).assertEqual(t[i][1]);
      expect(transposed[2][i]).assertEqual(t[i][2]);
      expect(transposed[3][i]).assertEqual(t[i][3]);
      }
      console.log('test_transpose_array_my_tuple4 done');
      done();
      console.log('test_transpose_array_my_tuple4 end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0800
     * @tc.name      test_make_my_tuple16
     * @tc.desc      Create MyTuple16 with 16 fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_my_tuple16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_my_tuple16 start');
      let t = TupleTest.makeMyTuple16(
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
      expect(t[0]).assertEqual(1);
      expect(t[1]).assertEqual(2);
      expect(t[2]).assertEqual(3);
      expect(t[3]).assertEqual(4);
      expect(t[4]).assertEqual(5);
      expect(t[5]).assertEqual(6);
      expect(t[6]).assertEqual(7);
      expect(t[7]).assertEqual(8);
      expect(t[8]).assertEqual(9);
      expect(t[9]).assertEqual(10);
      expect(t[10]).assertEqual(11);
      expect(t[11]).assertEqual(12);
      expect(t[12]).assertEqual(13);
      expect(t[13]).assertEqual(14);
      expect(t[14]).assertEqual(15);
      expect(t[15]).assertEqual(16);
      console.log('test_make_my_tuple16 done');
      done();
      console.log('test_make_my_tuple16 end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_0900
     * @tc.name      test_sum_my_tuple16
     * @tc.desc      Sum all fields of MyTuple16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_sum_my_tuple16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_sum_my_tuple16 start');
      let t: TupleTest.MyTuple16 =
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
      let sum = 0;
      sum += t[0] + t[1] + t[2] + t[3];
      sum += t[4] + t[5] + t[6] + t[7];
      sum += t[8] + t[9] + t[10] + t[11];
      sum += t[12] + t[13] + t[14] + t[15];
      let result = TupleTest.sumMyTuple16(t);
      expect(result).assertEqual(sum);
      console.log('test_sum_my_tuple16 done');
      done();
      console.log('test_sum_my_tuple16 end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_1000
     * @tc.name      test_make_single_field_tuple
     * @tc.desc      Create SingleFieldTuple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_single_field_tuple", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_single_field_tuple start');
      let t = TupleTest.makeSingleFieldTuple(42);
      expect(t[0]).assertEqual(42);
      console.log('test_make_single_field_tuple done');
      done();
      console.log('test_make_single_field_tuple end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_array_STATIC_1100
     * @tc.name      test_get_single_field_value
     * @tc.desc      Get value from SingleFieldTuple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_get_single_field_value", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_get_single_field_value start');
      let t: TupleTest.SingleFieldTuple = [99];
      let v = TupleTest.getSingleFieldValue(t);
      expect(v).assertEqual(99);
      console.log('test_get_single_field_value done');
      done();
      console.log('test_get_single_field_value end');

    })
  })
}