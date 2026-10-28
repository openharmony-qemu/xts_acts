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
import * as rename_test from '../ets/rename_test';

export default function renameBasicTest(): void {
  describe("ActsRenameBasicTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Rename_BasicFunction_STATIC_0100
     * @tc.name      test_rename_function
     * @tc.desc      Test function renamed from OldAdd to add
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_function", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_function start');
      let result: int = rename_test.add(3, 4);
      expect(result).assertEqual(7);
      console.log('test_rename_function done');
      done();
      console.log('test_rename_function end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicEnumType_STATIC_0200
     * @tc.name      test_rename_enum_type
     * @tc.desc      Test enum type renamed from OldColor to Color, items renamed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_enum_type", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_enum_type start');
      let c: rename_test.Color = rename_test.Color.red;
      let val: int = rename_test.getColorValue(c);
      expect(val).assertEqual(0);
      console.log('test_rename_enum_type done');
      done();
      console.log('test_rename_enum_type end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicEnumItems_STATIC_0300
     * @tc.name      test_rename_enum_items
     * @tc.desc      Test all enum items red/green/blue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_enum_items", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_enum_items start');
      expect(rename_test.getColorValue(rename_test.Color.red)).assertEqual(0);
      expect(rename_test.getColorValue(rename_test.Color.green)).assertEqual(1);
      expect(rename_test.getColorValue(rename_test.Color.blue)).assertEqual(2);
      console.log('test_rename_enum_items done');
      done();
      console.log('test_rename_enum_items end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicConstEnum_STATIC_0400
     * @tc.name      test_rename_const_enum
     * @tc.desc      Test const enum items renamed to INT_MAX and ZERO
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_const_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_const_enum start');
      expect(rename_test.INT_MAX).assertEqual(2147483647);
      expect(rename_test.ZERO).assertEqual(0);
      console.log('test_rename_const_enum done');
      done();
      console.log('test_rename_const_enum end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicStructType_STATIC_0500
     * @tc.name      test_rename_struct_type
     * @tc.desc      Test struct type renamed from OldPoint to Point
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_struct_type", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_struct_type start');
      let p: rename_test.Point = rename_test.createPoint(10, 20);
      let sum: int = rename_test.getPointSum(p);
      expect(sum).assertEqual(30);
      console.log('test_rename_struct_type done');
      done();
      console.log('test_rename_struct_type end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicStructFields_STATIC_0600
     * @tc.name      test_rename_struct_fields
     * @tc.desc      Test struct fields renamed from x/y to xPos/yPos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_struct_fields", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_struct_fields start');
      let p: rename_test.Point = rename_test.createPoint(5, 15);
      expect(p.xPos).assertEqual(5);
      expect(p.yPos).assertEqual(15);
      console.log('test_rename_struct_fields done');
      done();
      console.log('test_rename_struct_fields end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicStructConstruct_STATIC_0700
     * @tc.name      test_rename_struct_construct
     * @tc.desc      Test construct Point using renamed field names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_struct_construct", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_struct_construct start');
      let p: rename_test.Point = {xPos: 100, yPos: 200};
      let sum: int = rename_test.getPointSum(p);
      expect(sum).assertEqual(300);
      console.log('test_rename_struct_construct done');
      done();
      console.log('test_rename_struct_construct end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicInterface_STATIC_0800
     * @tc.name      test_rename_interface
     * @tc.desc      Test interface renamed from OldCalculator to Calculator, method renamed to compute
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_interface", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_interface start');
      let calc: rename_test.Calculator = rename_test.createCalculator();
      let result: int = calc.compute(6, 7);
      expect(result).assertEqual(42);
      console.log('test_rename_interface done');
      done();
      console.log('test_rename_interface end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicUnion_STATIC_0900
     * @tc.name      test_rename_union
     * @tc.desc      Test union type renamed from OldData to Data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_rename_union", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_rename_union start');
      let intData: rename_test.Data = rename_test.createIntData(42);
      let strData: rename_test.Data = rename_test.createStrData("hello");
      expect(intData).not().assertNull();
      expect(strData).not().assertNull();
      console.log('test_rename_union done');
      done();
      console.log('test_rename_union end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_BasicEnumWithNull_STATIC_1000
     * @tc.name      test_enum_with_null
     * @tc.desc      Test enum item renamed to NULL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_enum_with_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_enum_with_null start');
      expect(rename_test.EnumWithNull.NULL).assertEqual(0);
      console.log('test_enum_with_null done');
      done();
      console.log('test_enum_with_null end');

    });
  });
}