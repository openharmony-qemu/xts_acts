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

export default function actsUnionInterfaceEnumMapTest(): void {
  describe("ActsUnionInterfaceEnumMap", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0100
     * @tc.name      test_func_color_map_value1_enum
     * @tc.desc      FuncColorMapValue1 with Color enum value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value1_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value1_enum start');
      let color = UnionTest1.Color.RED;
      let res = instance.funcColorMapValue1(color);
      expect(res).assertEqual("func_color_map_value1");
      console.log('test_func_color_map_value1_enum done');
      done();
      console.log('test_func_color_map_value1_enum end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0200
     * @tc.name      test_func_color_map_value1_map
     * @tc.desc      FuncColorMapValue1 with Record<String, i8> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value1_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value1_map start');
      const scores: Record<String, byte> = {
      "math": (90).toByte(),
      "english": (85).toByte(),
      "science": (95).toByte(),
      };
      let res = instance.funcColorMapValue1(scores);
      expect(res).assertEqual("func_color_map_value1");
      console.log('test_func_color_map_value1_map done');
      done();
      console.log('test_func_color_map_value1_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0300
     * @tc.name      test_func_color_map_value2_enum
     * @tc.desc      FuncColorMapValue2 with Color enum value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value2_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value2_enum start');
      let color = UnionTest1.Color.RED;
      let res = instance.funcColorMapValue2(color);
      expect(res).assertEqual("func_color_map_value2");
      console.log('test_func_color_map_value2_enum done');
      done();
      console.log('test_func_color_map_value2_enum end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0400
     * @tc.name      test_func_color_map_value2_map
     * @tc.desc      FuncColorMapValue2 with Record<String, i16> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value2_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value2_map start');
      const scores: Record<String, short> = {
      "math": (90).toShort(),
      "english": (85).toShort(),
      "science": (95).toShort(),
      };
      let res = instance.funcColorMapValue2(scores);
      expect(res).assertEqual("func_color_map_value2");
      console.log('test_func_color_map_value2_map done');
      done();
      console.log('test_func_color_map_value2_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0500
     * @tc.name      test_func_color_map_value3_map
     * @tc.desc      FuncColorMapValue3 with Record<String, i32> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value3_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value3_map start');
      const scores: Record<String, int> = {
      "math": (90).toInt(),
      "english": (85).toInt(),
      "science": (95).toInt(),
      };
      let res = instance.funcColorMapValue3(scores);
      expect(res).assertEqual("func_color_map_value3");
      console.log('test_func_color_map_value3_map done');
      done();
      console.log('test_func_color_map_value3_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0600
     * @tc.name      test_func_color_map_value4_map
     * @tc.desc      FuncColorMapValue4 with Record<String, i64> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value4_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value4_map start');
      const scores: Record<String, long> = {
      "math": (90).toLong(),
      "english": (85).toLong(),
      };
      let res = instance.funcColorMapValue4(scores);
      expect(res).assertEqual("func_color_map_value4");
      console.log('test_func_color_map_value4_map done');
      done();
      console.log('test_func_color_map_value4_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0700
     * @tc.name      test_func_color_map_value5_map
     * @tc.desc      FuncColorMapValue5 with Record<String, f32> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value5_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value5_map start');
      const scores: Record<String, float> = {
      "math": 123.45f,
      "english": 57.89f,
      };
      let res = instance.funcColorMapValue5(scores);
      expect(res).assertEqual("func_color_map_value5");
      console.log('test_func_color_map_value5_map done');
      done();
      console.log('test_func_color_map_value5_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0800
     * @tc.name      test_func_color_map_value6_map
     * @tc.desc      FuncColorMapValue6 with Record<String, f64> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value6_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value6_map start');
      const scores: Record<String, number> = {
      "math": (90.5).toDouble(),
      "english": (85.3).toDouble(),
      };
      let res = instance.funcColorMapValue6(scores);
      expect(res).assertEqual("func_color_map_value6");
      console.log('test_func_color_map_value6_map done');
      done();
      console.log('test_func_color_map_value6_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_0900
     * @tc.name      test_func_color_map_value7_map
     * @tc.desc      FuncColorMapValue7 with Record<String, bool> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value7_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value7_map start');
      const passed: Record<String, boolean> = {"math": true, "english": false};
      let res = instance.funcColorMapValue7(passed);
      expect(res).assertEqual("func_color_map_value7");
      console.log('test_func_color_map_value7_map done');
      done();
      console.log('test_func_color_map_value7_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_1000
     * @tc.name      test_func_color_map_value8_map
     * @tc.desc      FuncColorMapValue8 with Record<String, String> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value8_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value8_map start');
      const names: Record<String, String> = {"math": "Algebra", "english": "Literature"};
      let res = instance.funcColorMapValue8(names);
      expect(res).assertEqual("func_color_map_value8");
      console.log('test_func_color_map_value8_map done');
      done();
      console.log('test_func_color_map_value8_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_1100
     * @tc.name      test_func_color_map_value9_map
     * @tc.desc      FuncColorMapValue9 with Record<i32, i32> map value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value9_map", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value9_map start');
      const scores: Record<int, int> = {100: (90).toInt(), 200: (85).toInt()};
      let res = instance.funcColorMapValue9(scores);
      expect(res).assertEqual("func_color_map_value9");
      console.log('test_func_color_map_value9_map done');
      done();
      console.log('test_func_color_map_value9_map end');

    })

    /**
     * @tc.number    SUB_Taihe_Union_interfaceenummap_STATIC_1200
     * @tc.name      test_func_color_map_value10
     * @tc.desc      FuncColorMapValue10 with two color_map_value9 params.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_func_color_map_value10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_func_color_map_value10 start');
      const scores: Record<int, int> = {100: (90).toInt(), 200: (85).toInt()};
      let res = instance.funcColorMapValue10(scores, scores);
      expect(res).assertEqual("func_color_map_value10");
      console.log('test_func_color_map_value10 done');
      done();
      console.log('test_func_color_map_value10 end');

    })
  })
}