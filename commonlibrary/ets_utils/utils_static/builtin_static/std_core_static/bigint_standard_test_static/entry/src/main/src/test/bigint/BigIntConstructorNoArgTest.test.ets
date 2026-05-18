'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_1测试思维导图.md 生成
 * ArkTS-Sta：无参构造、返回值、运算与错误场景（可运行部分）
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntConstructorNoArgTest(): void {
  describe('BigInt 无参构造函数（导图 constructor_1）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0100
     * @tc.name testBigIntConstructorNoArgZero0100
     * @tc.desc Verify parameterless BigInt constructor yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgZero0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        expect(zero.toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0200
     * @tc.name testBigIntConstructorNoArgEqualsZero0200
     * @tc.desc Verify parameterless constructor equals BigInt constructed from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgEqualsZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const noArg = new BigInt();
        const withZero = new BigInt(0);
        expect(noArg.equals(withZero)).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0300
     * @tc.name testBigIntConstructorNoArgInstance0300
     * @tc.desc Verify parameterless constructor returns a BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgInstance0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        expect(zero instanceof BigInt).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0400
     * @tc.name testBigIntConstructorNoArgRepeatedString0400
     * @tc.desc Verify repeated parameterless constructions stringify to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgRepeatedString0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt();
        const b = new BigInt();
        expect(a.toString()).assertEqual('0');
        expect(b.toString()).assertEqual('0');
        expect(a.toString()).assertEqual(b.toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0500
     * @tc.name testBigIntConstructorNoArgLoop0500
     * @tc.desc Verify multiple parameterless constructions in a loop yield zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgLoop0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 10; i++) {
          const v = new BigInt();
          expect(v.toString()).assertEqual('0');
        }
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0600
     * @tc.name testBigIntConstructorNoArgAddOne0600
     * @tc.desc Verify parameterless BigInt plus one equals one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgAddOne0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        const one = new BigInt(1);
        expect(zero.operatorAdd(one).toString()).assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0700
     * @tc.name testBigIntConstructorNoArgCompareOne0700
     * @tc.desc Verify parameterless BigInt compares correctly against one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgCompareOne0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        const one = new BigInt(1);
        expect(zero.operatorLessThan(one)).assertTrue();
        expect(zero.operatorGreaterThan(one)).assertFalse();
        expect(zero.equals(zero)).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0800
     * @tc.name testBigIntConstructorNoArgStress0800
     * @tc.desc Verify repeated parameterless constructions remain stable (up to 100 iterations)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgStress0800',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 100; i++) {
          const v = new BigInt();
          expect(v.toString()).assertEqual('0');
        }
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0900
     * @tc.name testBigIntConstructorNoArgNaN0900
     * @tc.desc Verify BigInt constructed from NaN double throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgNaN0900',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(Number.NaN);
        }).assertThrowError('RangeError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1000
     * @tc.name testBigIntConstructorNoArgInfinity1000
     * @tc.desc Verify BigInt constructed from positive Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgInfinity1000',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(Number.POSITIVE_INFINITY);
        }).assertThrowError('RangeError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1100
     * @tc.name testBigIntConstructorNoArgNegativeInfinity1100
     * @tc.desc Verify BigInt constructed from negative Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgNegativeInfinity1100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(Number.NEGATIVE_INFINITY);
        }).assertThrowError('RangeError');
      });
  });
}
