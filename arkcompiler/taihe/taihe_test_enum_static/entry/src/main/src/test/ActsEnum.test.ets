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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import * as test from '../ets/Index'

export default function enumTest(): void {
  describe("ActsEnumTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC1_STATIC_0100
     * @tc.name      test_nextEnum_with_color_Static_0001
     * @tc.desc      nextEnum with Color.GREEN should return Color.BLUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_color_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_color_Static_0001 start');
      let pass: boolean = true;
      try {
        const color = test.Color.GREEN;
        const nextColor = test.nextEnum(color);
        expect(nextColor).assertEqual(test.Color.BLUE);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_color failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_color_Static_0001 done');
      done();
      console.log('test_nextEnum_with_color_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC2_STATIC_0100
     * @tc.name      test_nextEnum_with_color_red_Static_0001
     * @tc.desc      nextEnum with Color.BLUE should return Color.RED (wrap around)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_color_red_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_color_red_Static_0001 start');
      let pass: boolean = true;
      try {
        const color = test.Color.BLUE;
        const nextColor = test.nextEnum(color);
        expect(nextColor).assertEqual(test.Color.RED);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_color_red failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_color_red_Static_0001 done');
      done();
      console.log('test_nextEnum_with_color_red_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC3_STATIC_0100
     * @tc.name      test_getValueOfEnum_Static_0001
     * @tc.desc      getValueOfEnum with Color.GREEN should return "Green"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_getValueOfEnum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_getValueOfEnum_Static_0001 start');
      let pass: boolean = true;
      try {
        let color = test.Color.GREEN;
        let value = test.getValueOfEnum(color);
        expect(value).assertEqual("Green");
      } catch (e) {
        pass = false;
        console.log('getValueOfEnum failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_getValueOfEnum_Static_0001 done');
      done();
      console.log('test_getValueOfEnum_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC4_STATIC_0100
     * @tc.name      test_nextEnumWeekday_Static_0001
     * @tc.desc      nextEnumWeekday with WEDNESDAY should return THURSDAY
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnumWeekday_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnumWeekday_Static_0001 start');
      let pass: boolean = true;
      try {
        let day = test.Weekday.WEDNESDAY;
        let nextDay = test.nextEnumWeekday(day);
        expect(nextDay).assertEqual(test.Weekday.THURSDAY);
      } catch (e) {
        pass = false;
        console.log('nextEnumWeekday failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnumWeekday_Static_0001 done');
      done();
      console.log('test_nextEnumWeekday_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC5_STATIC_0100
     * @tc.name      test_getValueOfEnumWeekday_Static_0001
     * @tc.desc      getValueOfEnumWeekday with WEDNESDAY should return 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_getValueOfEnumWeekday_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_getValueOfEnumWeekday_Static_0001 start');
      let pass: boolean = true;
      try {
        let day = test.Weekday.WEDNESDAY;
        let value = test.getValueOfEnumWeekday(day);
        expect(value).assertEqual(3);
      } catch (e) {
        pass = false;
        console.log('getValueOfEnumWeekday failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_getValueOfEnumWeekday_Static_0001 done');
      done();
      console.log('test_getValueOfEnumWeekday_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC6_STATIC_0100
     * @tc.name      test_nextEnum_with_i8_Static_0001
     * @tc.desc      nextEnumI8 with ONE should return TWO
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_i8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_i8_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.NumTypeI8.ONE;
        const next = test.nextEnumI8(first);
        expect(next).assertEqual(test.NumTypeI8.TWO);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_i8 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_i8_Static_0001 done');
      done();
      console.log('test_nextEnum_with_i8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC7_STATIC_0100
     * @tc.name      test_nextEnum_with_i16_Static_0001
     * @tc.desc      nextEnumI16 with ONE should return TWO
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_i16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_i16_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.NumTypeI16.ONE;
        const next = test.nextEnumI16(first);
        expect(next).assertEqual(test.NumTypeI16.TWO);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_i16 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_i16_Static_0001 done');
      done();
      console.log('test_nextEnum_with_i16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC8_STATIC_0100
     * @tc.name      test_nextEnum_with_i32_Static_0001
     * @tc.desc      nextEnumI32 with ONE should return TWO
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_i32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_i32_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.NumTypeI32.ONE;
        const next = test.nextEnumI32(first);
        expect(next).assertEqual(test.NumTypeI32.TWO);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_i32 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_i32_Static_0001 done');
      done();
      console.log('test_nextEnum_with_i32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC9_STATIC_0100
     * @tc.name      test_nextEnum_with_i64_Static_0001
     * @tc.desc      nextEnumI64 with ONE should return TWO
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_i64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_i64_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.NumTypeI64.ONE;
        const next = test.nextEnumI64(first);
        expect(next).assertEqual(test.NumTypeI64.TWO);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_i64 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_i64_Static_0001 done');
      done();
      console.log('test_nextEnum_with_i64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC10_STATIC_0100
     * @tc.name      test_nextEnum_with_string_Static_0001
     * @tc.desc      nextEnumString with ONE should return TWO
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_string_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_string_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.EnumString.ONE;
        const next = test.nextEnumString(first);
        expect(next).assertEqual(test.EnumString.TWO);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_string failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_string_Static_0001 done');
      done();
      console.log('test_nextEnum_with_string_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC11_STATIC_0100
     * @tc.name      test_nextEnum_with_const_i8_Static_0001
     * @tc.desc      const enum FlagsI8 FLAG_I8_TWO should equal 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_i8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_i8_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_I8_TWO;
        expect(first).assertEqual(0 as byte);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_i8 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_i8_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_i8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC12_STATIC_0100
     * @tc.name      test_nextEnum_with_const_i16_Static_0001
     * @tc.desc      const enum FlagsI16 FLAG_I16_TWO should equal 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_i16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_i16_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_I16_TWO;
        expect(first).assertEqual(0 as short);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_i16 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_i16_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_i16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC13_STATIC_0100
     * @tc.name      test_nextEnum_with_const_i32_Static_0001
     * @tc.desc      const enum FlagsI32 FLAG_I32_TWO should equal 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_i32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_i32_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_I32_TWO;
        expect(first).assertEqual(0);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_i32 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_i32_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_i32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC14_STATIC_0100
     * @tc.name      test_nextEnum_with_const_i64_Static_0001
     * @tc.desc      const enum FlagsI64 FLAG_I64_TWO should equal 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_i64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_i64_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_I64_TWO;
        expect(first).assertEqual(0 as long);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_i64 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_i64_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_i64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC15_STATIC_0100
     * @tc.name      test_nextEnum_with_const_f32_Static_0001
     * @tc.desc      const enum FlagsF32 FLAG_F32_A should equal 10.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_f32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_f32_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_F32_A;
        expect(first).assertEqual(10.0 as float);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_f32 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_f32_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_f32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC16_STATIC_0100
     * @tc.name      test_nextEnum_with_const_f64_Static_0001
     * @tc.desc      const enum Flags FLAG_F64_A should equal 1.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_f64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_f64_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_F64_A;
        expect(first).assertEqual(1.0 as double);
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_f64 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_f64_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_f64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC17_STATIC_0100
     * @tc.name      test_nextEnum_with_const_string_Static_0001
     * @tc.desc      const enum FlagsString FLAG_STRING_ONE should equal "hello"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nextEnum_with_const_string_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_nextEnum_with_const_string_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.FLAG_STRING_ONE;
        expect(first).assertEqual("hello");
      } catch (e) {
        pass = false;
        console.log('nextEnum_with_const_string failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_nextEnum_with_const_string_Static_0001 done');
      done();
      console.log('test_nextEnum_with_const_string_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC18_STATIC_0100
     * @tc.name      test_fromValueToEnum_Static_0001
     * @tc.desc      fromValueToEnum with valid strings should return correct Color, invalid should throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_fromValueToEnum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_fromValueToEnum_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.fromValueToEnum("Red");
        expect(first).assertEqual(test.Color.RED);
        const second = test.fromValueToEnum("Green");
        expect(second).assertEqual(test.Color.GREEN);
        const third = test.fromValueToEnum("Blue");
        expect(third).assertEqual(test.Color.BLUE);
      } catch (e) {
        pass = false;
        console.log('fromValueToEnum valid failed', e.message);
      }
      expect(pass).assertTrue();

      let errCode: number = 0;
      try {
        test.fromValueToEnum("Yellow");
      } catch (e) {
        errCode = e.code;
      }
      expect(errCode).assertEqual(1);
      console.log('test_fromValueToEnum_Static_0001 done');
      done();
      console.log('test_fromValueToEnum_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Enum_FUNC19_STATIC_0100
     * @tc.name      test_fromValueToEnumWeekday_Static_0001
     * @tc.desc      fromValueToEnumWeekday with valid value should return correct Weekday, invalid should throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_fromValueToEnumWeekday_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_fromValueToEnumWeekday_Static_0001 start');
      let pass: boolean = true;
      try {
        const first = test.fromValueToEnumWeekday(0);
        expect(first).assertEqual(test.Weekday.SUNDAY);
      } catch (e) {
        pass = false;
        console.log('fromValueToEnumWeekday valid failed', e.message);
      }
      expect(pass).assertTrue();

      let errCode: number = 0;
      try {
        test.fromValueToEnumWeekday(8);
      } catch (e) {
        errCode = e.code;
      }
      expect(errCode).assertEqual(1);
      console.log('test_fromValueToEnumWeekday_Static_0001 done');
      done();
      console.log('test_fromValueToEnumWeekday_Static_0001 end');
    });
  });
}