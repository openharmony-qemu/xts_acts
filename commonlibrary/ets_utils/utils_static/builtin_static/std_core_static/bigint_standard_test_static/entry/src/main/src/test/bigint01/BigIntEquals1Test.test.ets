/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_equals_1测试思维导图.md（equals(to: BigInt)）
 * 非 BigInt 入参在 ArkTS 中需经 Object 强转以覆盖运行时类型错误场景。
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntEquals1Test(): void {
  describe('BigInt.equals BigInt（导图 equals_1）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0100
     * @tc.name testBigIntEqualsBigIntTrue0100
     * @tc.desc Verify equals returns true for equal BigInt operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntTrue0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).equals(new BigInt(42))).assertTrue();
        expect(new BigInt(0).equals(new BigInt(0))).assertTrue();
        expect(new BigInt(-42).equals(new BigInt(-42))).assertTrue();
        expect(new BigInt('99999999999999999999').equals(new BigInt('99999999999999999999'))).assertTrue();
        expect(new BigInt(42).equals(new BigInt('42'))).assertTrue();
        expect(new BigInt(0).equals(new BigInt('0'))).assertTrue();
        expect(new BigInt(42).equals(new BigInt(new BigInt(42)))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0200
     * @tc.name testBigIntEqualsBigIntFalse0200
     * @tc.desc Verify equals returns false for unequal BigInt operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntFalse0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).equals(new BigInt(99))).assertFalse();
        expect(new BigInt(-42).equals(new BigInt(42))).assertFalse();
        expect(new BigInt(1).equals(new BigInt(-1))).assertFalse();
        expect(new BigInt('99999999999999999999').equals(new BigInt('88888888888888888888'))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0300
     * @tc.name testBigIntEqualsBigIntBoundary0300
     * @tc.desc Verify equals on large and small BigInt boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntBoundary0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const huge = '999999999999999999999999999999';
        expect(new BigInt(huge).equals(new BigInt(huge))).assertTrue();
        expect(new BigInt(huge).equals(new BigInt('999999999999999999999999999998'))).assertFalse();
        const neg = '-' + huge;
        expect(new BigInt(neg).equals(new BigInt(neg))).assertTrue();
        expect(new BigInt(neg).equals(new BigInt(huge))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0400
     * @tc.name testBigIntEqualsBigIntReturnType0400
     * @tc.desc Verify equals return type is boolean not number or string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const t = new BigInt(42).equals(new BigInt(42));
        const f = new BigInt(42).equals(new BigInt(99));
        expect(typeof t === 'boolean').assertTrue();
        expect(t).assertTrue();
        expect(f).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0500
     * @tc.name testBigIntEqualsBigIntInvalidArgThrows0500
     * @tc.desc Verify equals rejects non-BigInt operands at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntInvalidArgThrows0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(42);
        expect((): void => {
          a.equals(null as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.equals(undefined as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.equals('42' as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.equals(42 as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.equals(true as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.equals({} as Object as BigInt);
        }).assertThrowError('ClassCastError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0600
     * @tc.name testBigIntEqualsBigIntNormalNoThrow0600
     * @tc.desc Verify valid equals calls do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntNormalNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          expect(new BigInt(42).equals(new BigInt(42))).assertTrue();
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
