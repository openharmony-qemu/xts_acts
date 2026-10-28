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
import * as test_array from '../ets/Index'

export default function arrayInterfaceTest(): void {
  describe("ActsArrayInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let arrayI8: test_array.ArrayI8 = test_array.getArrayI8();
    let arrayI16: test_array.ArrayI16 = test_array.getArrayI16();
    let arrayI32: test_array.ArrayI32 = test_array.getArrayI32();
    let arrayI64: test_array.ArrayI64 = test_array.getArrayI64();
    let arrayF32: test_array.ArrayF32 = test_array.getArrayF32();
    let arrayF64: test_array.ArrayF64 = test_array.getArrayF64();
    let arrayString: test_array.ArrayString = test_array.getArrayString();
    let arrayBool: test_array.ArrayBool = test_array.getArrayBool();
    let arrayEnum: test_array.ArrayEnum = test_array.getArrayEnum();
    let arrayRecord: test_array.ArrayRecord = test_array.getArrayRecord();
    let arrayRecordStrI8: test_array.ArrayRecordStrI8 = test_array.getArrayRecordStrI8();
    let arrayRecordStrF32: test_array.ArrayRecordStrF32 = test_array.getArrayRecordStrF32();
    let arrayRecordStrF64: test_array.ArrayRecordStrF64 = test_array.getArrayRecordStrF64();
    let arrayRecordStrBool: test_array.ArrayRecordStrBool = test_array.getArrayRecordStrBool();
    let arrayUnion: test_array.ArrayUnion = test_array.getArrayUnion();
    let arrayNest: test_array.ArrayNest = test_array.getArrayNest();
    let arrayOptional: test_array.ArrayOptional = test_array.getArrayOptional();

    /**
     * @tc.number    SUB_Taihe_ArrayI8_STATIC_0100
     * @tc.name      test_ArrayI8Value_Static_0001
     * @tc.desc      ArrayI8 interface returns byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI8Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI8Value_Static_0001 start');
      let info = arrayI8.arrayI8Value((127).toByte());
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual((127).toByte());
      expect(info[1]).assertEqual((127).toByte());
      expect(info[2]).assertEqual((127).toByte());
      console.log('test_ArrayI8Value_Static_0001 done');
      done();
      console.log('test_ArrayI8Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI16_STATIC_0100
     * @tc.name      test_ArrayI16Value_Static_0001
     * @tc.desc      ArrayI16 interface returns short array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI16Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI16Value_Static_0001 start');
      let info = arrayI16.arrayI16Value((-32768).toShort());
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual((-32768).toShort());
      expect(info[1]).assertEqual((-32768).toShort());
      expect(info[2]).assertEqual((-32768).toShort());
      console.log('test_ArrayI16Value_Static_0001 done');
      done();
      console.log('test_ArrayI16Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI32_STATIC_0100
     * @tc.name      test_ArrayI32Value_Static_0001
     * @tc.desc      ArrayI32 interface returns int array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI32Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI32Value_Static_0001 start');
      let info = arrayI32.arrayI32Value((2147483647).toInt());
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual(2147483647);
      expect(info[1]).assertEqual(2147483647);
      expect(info[2]).assertEqual(2147483647);
      console.log('test_ArrayI32Value_Static_0001 done');
      done();
      console.log('test_ArrayI32Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI64_STATIC_0100
     * @tc.name      test_ArrayI64Value_Static_0001
     * @tc.desc      ArrayI64 interface returns long array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI64Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI64Value_Static_0001 start');
      let info = arrayI64.arrayI64Value((-9223372036854775808).toLong());
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual((-9223372036854775808).toLong());
      expect(info[1]).assertEqual((-9223372036854775808).toLong());
      expect(info[2]).assertEqual((-9223372036854775808).toLong());
      console.log('test_ArrayI64Value_Static_0001 done');
      done();
      console.log('test_ArrayI64Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF32_STATIC_0100
     * @tc.name      test_ArrayF32Value_Static_0001
     * @tc.desc      ArrayF32 interface returns float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF32Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF32Value_Static_0001 start');
      let info = arrayF32.arrayF32Value((202510.25).toFloat());
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual((202510.25).toFloat());
      expect(info[1]).assertEqual((202510.25).toFloat());
      expect(info[2]).assertEqual((202510.25).toFloat());
      console.log('test_ArrayF32Value_Static_0001 done');
      done();
      console.log('test_ArrayF32Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF64_STATIC_0100
     * @tc.name      test_ArrayF64Value_Static_0001
     * @tc.desc      ArrayF64 interface returns double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF64Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF64Value_Static_0001 start');
      let info = arrayF64.arrayF64Value((20250521.1027).toDouble());
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual((20250521.1027).toDouble());
      expect(info[1]).assertEqual((20250521.1027).toDouble());
      expect(info[2]).assertEqual((20250521.1027).toDouble());
      console.log('test_ArrayF64Value_Static_0001 done');
      done();
      console.log('test_ArrayF64Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayString_STATIC_0100
     * @tc.name      test_ArrayStringValue_Static_0001
     * @tc.desc      ArrayString interface returns string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayStringValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayStringValue_Static_0001 start');
      let info = arrayString.arrayStringValue("20250521.1035");
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual("20250521.1035");
      expect(info[1]).assertEqual("20250521.1035");
      expect(info[2]).assertEqual("20250521.1035");
      console.log('test_ArrayStringValue_Static_0001 done');
      done();
      console.log('test_ArrayStringValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayBool_STATIC_0100
     * @tc.name      test_ArrayBoolValue_Static_0001
     * @tc.desc      ArrayBool interface returns boolean array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBoolValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBoolValue_Static_0001 start');
      let info = arrayBool.arrayBoolValue(true);
      expect(info.length).assertEqual(3);
      expect(info[0]).assertTrue();
      expect(info[1]).assertTrue();
      expect(info[2]).assertTrue();
      console.log('test_ArrayBoolValue_Static_0001 done');
      done();
      console.log('test_ArrayBoolValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayEnum_STATIC_0100
     * @tc.name      test_ArrayEnumValue_Static_0001
     * @tc.desc      ArrayEnum interface returns enum array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayEnumValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayEnumValue_Static_0001 start');
      let info = arrayEnum.arrayEnumValue("Color");
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual(test_array.Color.RED);
      expect(info[1]).assertEqual(test_array.Color.GREEN);
      expect(info[2]).assertEqual(test_array.Color.BLUE);
      console.log('test_ArrayEnumValue_Static_0001 done');
      done();
      console.log('test_ArrayEnumValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayRecord_STATIC_0100
     * @tc.name      test_ArrayRecordValue_Static_0001
     * @tc.desc      ArrayRecord interface returns record array with long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayRecordValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayRecordValue_Static_0001 start');
      let info = arrayRecord.arrayRecordValue("Color", (255).toLong());
      expect(info.length).assertEqual(3);
      for (let i = 0; i < info.length; i++) {
        expect(info[i].size).assertEqual(1);
        expect(info[i]["Color"]).assertEqual((255).toLong());
      }
      console.log('test_ArrayRecordValue_Static_0001 done');
      done();
      console.log('test_ArrayRecordValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayRecordStrI8_STATIC_0100
     * @tc.name      test_ArrayRecordStrI8Value_Static_0001
     * @tc.desc      ArrayRecordStrI8 interface returns record array with byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayRecordStrI8Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayRecordStrI8Value_Static_0001 start');
      let info = arrayRecordStrI8.arrayRecordValue("Color", (127).toByte());
      expect(info.length).assertEqual(3);
      for (let i = 0; i < info.length; i++) {
        expect(info[i].size).assertEqual(1);
        expect(info[i]["Color"]).assertEqual((127).toByte());
      }
      console.log('test_ArrayRecordStrI8Value_Static_0001 done');
      done();
      console.log('test_ArrayRecordStrI8Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayRecordStrF32_STATIC_0100
     * @tc.name      test_ArrayRecordStrF32Value_Static_0001
     * @tc.desc      ArrayRecordStrF32 interface returns record array with float value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayRecordStrF32Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayRecordStrF32Value_Static_0001 start');
      let info = arrayRecordStrF32.arrayRecordValue("Color", (52115.24).toFloat());
      expect(info.length).assertEqual(3);
      for (let i = 0; i < info.length; i++) {
        expect(info[i].size).assertEqual(1);
        expect(info[i]["Color"]).assertEqual((52115.24).toFloat());
      }
      console.log('test_ArrayRecordStrF32Value_Static_0001 done');
      done();
      console.log('test_ArrayRecordStrF32Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayRecordStrF64_STATIC_0100
     * @tc.name      test_ArrayRecordStrF64Value_Static_0001
     * @tc.desc      ArrayRecordStrF64 interface returns record array with double value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayRecordStrF64Value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayRecordStrF64Value_Static_0001 start');
      let info = arrayRecordStrF64.arrayRecordValue("Color", (202552115.24).toDouble());
      expect(info.length).assertEqual(3);
      for (let i = 0; i < info.length; i++) {
        expect(info[i].size).assertEqual(1);
        expect(info[i]["Color"]).assertEqual((202552115.24).toDouble());
      }
      console.log('test_ArrayRecordStrF64Value_Static_0001 done');
      done();
      console.log('test_ArrayRecordStrF64Value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayRecordStrBool_STATIC_0100
     * @tc.name      test_ArrayRecordStrBoolValue_Static_0001
     * @tc.desc      ArrayRecordStrBool interface returns record array with boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayRecordStrBoolValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayRecordStrBoolValue_Static_0001 start');
      let info = arrayRecordStrBool.arrayRecordValue("Color", true);
      expect(info.length).assertEqual(3);
      for (let i = 0; i < info.length; i++) {
        expect(info[i].size).assertEqual(1);
        expect(info[i]["Color"]).assertTrue();
      }
      console.log('test_ArrayRecordStrBoolValue_Static_0001 done');
      done();
      console.log('test_ArrayRecordStrBoolValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayUnion_STATIC_0100
     * @tc.name      test_ArrayUnionValue_Static_0001
     * @tc.desc      ArrayUnion interface returns union array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayUnionValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayUnionValue_Static_0001 start');
      let info = arrayUnion.arrayValue("Color");
      expect(info.length).assertEqual(3);
      expect(info[0]).assertEqual("Color");
      expect(info[1]).assertEqual("Color");
      expect(info[2]).assertEqual("Color");
      console.log('test_ArrayUnionValue_Static_0001 done');
      done();
      console.log('test_ArrayUnionValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayNestI8_STATIC_0100
     * @tc.name      test_ArrayNestI8_Static_0001
     * @tc.desc      ArrayNest arrayNestI8 returns nested byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayNestI8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayNestI8_Static_0001 start');
      let info = arrayNest.arrayNestI8((120).toByte());
      expect(info.length).assertEqual(4);
      expect(info[0][0]).assertEqual((120).toByte());
      expect(info[1][0]).assertEqual((-128).toByte());
      expect(info[2][0]).assertEqual((0).toByte());
      expect(info[3][0]).assertEqual((127).toByte());
      console.log('test_ArrayNestI8_Static_0001 done');
      done();
      console.log('test_ArrayNestI8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayNestI16_STATIC_0100
     * @tc.name      test_ArrayNestI16_Static_0001
     * @tc.desc      ArrayNest arrayNestI16 returns nested short array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayNestI16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayNestI16_Static_0001 start');
      let info = arrayNest.arrayNestI16((32700).toShort());
      expect(info.length).assertEqual(4);
      expect(info[0][0]).assertEqual((32700).toShort());
      expect(info[1][0]).assertEqual((-32768).toShort());
      expect(info[2][0]).assertEqual((0).toShort());
      expect(info[3][0]).assertEqual((32767).toShort());
      console.log('test_ArrayNestI16_Static_0001 done');
      done();
      console.log('test_ArrayNestI16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayNestF32_STATIC_0100
     * @tc.name      test_ArrayNestF32_Static_0001
     * @tc.desc      ArrayNest arrayNestF32 returns nested float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayNestF32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayNestF32_Static_0001 start');
      let info = arrayNest.arrayNestF32((202505.28).toFloat());
      expect(info.length).assertEqual(4);
      expect(info[0][0]).assertEqual((202505.28).toFloat());
      expect(info[1][0]).assertEqual((-2025.0523).toFloat());
      expect(info[2][0]).assertEqual((0).toFloat());
      expect(info[3][0]).assertEqual((15.58).toFloat());
      console.log('test_ArrayNestF32_Static_0001 done');
      done();
      console.log('test_ArrayNestF32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayNestString_STATIC_0100
     * @tc.name      test_ArrayNestString_Static_0001
     * @tc.desc      ArrayNest arrayNestStrng returns nested string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayNestString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayNestString_Static_0001 start');
      let info = arrayNest.arrayNestStrng("0528");
      expect(info.length).assertEqual(4);
      expect(info[0][0]).assertEqual("0528");
      expect(info[1][0]).assertEqual("nest");
      expect(info[2][0]).assertEqual("is");
      expect(info[3][0]).assertEqual("this");
      console.log('test_ArrayNestString_Static_0001 done');
      done();
      console.log('test_ArrayNestString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayNestBool_STATIC_0100
     * @tc.name      test_ArrayNestBool_Static_0001
     * @tc.desc      ArrayNest arrayNestBool returns nested boolean array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayNestBool_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayNestBool_Static_0001 start');
      let info = arrayNest.arrayNestBool(true);
      expect(info.length).assertEqual(3);
      expect(info[0][0]).assertTrue();
      expect(info[1][0]).assertTrue();
      expect(info[2][0]).assertFalse();
      console.log('test_ArrayNestBool_Static_0001 done');
      done();
      console.log('test_ArrayNestBool_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayOptional_STATIC_0100
     * @tc.name      test_ArrayOptional_Static_0001
     * @tc.desc      ArrayOptional returns optional string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayOptional_Static_0001 start');
      let info = arrayOptional.arrayOpt("optional");
      expect(info?.[0]).assertEqual("optional");
      expect(info?.[1]).assertEqual("optional");
      expect(info?.[2]).assertEqual("optional");
      console.log('test_ArrayOptional_Static_0001 done');
      done();
      console.log('test_ArrayOptional_Static_0001 end');
    });
  })
}
