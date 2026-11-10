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

class MyPrintable implements TupleTest.Printable {
    private value: String;
    constructor(value: String) {
        this.value = value;
    }
    print(): String {
        return "MyPrintable(" + this.value + ")";
    }
}

export default function actsTupleNestedTest(): void {
  describe("ActsTupleNested", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Tuple_nested_STATIC_0100
     * @tc.name      test_make_outer_tuple
     * @tc.desc      Create nested OuterTuple -> MiddleTuple -> InnerTuple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_outer_tuple", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_outer_tuple start');
      let t = TupleTest.makeOuterTuple(1, 2, 3, "test");
      expect(t[0]).assertEqual(1);
      expect(t[1][0]).assertEqual(2);
      expect(t[1][1][0]).assertEqual(3);
      expect(t[1][1][1]).assertEqual("test");
      console.log('test_make_outer_tuple done');
      done();
      console.log('test_make_outer_tuple end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_nested_STATIC_0200
     * @tc.name      test_describe_outer_tuple
     * @tc.desc      Describe nested OuterTuple as formatted string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_describe_outer_tuple", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_describe_outer_tuple start');
      let t: TupleTest.OuterTuple = [10, [20, [30, "hello"]]];
      let desc = TupleTest.describeOuterTuple(t);
      expect(desc).assertEqual("[10,[20,[30,hello]]]");
      console.log('test_describe_outer_tuple done');
      done();
      console.log('test_describe_outer_tuple end');

    })

    /**
     * @tc.number    SUB_Taihe_Tuple_nested_STATIC_0300
     * @tc.name      test_describe_complex_tuple
     * @tc.desc      Describe ComplexTuple with enum, struct, union, interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_describe_complex_tuple", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_describe_complex_tuple start');
      let t: TupleTest.ComplexTuple = [
      TupleTest.Color.Green,
      {x: 1.5, y: 2.5},
      "Alice",
      new MyPrintable("data"),
      ];
      let desc = TupleTest.describeComplexTuple(t);
      expect(desc).assertEqual("[1,{x:1.5,y:2.5},Alice,MyPrintable(data)]");
      console.log('test_describe_complex_tuple done');
      done();
      console.log('test_describe_complex_tuple end');

    })
  })
}