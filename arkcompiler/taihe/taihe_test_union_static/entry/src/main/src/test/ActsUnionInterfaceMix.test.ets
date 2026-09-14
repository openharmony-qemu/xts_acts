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

export default function actsUnionInterfaceMixTest(): void {
  describe("ActsUnionInterfaceMix", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0100
     * @tc.name      test_func_union_mix
     * @tc.desc      FuncUnionMix with 5 union_mix params of different types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix start');
      let arri8: byte[] = [1, 2, 3, 4];
      let color = UnionTest1.Color.RED;
      let res = instance.funcUnionMix(arri8, "hello", color, (1).toByte(), true);
      expect(res).assertEqual("func_union_mix");
      console.log('test_func_union_mix done');
      done();
      console.log('test_func_union_mix end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0200
     * @tc.name      test_func_union_mix_10param_1
     * @tc.desc      FuncUnionMix10Param with 10 params (array first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix_10param_1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix_10param_1 start');
      let arri8: byte[] = [1, 2, 3, 4];
      let color = UnionTest1.Color.RED;
      let res = instance.funcUnionMix10Param(
      arri8, "hello", color, (1).toByte(), true, (5000).toInt(),
      (1.0).toDouble(), (50).toShort(), (10).toByte(), "epsilon");
      expect(res).assertEqual("func_union_mix_10param");
      console.log('test_func_union_mix_10param_1 done');
      done();
      console.log('test_func_union_mix_10param_1 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0300
     * @tc.name      test_func_union_mix_10param_2
     * @tc.desc      FuncUnionMix10Param with 10 params (string first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix_10param_2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix_10param_2 start');
      let arri8: byte[] = [1, 2, 3, 4];
      let color = UnionTest1.Color.RED;
      let res = instance.funcUnionMix10Param(
      "hello", arri8, (1).toByte(), color, true, (1.0).toDouble(),
      (5000).toInt(), (50).toShort(), (10).toByte(), "epsilon");
      expect(res).assertEqual("func_union_mix_10param");
      console.log('test_func_union_mix_10param_2 done');
      done();
      console.log('test_func_union_mix_10param_2 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0400
     * @tc.name      test_func_union_mix_10param_3
     * @tc.desc      FuncUnionMix10Param with 10 params (color first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix_10param_3", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix_10param_3 start');
      let arri8: byte[] = [1, 2, 3, 4];
      let color = UnionTest1.Color.RED;
      let res = instance.funcUnionMix10Param(
      color, true, arri8, (1).toByte(), "hello", (50).toShort(),
      (5000).toInt(), (1.0).toDouble(), (10).toByte(), "epsilon");
      expect(res).assertEqual("func_union_mix_10param");
      console.log('test_func_union_mix_10param_3 done');
      done();
      console.log('test_func_union_mix_10param_3 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0500
     * @tc.name      test_func_union_mix_10param_4
     * @tc.desc      FuncUnionMix10Param with 10 params (bool first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix_10param_4", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix_10param_4 start');
      let arri8: byte[] = [1, 2, 3, 4];
      let color = UnionTest1.Color.RED;
      let res = instance.funcUnionMix10Param(
      true, (1.0).toDouble(), (5000).toInt(), (50).toShort(), (50).toShort(),
      "epsilon", arri8, "hello", color, (1).toByte());
      expect(res).assertEqual("func_union_mix_10param");
      console.log('test_func_union_mix_10param_4 done');
      done();
      console.log('test_func_union_mix_10param_4 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0600
     * @tc.name      test_func_union_mix_10param_5
     * @tc.desc      FuncUnionMix10Param with 10 params (int first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix_10param_5", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix_10param_5 start');
      let arri8: byte[] = [1, 2, 3, 4];
      let color = UnionTest1.Color.RED;
      let res = instance.funcUnionMix10Param(
      (5000).toInt(), (1.0).toDouble(), (50).toShort(), (50).toShort(),
      "epsilon", arri8, "hello", color, (1).toByte(), true);
      expect(res).assertEqual("func_union_mix_10param");
      console.log('test_func_union_mix_10param_5 done');
      done();
      console.log('test_func_union_mix_10param_5 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0700
     * @tc.name      test_func_union_mix5_return_string
     * @tc.desc      FuncUnionMix5Return with kind "s" returns string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix5_return_string", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix5_return_string start');
      let res = instance.funcUnionMix5Return("s");
      expect(res).assertEqual("hello");
      console.log('test_func_union_mix5_return_string done');
      done();
      console.log('test_func_union_mix5_return_string end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0800
     * @tc.name      test_func_union_mix5_return_i8
     * @tc.desc      FuncUnionMix5Return with kind "i8" returns i8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix5_return_i8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix5_return_i8 start');
      let res = instance.funcUnionMix5Return("i8");
      expect(res).assertEqual(1);
      console.log('test_func_union_mix5_return_i8 done');
      done();
      console.log('test_func_union_mix5_return_i8 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_0900
     * @tc.name      test_func_union_mix5_return_bool
     * @tc.desc      FuncUnionMix5Return with kind "b" returns bool.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix5_return_bool", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix5_return_bool start');
      let res = instance.funcUnionMix5Return("b");
      expect(res).assertEqual(true);
      console.log('test_func_union_mix5_return_bool done');
      done();
      console.log('test_func_union_mix5_return_bool end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_1000
     * @tc.name      test_func_union_mix5_return_enum
     * @tc.desc      FuncUnionMix5Return with kind "c" returns Color enum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix5_return_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix5_return_enum start');
      let res = instance.funcUnionMix5Return("c");
      expect(res).assertEqual(UnionTest1.Color.GREEN);
      console.log('test_func_union_mix5_return_enum done');
      done();
      console.log('test_func_union_mix5_return_enum end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_1100
     * @tc.name      test_func_union_mix5_return_array
     * @tc.desc      FuncUnionMix5Return with kind "arr" returns Array<i32>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix5_return_array", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix5_return_array start');
      let res = instance.funcUnionMix5Return("arr") as int[];
      expect(res.length).assertEqual(5);
      expect(res[0]).assertEqual(3);
      console.log('test_func_union_mix5_return_array done');
      done();
      console.log('test_func_union_mix5_return_array end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacemix_STATIC_1200
     * @tc.name      test_func_union_mix10_return
     * @tc.desc      FuncUnionMix10Return returns bool value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_mix10_return", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_mix10_return start');
      let res = instance.funcUnionMix10Return("b");
      expect(res).assertEqual(true);
      console.log('test_func_union_mix10_return done');
      done();
      console.log('test_func_union_mix10_return end');

    })
  })
}