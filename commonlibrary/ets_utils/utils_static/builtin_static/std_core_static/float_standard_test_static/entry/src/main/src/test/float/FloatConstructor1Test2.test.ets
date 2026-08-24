'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function FloatConstructor1Test2(): void {
  describe('FloatConstructor1Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0100
     * @tc.name testFloatConstructorNoparam001
     * @tc.desc Verify toString() returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const result: string = f.toString();
      expect(result).assertEqual('0');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0200
     * @tc.name testFloatConstructorNoparam002
     * @tc.desc Verify compareTo(new Float(0.0)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const zero: Float = new Float(0.0);
      const result: int = f.compareTo(zero);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0300
     * @tc.name testFloatConstructorNoparam003
     * @tc.desc Verify equals(new Float(1.0)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const one: Float = new Float(1.0);
      expect(f.equals(one)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0400
     * @tc.name testFloatConstructorNoparam004
     * @tc.desc Verify 1.0f / toFloat() returns Float.POSITIVE_INFINITY (confirming sign of zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const signCheck: float = 1.0f / f.toFloat();
      expect(Float.isFinite(signCheck)).assertFalse();
      expect(Float.isNaN(signCheck)).assertFalse();
      expect(signCheck).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0500
     * @tc.name testFloatConstructorNoparam005
     * @tc.desc Verify isLessThan(new Float(Float.MIN_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(f.isLessThan(new Float(Float.MIN_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0600
     * @tc.name testFloatConstructorNoparam006
     * @tc.desc Verify isGreaterThan(new Float(-Float.MIN_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(f.isGreaterThan(new Float(-Float.MIN_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0700
     * @tc.name testFloatConstructorNoparam007
     * @tc.desc Verify toString(2) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const result: string = f.toString(2);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0800
     * @tc.name testFloatConstructorNoparam008
     * @tc.desc Verify new Float() idempotency: multiple calls return the same default Float(0.0f) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const original: float = f.toFloat();
      f.add(new Float(5.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_0900
     * @tc.name testFloatConstructorNoparam009
     * @tc.desc Verify sub() on default Float does not change original value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const original: float = f.toFloat();
      f.sub(new Float(3.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1000
     * @tc.name testFloatConstructorNoparam010
     * @tc.desc Verify mul() on default Float does not change original value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const original: float = f.toFloat();
      f.mul(new Float(2.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1100
     * @tc.name testFloatConstructorNoparam011
     * @tc.desc Verify div() on default Float does not change original value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const original: float = f.toFloat();
      f.div(new Float(5.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1200
     * @tc.name testFloatConstructorNoparam012
     * @tc.desc Verify add(new Float(2.0)) returns '2'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float().add(new Float(2.0)).toString();
      expect(result).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1300
     * @tc.name testFloatConstructorNoparam013
     * @tc.desc Verify sub: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Float().sub(new Float(1.0)).isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1400
     * @tc.name testFloatConstructorNoparam014
     * @tc.desc Verify mul(new Float(5.0)) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Float().mul(new Float(5.0)).isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1500
     * @tc.name testFloatConstructorNoparam015
     * @tc.desc Verify toFloat() returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 5; i++) {
        const f: Float = new Float();
        expect(f.toFloat()).assertEqual(0.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1600
     * @tc.name testFloatConstructorNoparam016
     * @tc.desc Verify toString() of three default Float instances returns the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultA: Float = new Float();
      const defaultB: Float = new Float();
      const defaultC: Float = new Float();
      expect(defaultA.toString()).assertEqual(defaultB.toString());
      expect(defaultB.toString()).assertEqual(defaultC.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1700
     * @tc.name testFloatConstructorNoparam017
     * @tc.desc Verify add chain: new Float().add(1.0f).add(2.0f) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep1: Float = base.add(new Float(1.0f));
      const addStep2: Float = addStep1.add(new Float(2.0f));
      const result: float = addStep2.toFloat();
      expect(result).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1800
     * @tc.name testFloatConstructorNoparam018
     * @tc.desc Verify sub chain: new Float().sub(1.0f).sub(2.0f) returns -3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const subStep1: Float = base.sub(new Float(1.0f));
      const subStep2: Float = subStep1.sub(new Float(2.0f));
      const result: float = subStep2.toFloat();
      expect(result).assertEqual(-3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_1900
     * @tc.name testFloatConstructorNoparam019
     * @tc.desc Verify mul(new Float(999.99f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().mul(new Float(999.99f)).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2000
     * @tc.name testFloatConstructorNoparam020
     * @tc.desc Verify div(new Float(3.14f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().div(new Float(3.14f)).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2100
     * @tc.name testFloatConstructorNoparam021
     * @tc.desc Verify chained add then sub() on Float(10.0f) returns '5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(10.0f));
      const subStep: Float = addStep.sub(new Float(5.0f));
      const result: string = subStep.toString();
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2200
     * @tc.name testFloatConstructorNoparam022
     * @tc.desc Verify chained add then mul() on Float(1.0f) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(1.0f));
      const mulStep: Float = addStep.mul(new Float(5.0f));
      const result: float = mulStep.toFloat();
      expect(result).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2300
     * @tc.name testFloatConstructorNoparam023
     * @tc.desc Verify chained sub then div() on Float(1.0f) returns -0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const subStep: Float = base.sub(new Float(1.0f));
      const divStep: Float = subStep.div(new Float(2.0f));
      const result: float = divStep.toFloat();
      expect(result).assertEqual(-0.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2400
     * @tc.name testFloatConstructorNoparam024
     * @tc.desc Verify chained mul then add() on Float(100.0f) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const mulStep: Float = base.mul(new Float(100.0f));
      const addStep: Float = mulStep.add(new Float(1.0f));
      const result: float = addStep.toFloat();
      expect(result).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2500
     * @tc.name testFloatConstructorNoparam025
     * @tc.desc Verify chained div then sub() on Float(1.0f) returns -0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const divStep: Float = base.div(new Float(1.0f));
      const subStep: Float = divStep.sub(new Float(0.5f));
      const result: float = subStep.toFloat();
      expect(result).assertEqual(-0.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2600
     * @tc.name testFloatConstructorNoparam026
     * @tc.desc Verify chained add then sub then mul() on Float(3.0f) returns 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(3.0f));
      const subStep: Float = addStep.sub(new Float(1.0f));
      const mulStep: Float = subStep.mul(new Float(2.0f));
      const result: float = mulStep.toFloat();
      expect(result).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2700
     * @tc.name testFloatConstructorNoparam027
     * @tc.desc Verify chained mul then div then add() on Float(10.0f) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const mulStep: Float = base.mul(new Float(10.0f));
      const divStep: Float = mulStep.div(new Float(2.0f));
      const addStep: Float = divStep.add(new Float(0.0f));
      const result: float = addStep.toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2800
     * @tc.name testFloatConstructorNoparam028
     * @tc.desc Verify chained add then sub then mul then div() on Float(5.0f) returns 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(5.0f));
      const subStep: Float = addStep.sub(new Float(2.0f));
      const mulStep: Float = subStep.mul(new Float(4.0f));
      const divStep: Float = mulStep.div(new Float(3.0f));
      const result: float = divStep.toFloat();
      expect(result).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_2900
     * @tc.name testFloatConstructorNoparam029
     * @tc.desc Verify isLessThan(new Float(0.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(0.0f))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3000
     * @tc.name testFloatConstructorNoparam030
     * @tc.desc Verify isLessThan(new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(1.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3100
     * @tc.name testFloatConstructorNoparam031
     * @tc.desc Verify isLessThan(new Float(-1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(-1.0f))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3200
     * @tc.name testFloatConstructorNoparam032
     * @tc.desc Verify isLessEqualThan(new Float(0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessEqualThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3300
     * @tc.name testFloatConstructorNoparam033
     * @tc.desc Verify isLessEqualThan(new Float(-0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessEqualThan(new Float(-0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3400
     * @tc.name testFloatConstructorNoparam034
     * @tc.desc Verify isLessEqualThan(new Float(3.14f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessEqualThan(new Float(3.14f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3500
     * @tc.name testFloatConstructorNoparam035
     * @tc.desc Verify isLessEqualThan(new Float(-1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessEqualThan(new Float(-1.0f))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3600
     * @tc.name testFloatConstructorNoparam036
     * @tc.desc Verify isGreaterThan(new Float(0.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterThan(new Float(0.0f))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3700
     * @tc.name testFloatConstructorNoparam037
     * @tc.desc Verify isGreaterThan(new Float(-1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterThan(new Float(-1.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3800
     * @tc.name testFloatConstructorNoparam038
     * @tc.desc Verify isGreaterThan(new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterThan(new Float(1.0f))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_3900
     * @tc.name testFloatConstructorNoparam039
     * @tc.desc Verify isGreaterEqualThan(new Float(0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterEqualThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4000
     * @tc.name testFloatConstructorNoparam040
     * @tc.desc Verify isGreaterEqualThan(new Float(-0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterEqualThan(new Float(-0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4100
     * @tc.name testFloatConstructorNoparam041
     * @tc.desc Verify isGreaterEqualThan(new Float(-99.99f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterEqualThan(new Float(-99.99f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4200
     * @tc.name testFloatConstructorNoparam042
     * @tc.desc Verify isGreaterEqualThan(new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterEqualThan(new Float(1.0f))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4300
     * @tc.name testFloatConstructorNoparam043
     * @tc.desc Verify toString(3) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().toString(3)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4400
     * @tc.name testFloatConstructorNoparam044
     * @tc.desc Verify toFloat() on new Float() returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toFloat(f)).assertEqual(0.0f);
      expect(Float.toFloat(f)).assertEqual(f.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4500
     * @tc.name testFloatConstructorNoparam045
     * @tc.desc Verify toDouble() on new Float() returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toDouble(f)).assertEqual(0.0);
      expect(Float.toDouble(f)).assertEqual(f.toDouble());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4600
     * @tc.name testFloatConstructorNoparam046
     * @tc.desc Verify new Float() idempotency: same input multiple calls return the same result (0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toInt(f)).assertEqual(0);
      expect(Float.toInt(f)).assertEqual(f.toInt());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4700
     * @tc.name testFloatConstructorNoparam047
     * @tc.desc Verify toLong() on new Float() returns 0 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toLong(f)).assertEqual(0 as long);
      expect(Float.toLong(f)).assertEqual(f.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4800
     * @tc.name testFloatConstructorNoparam048
     * @tc.desc Verify toByte() on new Float() returns 0 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toByte(f)).assertEqual(0 as byte);
      expect(Float.toByte(f)).assertEqual(f.toByte());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_4900
     * @tc.name testFloatConstructorNoparam049
     * @tc.desc Verify toShort() on new Float() returns 0 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toShort(f)).assertEqual(0 as short);
      expect(Float.toShort(f)).assertEqual(f.toShort());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5000
     * @tc.name testFloatConstructorNoparam050
     * @tc.desc Verify isNaN() on new Float() returns false and matches f.isNaN()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(isNaN(f)).assertFalse();
      expect(isNaN(f)).assertEqual(f.isNaN());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5100
     * @tc.name testFloatConstructorNoparam051
     * @tc.desc Verify isFinite() on new Float() returns true and matches f.isFinite()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(isFinite(f)).assertTrue();
      expect(isFinite(f)).assertEqual(f.isFinite());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5200
     * @tc.name testFloatConstructorNoparam052
     * @tc.desc Verify isInteger() on new Float() returns true and matches f.isInteger()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.isInteger(f)).assertTrue();
      expect(Float.isInteger(f)).assertEqual(f.isInteger());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5300
     * @tc.name testFloatConstructorNoparam053
     * @tc.desc Verify isSafeInteger() on new Float() returns true and matches f.isSafeInteger()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.isSafeInteger(f)).assertTrue();
      expect(Float.isSafeInteger(f)).assertEqual(f.isSafeInteger());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5400
     * @tc.name testFloatConstructorNoparam054
     * @tc.desc Verify toString(new Float()) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toString(f)).assertEqual('0');
      expect(Float.toString(f)).assertEqual(f.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5500
     * @tc.name testFloatConstructorNoparam055
     * @tc.desc Verify toString(f, 16) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(Float.toString(f, 16)).assertEqual('0');
      expect(Float.toString(f, 16)).assertEqual(f.toString(16));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5600
     * @tc.name testFloatConstructorNoparam056
     * @tc.desc Verify Float.compare(this, new Float(0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const zero: Float = new Float(0.0f);
      expect(Float.compare(f, zero)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5700
     * @tc.name testFloatConstructorNoparam057
     * @tc.desc Verify default constructor creates Float with value 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.bitCastToInt(new Float())).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5800
     * @tc.name testFloatConstructorNoparam058
     * @tc.desc Verify constructor(0.0f) creates Float instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits1: int = Float.bitCastToInt(new Float());
      const bits2: int = Float.bitCastToInt(new Float(0.0f));
      expect(bits1).assertEqual(bits2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_5900
     * @tc.name testFloatConstructorNoparam059
     * @tc.desc Verify equals(new Float(-0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bitsPosZero: int = Float.bitCastToInt(new Float());
      const bitsNegZero: int = Float.bitCastToInt(new Float(-0.0f));
      expect(new Float().equals(new Float(-0.0f))).assertTrue();
      expect(bitsPosZero).assertEqual(0);
      expect(bitsNegZero).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6000
     * @tc.name testFloatConstructorNoparam060
     * @tc.desc Verify toFloat() on bitCast zero equals toFloat() on default constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromBits: Float = Float.bitCastFromInt(0);
      const defaultZero: Float = new Float();
      expect(fromBits.toFloat()).assertEqual(defaultZero.toFloat());
      expect(fromBits.equals(defaultZero)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6100
     * @tc.name testFloatConstructorNoparam061
     * @tc.desc Verify bitCast round-trip preserves original toFloat() value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Float = new Float();
      const bits: int = Float.bitCastToInt(original);
      const restored: Float = Float.bitCastFromInt(bits);
      expect(restored.toFloat()).assertEqual(original.toFloat());
      expect(restored.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6200
     * @tc.name testFloatConstructorNoparam062
     * @tc.desc Verify equals(new Float(Float.MIN_VALUE)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().equals(new Float(Float.MIN_VALUE))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6300
     * @tc.name testFloatConstructorNoparam063
     * @tc.desc Verify isLessThan(new Float(Float.MAX_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(Float.MAX_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6400
     * @tc.name testFloatConstructorNoparam064
     * @tc.desc Verify isLessThan(new Float(Float.POSITIVE_INFINITY)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(Float.POSITIVE_INFINITY))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6500
     * @tc.name testFloatConstructorNoparam065
     * @tc.desc Verify isGreaterThan(new Float(Float.NEGATIVE_INFINITY)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isGreaterThan(new Float(Float.NEGATIVE_INFINITY))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6600
     * @tc.name testFloatConstructorNoparam066
     * @tc.desc Verify add(new Float(Float.MAX_VALUE)) returns Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().add(new Float(Float.MAX_VALUE)).toFloat();
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6700
     * @tc.name testFloatConstructorNoparam067
     * @tc.desc Verify sub(new Float(Float.MIN_VALUE)) returns -Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().sub(new Float(Float.MIN_VALUE)).toFloat();
      expect(result).assertEqual(-Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6800
     * @tc.name testFloatConstructorNoparam068
     * @tc.desc Verify div(new Float(Float.POSITIVE_INFINITY)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().div(new Float(Float.POSITIVE_INFINITY)).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_6900
     * @tc.name testFloatConstructorNoparam069
     * @tc.desc Verify mul(new Float(Float.NEGATIVE_INFINITY)) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float().mul(new Float(Float.NEGATIVE_INFINITY));
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7000
     * @tc.name testFloatConstructorNoparam070
     * @tc.desc Verify isLessThan(new Float(Float.EPSILON)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(Float.EPSILON))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7100
     * @tc.name testFloatConstructorNoparam071
     * @tc.desc Verify isLessThan(new Float(Float.DELTA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float().isLessThan(new Float(Float.DELTA))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7200
     * @tc.name testFloatConstructorNoparam072
     * @tc.desc Verify default constructor bitCast falls in int range and BIT_SIZE equals 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.BIT_SIZE).assertEqual(32);
      const bits: int = Float.bitCastToInt(new Float());
      expect(bits).assertLargerOrEqual(-2147483648);
      expect(bits).assertLessOrEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7300
     * @tc.name testFloatConstructorNoparam073
     * @tc.desc Verify isSafeInteger() on new Float() (default 0.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(f.isSafeInteger()).assertTrue();
      expect(f.isLessThan(new Float(Float.MAX_SAFE_INTEGER))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7400
     * @tc.name testFloatConstructorNoparam074
     * @tc.desc Verify add(new Float(1.0f)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(1.0f));
      const intermediate: float = addStep.toFloat();
      const result: Float = new Float(intermediate);
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7500
     * @tc.name testFloatConstructorNoparam075
     * @tc.desc Verify sub(new Float(5.0f)) returns -5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const subStep: Float = base.sub(new Float(5.0f));
      const intermediate: float = subStep.toFloat();
      const result: Float = new Float(intermediate);
      expect(result.toFloat()).assertEqual(-5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7600
     * @tc.name testFloatConstructorNoparam076
     * @tc.desc Verify chained add then sub() on Float(3.0f) returns 2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(3.0f));
      const subStep: Float = addStep.sub(new Float(1.0f));
      const intermediate: float = subStep.toFloat();
      const result: Float = new Float(intermediate);
      expect(result.toFloat()).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7700
     * @tc.name testFloatConstructorNoparam077
     * @tc.desc Verify add(new Float(5.0f)) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(5.0f));
      const intermediate: float = addStep.toFloat();
      const f1: Float = new Float(intermediate);
      const f2: Float = new Float(f1.toFloat());
      const f3: Float = new Float(f2.toFloat());
      expect(f3.toFloat()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7800
     * @tc.name testFloatConstructorNoparam078
     * @tc.desc Verify add(new Float(7.0f)) to default Float, then compareTo with direct Float(7.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float();
      const addStep: Float = base.add(new Float(7.0f));
      const intermediate: float = addStep.toFloat();
      const computed: Float = new Float(intermediate);
      const direct: Float = new Float(7.0f);
      expect(computed.equals(direct)).assertTrue();
      expect(computed.compareTo(direct)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_7900
     * @tc.name testFloatConstructorNoparam079
     * @tc.desc Verify isLessThan(new Float(1.0f)) returns true via compareTo()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Float = new Float();
      const one: Float = new Float(1.0f);
      expect(zero.isLessThan(one)).assertTrue();
      expect(zero.isGreaterThan(one)).assertFalse();
      expect(zero.compareTo(one)).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8000
     * @tc.name testFloatConstructorNoparam080
     * @tc.desc Verify isLessThan(new Float(0.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Float = new Float();
      const half: Float = new Float(0.5f);
      expect(zero.isLessThan(half)).assertTrue();
      expect(zero.equals(half)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8100
     * @tc.name testFloatConstructorNoparam081
     * @tc.desc Verify isGreaterThan(new Float(-0.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Float = new Float();
      const negHalf: Float = new Float(-0.5f);
      expect(zero.isGreaterThan(negHalf)).assertTrue();
      expect(zero.isLessThan(negHalf)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8200
     * @tc.name testFloatConstructorNoparam082
     * @tc.desc Verify isLessThan(new Float(Float.MIN_VALUE)) on default Float returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Float = new Float();
      const minVal: Float = new Float(Float.MIN_VALUE);
      expect(zero.isLessThan(minVal)).assertTrue();
      expect(zero.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8300
     * @tc.name testFloatConstructorNoparam083
     * @tc.desc Verify add(new Float(1.0f)) returns 15.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float()
      .add(new Float(1.0f))
      .add(new Float(2.0f))
      .add(new Float(4.0f))
      .add(new Float(8.0f))
      .toFloat();
      expect(result).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8400
     * @tc.name testFloatConstructorNoparam084
     * @tc.desc Verify add(new Float(Float.EPSILON)) returns Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Float = new Float();
      const epsilon: Float = new Float(Float.EPSILON);
      const sum: Float = zero.add(epsilon);
      expect(sum.toFloat()).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8500
     * @tc.name testFloatConstructorNoparam085
     * @tc.desc Verify add(new Float(Float.MIN_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float().add(new Float(Float.MIN_VALUE));
      expect(result.isFinite()).assertTrue();
      expect(result.toFloat()).assertLarger(0.0f);
      expect(result.equals(new Float())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8600
     * @tc.name testFloatConstructorNoparam086
     * @tc.desc Verify toFloat() returns 0.0f equaling 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10000; i++) {
        const f: Float = new Float();
        expect(f.toFloat()).assertEqual(0.0f);
        expect(f.isFinite()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8700
     * @tc.name testFloatConstructorNoparam087
     * @tc.desc Verify add(new Float()) returns 0.0f equaling 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let accumulator: Float = new Float();
      for (let i: int = 0; i < 100; i++) {
        accumulator = accumulator.add(new Float());
      }
      expect(accumulator.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8800
     * @tc.name testFloatConstructorNoparam088
     * @tc.desc Verify Float constructor: toFloat() returns 0.0f for default constructed Float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(f.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_8900
     * @tc.name testFloatConstructorNoparam089
     * @tc.desc Verify toFloat() returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getDefaultFloat = (): Float => {
        return new Float();
      };
      const result: Float = getDefaultFloat();
      expect(result.toFloat()).assertEqual(0.0f);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9000
     * @tc.name testFloatConstructorNoparam090
     * @tc.desc Verify toFloat() for literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const literal: float = 0.0f;
      expect(f.toFloat()).assertEqual(literal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9100
     * @tc.name testFloatConstructorNoparam091
     * @tc.desc Verify toFloat() for negZeroLiteral
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const negZeroLiteral: float = -0.0f;
      expect(f.toFloat()).assertEqual(negZeroLiteral);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9200
     * @tc.name testFloatConstructorNoparam092
     * @tc.desc Verify sub(new Float()) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().sub(new Float()).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9300
     * @tc.name testFloatConstructorNoparam093
     * @tc.desc Verify div(new Float()) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float().div(new Float());
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9400
     * @tc.name testFloatConstructorNoparam094
     * @tc.desc Verify mul(new Float()) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().mul(new Float()).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9500
     * @tc.name testFloatConstructorNoparam095
     * @tc.desc Verify add(new Float()) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().add(new Float()).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9600
     * @tc.name testFloatConstructorNoparam096
     * @tc.desc Verify block-scoped Float mutates via add while outer Float stays 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float();
      {
        let f2: Float = new Float();
        expect(f2.toFloat()).assertEqual(0.0f);
        f2 = f2.add(new Float(5.0f));
        expect(f2.toFloat()).assertEqual(5.0f);
      }
      expect(f1.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_NOPARAM_9700
     * @tc.name testFloatConstructorNoparam097
     * @tc.desc Verify add(new Float(3.0f)) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorNoparam097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Float = new Float();
      const innerFn = (): Float => {
        return outer.add(new Float(3.0f));
      };
      const innerResult: Float = innerFn();
      expect(innerResult.toFloat()).assertEqual(3.0f);
      expect(outer.toFloat()).assertEqual(0.0f);
    });
  });
}
