/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import {
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '../../../../hypium/index';
import Utils from '../Util.test';
export default function ByteAddTest07(): void {
  describe("ByteAddTest07", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_0100
     * @tc.name     testByteAddRequireParameter0001
     * @tc.desc     verifies adding two Byte instances returns correct sum in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddRequireParameter0001", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(50);
        const b2: Byte = new Byte(30);
        const result: Byte = b1.add(b2);
        expect(result.toByte()).assertEqual(80);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_0200
     * @tc.name     testByteAddInlineConstructParam0002
     * @tc.desc     verifies adding a Byte constructed inline returns correct sum in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddInlineConstructParam0002", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b3: Byte = new Byte(50);
        const result: Byte = b3.add(new Byte(30));
        expect(result.toByte()).assertEqual(80);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_0400
     * @tc.name     testByteAddSpreadExample0004
     * @tc.desc     verifies adding two Byte variables returns correct sum in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddSpreadExample0004", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b5: Byte = new Byte(60);
        const b6: Byte = new Byte(40);
        const result: Byte = b5.add(b6);
        expect(result.toByte()).assertEqual(100);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_0500
     * @tc.name     testByteAddZeroReturnsOriginal0005
     * @tc.desc     verifies adding zero value Byte returns the original value
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddZeroReturnsOriginal0005", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b7: Byte = new Byte(50);
        const result: Byte = b7.add(new Byte(0));
        expect(result.toByte()).assertEqual(50);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_0800
     * @tc.name     testByteAddReturnNewExample0008
     * @tc.desc     verifies return new byte example in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddReturnNewExample0008", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b10: Byte = new Byte(50);
        const b11: Byte = new Byte(30);
        const result: Byte = b10.add(b11);
        expect(result instanceof Byte).assertTrue();
        expect(result.toByte()).assertEqual(80);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_0900
     * @tc.name     testByteAddTwoPositiveNumberAdd0009
     * @tc.desc     verifies two positive numbers add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddTwoPositiveNumberAdd0009", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b12: Byte = new Byte(40);
        const b13: Byte = new Byte(60);
        const result_01: Byte = b12.add(b13);
        expect(result_01.toByte()).assertEqual(100);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1000
     * @tc.name     testByteAddTwoNegativeNumbersAdd0010
     * @tc.desc     verifies two negative numbers add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddTwoNegativeNumbersAdd0010", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b14: Byte = new Byte(-50);
        const b15: Byte = new Byte(-30);
        const result_02: Byte = b14.add(b15);
        expect(result_02.toByte()).assertEqual(-80);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1100
     * @tc.name     testByteAddSignedNumbersAdd0011
     * @tc.desc     verifies positive and negative two types numbers add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddSignedNumbersAdd0011", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b16: Byte = new Byte(80);
        const b17: Byte = new Byte(-30);
        const result_03: Byte = b16.add(b17);
        expect(result_03.toByte()).assertEqual(50);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1200
     * @tc.name     testByteAddZeroAdd0012
     * @tc.desc     verifies have zero add way in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddZeroAdd0012", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b18: Byte = new Byte(50);
        const bZero: Byte = new Byte(0);
        expect(b18.add(bZero).toByte()).assertEqual(50);
        expect(bZero.add(b18).toByte()).assertEqual(50);
        expect(bZero.add(bZero).toByte()).assertEqual(0);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1300
     * @tc.name     testByteAddNearlyMaxAdd0013
     * @tc.desc     verifies close to maximum add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddNearlyMaxAdd0013", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b19: Byte = new Byte(100);
        const b20: Byte = new Byte(27);
        const result_04: Byte = b19.add(b20);
        expect(result_04.toByte()).assertEqual(127);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1400
     * @tc.name     testByteAddNearlyMinAdd0014
     * @tc.desc     verifies close to minimum add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddNearlyMinAdd0014", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b21: Byte = new Byte(-100);
        const b22: Byte = new Byte(-28);
        const result_05: Byte = b21.add(b22);
        expect(result_05.toByte()).assertEqual(-128);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1500
     * @tc.name     testByteAddOverNumberAdd0015
     * @tc.desc     verifies over number add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddOverNumberAdd0015", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const bMax: Byte = new Byte(Byte.MAX_VALUE);
        const bZero_01: Byte = new Byte(0);
        expect(bMax.add(bZero_01).toByte()).assertEqual(127);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1600
     * @tc.name     testByteAddOverMinNumber0016
     * @tc.desc     verifies over min number in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddOverMinNumber0016", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const bMin: Byte = new Byte(Byte.MIN_VALUE);
        const bZero_02: Byte = new Byte(0);
        expect(bMin.add(bZero_02).toByte()).assertEqual(-128);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1700
     * @tc.name     testByteAddContractNumberAdd0017
     * @tc.desc     verifies contract numbers add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddContractNumberAdd0017", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(50);
        const b2: Byte = new Byte(-50);
        expect(b1.add(b2).toByte()).assertEqual(0);
        expect(b2.add(b1).toByte()).assertEqual(0);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_1900
     * @tc.name     testByteAddReturnNewExample0019
     * @tc.desc     verifies return new example but not return new number in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddReturnNewExample0019", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(60);
        const b2: Byte = new Byte(40);
        const originalValue: byte = b1.toByte();
        const result: Byte = b1.add(b2);
        expect(b1.toByte()).assertEqual(originalValue);
        expect(result.toByte()).assertEqual(100);
        expect(result != b1).assertTrue();
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_2100
     * @tc.name     testByteAddChainUse0021
     * @tc.desc     verifies chain use normal running in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddChainUse0021", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(10);
        const b2: Byte = new Byte(20);
        const b3: Byte = new Byte(30);
        const result: Byte = b1.add(b2).add(b3);
        expect(result.toByte()).assertEqual(60);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_2500
     * @tc.name     testByteAddValidByteParam0025
     * @tc.desc     verifies add with valid Byte parameter returns correct sum in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddValidByteParam0025", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b: Byte = new Byte(50);
        const result: Byte = b.add(new Byte(10));
        expect(result.toByte()).assertEqual(60);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_2600
     * @tc.name     testByteAddExchangeAddWay0026
     * @tc.desc     verifies the add is exchange way in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddExchangeAddWay0026", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(60);
        const b2: Byte = new Byte(40);
        const r1: Byte = b1.add(b2);
        const r2: Byte = b2.add(b1);
        expect(r1.toByte()).assertEqual(r2.toByte());
        expect(r1.toByte()).assertEqual(100);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_2700
     * @tc.name     testByteAddCombineWay0027
     * @tc.desc     verifies the add is combine way class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddCombineWay0027", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(30);
        const b2: Byte = new Byte(20);
        const b3: Byte = new Byte(10);
        const r1: Byte = b1.add(b2).add(b3);
        const r2: Byte = b1.add(b2.add(b3));
        expect(r1.toByte()).assertEqual(r2.toByte());
        expect(r1.toByte()).assertEqual(60);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_2900
     * @tc.name     testByteAddContractAddWay0029
     * @tc.desc     verifies add and sub whether contract in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddContractAddWay0029", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(80);
        const b2: Byte = new Byte(30);
        const sum: Byte = b1.add(b2);
        const diff: Byte = b1.sub(b2);
        expect(sum.toByte()).assertEqual(110);
        expect(diff.toByte()).assertEqual(50);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3000
     * @tc.name     testByteAddRepetitionReturn0030
     * @tc.desc     verifies repetition return in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddRepetitionReturn0030", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(50);
        const b2: Byte = new Byte(30);
        const result: Byte = b1.add(new Byte(b2))
        expect(result.toByte()).assertEqual(80);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3100
     * @tc.name     testByteAddHaveAdd0031
     * @tc.desc     verifies byte should have add way cin class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddHaveAdd0031", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b: Byte = new Byte(50);
        const result: Byte = b.add(new Byte(25));
        expect(result.toByte()).assertEqual(75);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3200
     * @tc.name     testByteAddNormalUseAdd0032
     * @tc.desc     verifies normal use add way in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddNormalUseAdd0032", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(60);
        const b2: Byte = new Byte(40);
        const result: Byte = b1.add(b2);
        expect(result instanceof Byte).assertTrue();
        expect(result.toByte()).assertEqual(100);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3300
     * @tc.name     testByteAddAllCalculateWayHad0033
     * @tc.desc     verifies all calculate way had in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddAllCalculateWayHad0033", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b: Byte = new Byte(50);
        const b2: Byte = new Byte(25);
        expect(b.add(b2).toByte()).assertEqual(75);
        expect(b.sub(b2).toByte()).assertEqual(25);
        expect(b.mul(new Byte(2)).toByte()).assertEqual(100);
        expect(b.div(b2).toByte()).assertEqual(2);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3400
     * @tc.name     testByteAddRepetitionAdd0034
     * @tc.desc     verifies repetition add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddRepetitionAdd0034", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        let result: Byte = new Byte(0);
        const bytes: Byte[] = [
          new Byte(10),
          new Byte(20),
          new Byte(30),
        ];
        for (const b of bytes) {
          result = result.add(b);
        }
        expect(result.toByte()).assertEqual(60);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3500
     * @tc.name     testByteAddCalculateArrange0035
     * @tc.desc     verifies calculate arrange sum in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddCalculateArrange0035", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          new Byte(15),
          new Byte(25),
          new Byte(35),
        ];
        let sum: Byte = new Byte(0);
        for (const b of bytes) {
          sum = sum.add(b);
        }
        expect(sum.toByte()).assertEqual(75);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3600
     * @tc.name     testByteAddStableAddNumber0036
     * @tc.desc     verifies every stable add number in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddStableAddNumber0036", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(0);
        const increment: Byte = new Byte(10);
        b = b.add(increment);
        expect(b.toByte()).assertEqual(10);
        b = b.add(increment);
        expect(b.toByte()).assertEqual(20);
        b = b.add(increment);
        expect(b.toByte()).assertEqual(30);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3700
     * @tc.name     testByteAddStepAdd0037
     * @tc.desc     verifies Step add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddStepAdd0037", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100);
        const step: Byte = new Byte(5);
        for (let i = 0; i < 5; i++) {
          b = b.add(step);
        }
        expect(b.toByte()).assertEqual(125);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3800
     * @tc.name     testByteAddNonStraightMove0038
     * @tc.desc     verifies NonStraight move used by add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddNonStraightMove0038", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const base: Byte = new Byte(50);
        const offset1: Byte = new Byte(10);
        const offset2: Byte = new Byte(20);
        const addr1: Byte = base.add(offset1);
        const addr2: Byte = base.add(offset2);
        expect(addr1.toByte()).assertEqual(60);
        expect(addr2.toByte()).assertEqual(70);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_3900
     * @tc.name     testByteAddAreaEstimate0039
     * @tc.desc     verifies area of positive add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddAreaEstimate0039", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(127);
        const b2: Byte = new Byte(0);
        const result: Byte = b1.add(b2);
        expect(result.toByte()).assertEqual(127);

        const b3: Byte = new Byte(127);
        const b4: Byte = new Byte(-1);
        const result01: Byte = b3.add(b4);
        expect(result01.toByte()).assertEqual(126);

        const b5: Byte = new Byte(127);
        const b6: Byte = new Byte(1);
        const result02: Byte = b5.add(b6);
        expect(result02.toByte()).assertEqual(-128);

        const b7: Byte = new Byte(126);
        const b8: Byte = new Byte(1);
        const result03: Byte = b7.add(b8);
        expect(result03.toByte()).assertEqual(127);

        const b9: Byte = new Byte(127);
        const b10: Byte = new Byte(127);
        const result04: Byte = b9.add(b10);
        expect(result04.toByte()).assertEqual(-2);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4000
     * @tc.name     testByteAddNegativeRangeAdd0040
     * @tc.desc     verifies adding two negative bytes covers the negative range correctly in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddNegativeRangeAdd0040", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        let count: int = 0;
        for (let i: int = -128; i <= -1; i++) {
          for (let j: int = -128; j <= -1; j++) {
            if (i + j >= -128) {
              const b1: Byte = new Byte(Int.toByte(i));
              const b2: Byte = new Byte(Int.toByte(j));
              const result: Byte = b1.add(b2);
              expect(result.toByte()).assertEqual(i + j);
              count++;
            } else {
              expect(i + j < -128).assertTrue();
            }
          }
        }
        expect(count > 0).assertTrue();
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4200
     * @tc.name     testByteAddZeroAddOne0042
     * @tc.desc     verifies zero calculate all number in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddZeroAddOne0042", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const bZero: Byte = new Byte(0);
        const testValue: Byte[] = [-128, -127, -1, 0, 1, 126, 127];
        for (let i of testValue) {
          const b: Byte = new Byte(i);
          expect(b.add(bZero).toByte()).assertEqual(i);
          expect(bZero.add(b).toByte()).assertEqual(i);
        }
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4300
     * @tc.name     testByteAddNotErrorUsedRepetition0043
     * @tc.desc     verifies shouldn't have error when repetition use in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddNotErrorUsedRepetition0043", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(50);
        const b2: Byte = new Byte(30);
        const its = 100;

        for (let i = 0; i < its; i++) {
          b1.add(b2);
        }
        const result: Byte = b1.add(b2);
        expect(result.toByte()).assertEqual(80);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4400
     * @tc.name     testByteAddRepetitionAddArrange0044
     * @tc.desc     verifies big arrange repetition add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     FUNCTION
     * @tc.level    Level2
     */
    it("testByteAddRepetitionAddArrange0044", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [];
        for (let i = 0; i < 1000; i++) {
          bytes.push(new Byte(1));
        }
        let sum: Byte = new Byte(0);
        for (const b of bytes) {
          sum = sum.add(b);
        }
        const total: number = 1000;
        const remainder: number = total % 256;
        const expected: number = remainder >= 128 ? remainder - 256 : remainder;
        expect(sum.toByte()).assertEqual(expected);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4700
     * @tc.name     testByteAddNotFixOriginalNumber0047
     * @tc.desc     verifies protect original number not be fixed in class byte
     * @tc.size     SMALLTEST
     * @tc.type     COMPATIBILITY
     * @tc.level    Level2
     */
    it("testByteAddNotFixOriginalNumber0047", TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(55);
        const b2: Byte = new Byte(45);
        const originalValue: byte = b1.toByte();
        const result: Byte = b1.add(b2);
        expect(b1.toByte()).assertEqual(originalValue);
        expect(result.toByte()).assertEqual(100);
        expect(result != b1).assertTrue();
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4800
     * @tc.name     testByteAddRepetitionUseChain0048
     * @tc.desc     verifies repetition chain used in class byte
     * @tc.size     SMALLTEST
     * @tc.type     COMPATIBILITY
     * @tc.level    Level2
     */
    it("testByteAddRepetitionUseChain0048", TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(10);
        const b2: Byte = new Byte(20);
        const b3: Byte = new Byte(30);
        const b4: Byte = new Byte(40);
        const result: Byte = b1.add(b2).add(b3).add(b4);
        expect(result.toByte()).assertEqual(100);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_4900
     * @tc.name     testByteAddCombineAdd0049
     * @tc.desc     verifies combine used add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     COMPATIBILITY
     * @tc.level    Level2
     */
    it("testByteAddCombineAdd0049", TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(100);
        const b2: Byte = new Byte(30);
        const b3: Byte = new Byte(20);
        const result: Byte = b1.add(b2).sub(b3);
        expect(result.toByte()).assertEqual(110);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_5000
     * @tc.name     testByteAddTwoLineAdd0050
     * @tc.desc     verifies two line add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     COMPATIBILITY
     * @tc.level    Level2
     */
    it("testByteAddTwoLineAdd0050", TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(20);
        const b2: Byte = new Byte(30);
        const b3: Byte = new Byte(40);
        const b4: Byte = new Byte(10);
        const result: Byte = b1.add(b2.add(b3)).add(b4);
        expect(result.toByte()).assertEqual(100);
      });

    /**
     * @tc.number   SUB_BYTE_ADD_TEST_5200
     * @tc.name     testByteAddCompareAdd0052
     * @tc.desc     verifies contract numbers add in class byte
     * @tc.size     SMALLTEST
     * @tc.type     COMPATIBILITY
     * @tc.level    Level2
     */
    it("testByteAddCompareAdd0052", TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const b1: Byte = new Byte(50);
        const b2: Byte = new Byte(30);
        const b3: Byte = new Byte(90);
        const sum: Byte = b1.add(b2);
        expect(sum.isLessThan(b3)).assertTrue();
        expect(sum.compareTo(b3) < 0).assertTrue();
      });
  });
}
