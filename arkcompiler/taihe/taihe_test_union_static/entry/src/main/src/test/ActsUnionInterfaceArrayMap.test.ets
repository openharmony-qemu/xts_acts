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

export default function actsUnionInterfaceArrayMapTest(): void {
  describe("ActsUnionInterfaceArrayMap", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0100
     * @tc.name      test_func_union_array_map1
     * @tc.desc      FuncUnionArrayMap1 with Array<i8> and Record<String, i8>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map1 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores: Record<String, byte> = {
      "math": (90).toByte(),
      "english": (85).toByte(),
      "science": (95).toByte(),
      };
      let res = instance.funcUnionArrayMap1(arri8, scores);
      expect(res).assertEqual("func_union_array_map1");
      console.log('test_func_union_array_map1 done');
      done();
      console.log('test_func_union_array_map1 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0200
     * @tc.name      test_func_union_array_map2
     * @tc.desc      FuncUnionArrayMap2 with Array<i8> and Record<String, i16>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map2 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores: Record<String, short> = {
      "math": (90).toShort(),
      "english": (85).toShort(),
      "science": (95).toShort(),
      };
      let res = instance.funcUnionArrayMap2(arri8, scores);
      expect(res).assertEqual("func_union_array_map2");
      console.log('test_func_union_array_map2 done');
      done();
      console.log('test_func_union_array_map2 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0300
     * @tc.name      test_func_union_array_map3
     * @tc.desc      FuncUnionArrayMap3 with Array<i8> and Record<String, i32>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map3", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map3 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores: Record<String, int> = {
      "math": (90).toInt(),
      "english": (85).toInt(),
      "science": (95).toInt(),
      };
      let res = instance.funcUnionArrayMap3(arri8, scores);
      expect(res).assertEqual("func_union_array_map3");
      console.log('test_func_union_array_map3 done');
      done();
      console.log('test_func_union_array_map3 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0400
     * @tc.name      test_func_union_array_map4
     * @tc.desc      FuncUnionArrayMap4 with Array<i8> and Record<String, i64>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map4", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map4 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores: Record<String, long> = {
      "math": (90).toLong(),
      "english": (85).toLong(),
      };
      let res = instance.funcUnionArrayMap4(arri8, scores);
      expect(res).assertEqual("func_union_array_map4");
      console.log('test_func_union_array_map4 done');
      done();
      console.log('test_func_union_array_map4 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0500
     * @tc.name      test_func_union_array_map5
     * @tc.desc      FuncUnionArrayMap5 with Array<i8> and Record<String, f32>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map5", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map5 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores: Record<String, float> = {"math": 123.45f, "english": 57.89f};
      let res = instance.funcUnionArrayMap5(arri8, scores);
      expect(res).assertEqual("func_union_array_map5");
      console.log('test_func_union_array_map5 done');
      done();
      console.log('test_func_union_array_map5 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0600
     * @tc.name      test_func_union_array_map6
     * @tc.desc      FuncUnionArrayMap6 with Array<i8> and Record<String, f64>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map6", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map6 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores: Record<String, number> = {
      "math": (90.5).toDouble(),
      "english": (85.3).toDouble(),
      };
      let res = instance.funcUnionArrayMap6(arri8, scores);
      expect(res).assertEqual("func_union_array_map6");
      console.log('test_func_union_array_map6 done');
      done();
      console.log('test_func_union_array_map6 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0700
     * @tc.name      test_func_union_array_map7
     * @tc.desc      FuncUnionArrayMap7 with Array<i8> and Record<String, bool>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map7", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map7 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const passed: Record<String, boolean> = {"math": true, "english": false};
      let res = instance.funcUnionArrayMap7(arri8, passed);
      expect(res).assertEqual("func_union_array_map7");
      console.log('test_func_union_array_map7 done');
      done();
      console.log('test_func_union_array_map7 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0800
     * @tc.name      test_func_union_array_map8
     * @tc.desc      FuncUnionArrayMap8 with Array<i8> and Record<String, String>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map8 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const names: Record<String, String> = {"math": "Algebra", "english": "Literature"};
      let res = instance.funcUnionArrayMap8(arri8, names);
      expect(res).assertEqual("func_union_array_map8");
      console.log('test_func_union_array_map8 done');
      done();
      console.log('test_func_union_array_map8 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_0900
     * @tc.name      test_func_union_array_map9
     * @tc.desc      FuncUnionArrayMap9 with Array<i8> and Record<i32, i32>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map9", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map9 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const names: Record<int, int> = {1: 99, 2: 100};
      let res = instance.funcUnionArrayMap9(arri8, names);
      expect(res).assertEqual("func_union_array_map9");
      console.log('test_func_union_array_map9 done');
      done();
      console.log('test_func_union_array_map9 end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfacearraymap_STATIC_1000
     * @tc.name      test_func_union_array_map10
     * @tc.desc      FuncUnionArrayMap10 with mixed UnionArrayMap1 and UnionArrayMap2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_union_array_map10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_union_array_map10 start');
      let arri8: byte[] = [1, 2, 3, 4];
      const scores2: Record<String, short> = {
      "math": (90).toShort(),
      "english": (85).toShort(),
      "science": (95).toShort(),
      };
      let res = instance.funcUnionArrayMap10(arri8, arri8);
      expect(res).assertEqual("func_union_array_map10");
      let res2 = instance.funcUnionArrayMap10(arri8, scores2);
      expect(res2).assertEqual("func_union_array_map10");
      console.log('test_func_union_array_map10 done');
      done();
      console.log('test_func_union_array_map10 end');

    })
  })
}