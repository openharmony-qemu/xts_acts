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

export default function actsTupleBasicTest(): void {
  describe("ActsTupleBasic", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0100
     * @tc.name      test_make_int_pair
     * @tc.desc      Create IntPair via makeIntPair and verify fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_int_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_int_pair start');
      let pair: TupleTest.IntPair = TupleTest.makeIntPair(10, 20);
      expect(pair[0]).assertEqual(10);
      expect(pair[1]).assertEqual(20);
      console.log('test_make_int_pair done');
      done();
      console.log('test_make_int_pair end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0200
     * @tc.name      test_sum_int_pair
     * @tc.desc      Pass IntPair into sumIntPair and verify sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_sum_int_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_sum_int_pair start');
      let pair: TupleTest.IntPair = [3, 7];
      let sum = TupleTest.sumIntPair(pair);
      expect(sum).assertEqual(10);
      console.log('test_sum_int_pair done');
      done();
      console.log('test_sum_int_pair end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0300
     * @tc.name      test_swap_int_pair
     * @tc.desc      Roundtrip IntPair via swapIntPair.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_swap_int_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_swap_int_pair start');
      let pair: TupleTest.IntPair = [100, 200];
      let swapped = TupleTest.swapIntPair(pair);
      expect(swapped[0]).assertEqual(200);
      expect(swapped[1]).assertEqual(100);
      console.log('test_swap_int_pair done');
      done();
      console.log('test_swap_int_pair end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0400
     * @tc.name      test_process_mixed
     * @tc.desc      Process MixedTuple with all primitive types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_process_mixed", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_process_mixed start');
      let m: TupleTest.MixedTuple = [
      (1 as byte),
      (2 as short),
      3,
      (4 as long),
      5.0,
      6.0,
      true,
      ];
      let result = TupleTest.processMixed(m);
      expect(result[0]).assertEqual((2 as byte));
      expect(result[1]).assertEqual((4 as short));
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8 as long);
      expect(result[4] > 9.9 && result[4] < 10.1).assertTrue();
      expect(result[5] > 11.9 && result[5] < 12.1).assertTrue();
      expect(result[6]).assertEqual(false);
      console.log('test_process_mixed done');
      done();
      console.log('test_process_mixed end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0500
     * @tc.name      test_make_string_pair
     * @tc.desc      Create StringPair via makeStringPair.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_string_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_string_pair start');
      let pair = TupleTest.makeStringPair("hello", "world");
      expect(pair[0]).assertEqual("hello");
      expect(pair[1]).assertEqual("world");
      console.log('test_make_string_pair done');
      done();
      console.log('test_make_string_pair end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0600
     * @tc.name      test_concat_string_pair
     * @tc.desc      Concat StringPair fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_concat_string_pair", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_concat_string_pair start');
      let pair: TupleTest.StringPair = ["foo", "bar"];
      let result = TupleTest.concatStringPair(pair);
      expect(result).assertEqual("foo:bar");
      console.log('test_concat_string_pair done');
      done();
      console.log('test_concat_string_pair end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0700
     * @tc.name      test_make_mixed_ref
     * @tc.desc      Create MixedRefTuple with mixed ref and primitive types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_mixed_ref", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_mixed_ref start');
      let metadata = new Record<string, string>();
      metadata["key1"] = "value1";
      metadata["key2"] = "value2";
      let t = TupleTest.makeMixedRef("Alice", 30, 95.5, true, metadata);
      expect(t[0]).assertEqual("Alice");
      expect(t[1]).assertEqual(30);
      expect(t[2] > 95.4 && t[2] < 95.6).assertTrue();
      expect(t[3]).assertEqual(true);
      expect(t[4]["key1"]).assertEqual("value1");
      expect(t[4]["key2"]).assertEqual("value2");
      expect(t[5]).assertEqual(undefined);
      console.log('test_make_mixed_ref done');
      done();
      console.log('test_make_mixed_ref end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_basic_STATIC_0800
     * @tc.name      test_describe_mixed_ref
     * @tc.desc      Describe MixedRefTuple with callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_describe_mixed_ref", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_describe_mixed_ref start');
      let metadata = new Record<string, string>();
      metadata["info"] = "data";
      let t: TupleTest.MixedRefTuple = [
      "Bob", 25, 88.0, false, metadata,
      (data: String) => {
      console.log("Callback: " + data);
      }
      ];
      let desc = TupleTest.describeMixedRef(t);
      expect(desc).assertEqual("[Bob,25,88,false,{info:data,},callback]");
      console.log('test_describe_mixed_ref done');
      done();
      console.log('test_describe_mixed_ref end');

    })
  })
}