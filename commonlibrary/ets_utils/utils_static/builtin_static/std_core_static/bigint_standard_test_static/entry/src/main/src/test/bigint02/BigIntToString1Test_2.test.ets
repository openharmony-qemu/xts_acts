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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToString1Test2(): void {
  describe('BigInt.toString no-arg ext (mindmap toString_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0700
     * @tc.name testBigIntToString1ZeroVariants0700
     * @tc.desc Verify no-arg toString returns 0 for zero from different constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1ZeroVariants0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0').toString()).assertEqual('0');
      expect(BigInt('-0').toString()).assertEqual('0');
      expect(BigInt('000').toString()).assertEqual('0');
      expect(BigInt('-000').toString()).assertEqual('0');
      expect(BigInt(false).toString()).assertEqual('0');
      expect(BigInt.fromULong(0).toString()).assertEqual('0');
      expect(BigInt('0x0').toString()).assertEqual('0');
      expect(BigInt('0b0').toString()).assertEqual('0');
      expect(BigInt('0o0').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1000
     * @tc.name testBigIntToString1ExhaustiveSmall1000
     * @tc.desc Verify no-arg toString for every integer from -5 to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1ExhaustiveSmall1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).toString()).assertEqual('-5');
      expect(BigInt(-4).toString()).assertEqual('-4');
      expect(BigInt(-3).toString()).assertEqual('-3');
      expect(BigInt(-2).toString()).assertEqual('-2');
      expect(BigInt(-1).toString()).assertEqual('-1');
      expect(BigInt(0).toString()).assertEqual('0');
      expect(BigInt(1).toString()).assertEqual('1');
      expect(BigInt(2).toString()).assertEqual('2');
      expect(BigInt(3).toString()).assertEqual('3');
      expect(BigInt(4).toString()).assertEqual('4');
      expect(BigInt(5).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1200
     * @tc.name testBigIntToString1UltraLarge1200
     * @tc.desc Verify no-arg toString for 100+ digit huge BigInt values roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1UltraLarge1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge: string = '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
      expect(BigInt(huge).toString()).assertEqual(huge);
      expect(BigInt('-' + huge).toString()).assertEqual('-' + huge);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1300
     * @tc.name testBigIntToString1BooleanConstructed1300
     * @tc.desc Verify no-arg toString for boolean-constructed BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1BooleanConstructed1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).toString()).assertEqual('1');
      expect(BigInt(false).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1400
     * @tc.name testBigIntToString1LeadingPrefix1400
     * @tc.desc Verify no-arg toString strips leading zeros and whitespace from constructed strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1LeadingPrefix1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('  42').toString()).assertEqual('42');
      expect(BigInt('42  ').toString()).assertEqual('42');
      expect(BigInt('  -42').toString()).assertEqual('-42');
      expect(BigInt('00000123').toString()).assertEqual('123');
      expect(BigInt('-00000123').toString()).assertEqual('-123');
      expect(BigInt('  00000123').toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1500
     * @tc.name testBigIntToString1PowerOfTen1500
     * @tc.desc Verify no-arg toString for powers of ten from 10^0 to 10^20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1PowerOfTen1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).toString()).assertEqual('1');
      expect(BigInt(10).toString()).assertEqual('10');
      expect(BigInt(100).toString()).assertEqual('100');
      expect(BigInt(1000).toString()).assertEqual('1000');
      expect(BigInt(10000).toString()).assertEqual('10000');
      expect(BigInt(100000).toString()).assertEqual('100000');
      expect(BigInt(1000000).toString()).assertEqual('1000000');
      expect(BigInt(10000000).toString()).assertEqual('10000000');
      expect(BigInt(100000000).toString()).assertEqual('100000000');
      expect(BigInt(1000000000).toString()).assertEqual('1000000000');
      expect(BigInt('10000000000000000000').toString()).assertEqual('10000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1600
     * @tc.name testBigIntToString1NegativeLarge1600
     * @tc.desc Verify no-arg toString for large negative values from string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1NegativeLarge1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-123456789012345678901234567890').toString()).assertEqual('-123456789012345678901234567890');
      expect(BigInt('-999999999999999999999999999999').toString()).assertEqual('-999999999999999999999999999999');
      expect(BigInt('-1000000000000000000000000000000').toString()).assertEqual('-1000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1800
     * @tc.name testBigIntToString1StepValues1800
     * @tc.desc Verify no-arg toString for sequential positive values 10 through 100 step 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1StepValues1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).toString()).assertEqual('10');
      expect(BigInt(20).toString()).assertEqual('20');
      expect(BigInt(30).toString()).assertEqual('30');
      expect(BigInt(40).toString()).assertEqual('40');
      expect(BigInt(50).toString()).assertEqual('50');
      expect(BigInt(60).toString()).assertEqual('60');
      expect(BigInt(70).toString()).assertEqual('70');
      expect(BigInt(80).toString()).assertEqual('80');
      expect(BigInt(90).toString()).assertEqual('90');
      expect(BigInt(100).toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_1900
     * @tc.name testBigIntToString1NegativeStep1900
     * @tc.desc Verify no-arg toString for sequential negative values -10 through -100 step -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1NegativeStep1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).toString()).assertEqual('-10');
      expect(BigInt(-20).toString()).assertEqual('-20');
      expect(BigInt(-30).toString()).assertEqual('-30');
      expect(BigInt(-40).toString()).assertEqual('-40');
      expect(BigInt(-50).toString()).assertEqual('-50');
      expect(BigInt(-60).toString()).assertEqual('-60');
      expect(BigInt(-70).toString()).assertEqual('-70');
      expect(BigInt(-80).toString()).assertEqual('-80');
      expect(BigInt(-90).toString()).assertEqual('-90');
      expect(BigInt(-100).toString()).assertEqual('-100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_2000
     * @tc.name testBigIntToString1Roundtrip2000
     * @tc.desc Verify roundtrip BigInt(x).toString() roundtrips through BigInt constructor (merged _2700 type check, _2900 large values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Roundtrip2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: string[] = ['0', '1', '-1', '42', '-42', '9223372036854775807', '-9223372036854775808',
        '999999999999999999999999999999', '-999999999999999999999999999999',
        '8888888888888888888', '-8888888888888888888', '12345678901234567890', '-12345678901234567890'];
      for (let i = 0; i < values.length; i++) {
        const s: string = values[i];
        expect(BigInt(s).toString()).assertEqual(s);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_2100
     * @tc.name testBigIntToString1Idempotent2100
     * @tc.desc Verify multiple consecutive no-arg toString calls return identical result and type is string (merged _2700 type check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Idempotent2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = BigInt(123456789);
      expect(v.toString()).assertEqual('123456789');
      expect(v.toString()).assertEqual('123456789');
      expect(v.toString()).assertEqual('123456789');
      expect(typeof v.toString()).assertEqual('string');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_2200
     * @tc.name testBigIntToString1MaxNineSequence2200
     * @tc.desc Verify no-arg toString for all-9 values of increasing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1MaxNineSequence2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9).toString()).assertEqual('9');
      expect(BigInt(99).toString()).assertEqual('99');
      expect(BigInt(999).toString()).assertEqual('999');
      expect(BigInt(9999).toString()).assertEqual('9999');
      expect(BigInt(99999).toString()).assertEqual('99999');
      expect(BigInt(999999).toString()).assertEqual('999999');
      expect(BigInt(9999999).toString()).assertEqual('9999999');
      expect(BigInt(99999999).toString()).assertEqual('99999999');
      expect(BigInt(999999999).toString()).assertEqual('999999999');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_EXT_2300
     * @tc.name testBigIntToString1LargeValues2300
     * @tc.desc Verify no-arg toString for 65535, 123456789, 999999999, 1000000000 (TC008,TC009,TC015,TC017,TC018)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1LargeValues2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(65535).toString()).assertEqual('65535');
      expect(BigInt(-65535).toString()).assertEqual('-65535');
      expect(BigInt(123456789).toString()).assertEqual('123456789');
      expect(BigInt(-123456789).toString()).assertEqual('-123456789');
      expect(BigInt(999999999).toString()).assertEqual('999999999');
      expect(BigInt(-1000000000).toString()).assertEqual('-1000000000');
      expect(BigInt(1234567890).toString()).assertEqual('1234567890');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_EXT_3000
     * @tc.name testBigIntToString1PlusPrefixConstructed3000
     * @tc.desc Verify toString for plus-prefix string constructed BigInt returns value without + sign (TS1-01)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1PlusPrefixConstructed3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt('+123').toString()).assertEqual('123');
      expect(new BigInt('+0').toString()).assertEqual('0');
      expect(new BigInt('+999999').toString()).assertEqual('999999');
      expect(new BigInt('+9223372036854775807').toString()).assertEqual('9223372036854775807');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_EXT_3100
     * @tc.name testBigIntToString1LeadingZeroString3100
     * @tc.desc Verify toString for leading-zero string constructed BigInt strips leading zeros (TS1-02)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1LeadingZeroString3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt('007').toString()).assertEqual('7');
      expect(new BigInt('00123').toString()).assertEqual('123');
      expect(new BigInt('-007').toString()).assertEqual('-7');
      expect(new BigInt('000').toString()).assertEqual('0');
      expect(new BigInt('00000000000000000000000000001').toString()).assertEqual('1');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_EXT_3200
     * @tc.name testBigIntToString1CopyConstructed3200
     * @tc.desc Verify toString for copy-constructed BigInt produces same string as source (TS1-05)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1CopyConstructed3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(new BigInt(999)).toString()).assertEqual('999');
      expect(new BigInt(new BigInt(-888)).toString()).assertEqual('-888');
      expect(new BigInt(new BigInt(0)).toString()).assertEqual('0');
      expect(new BigInt(new BigInt('18446744073709551615')).toString()).assertEqual('18446744073709551615');
      expect(new BigInt(new BigInt(-9223372036854775808)).toString()).assertEqual('-9223372036854775808');
    });
  });
}
