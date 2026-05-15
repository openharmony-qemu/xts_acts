/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_9测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntConstructorCopyTest(): void {
  describe('BigInt 拷贝构造（导图 constructor_9）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0100
     * @tc.name testBigIntConstructorCopyValueEqual0100
     * @tc.desc Verify copy constructor produces equal BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyValueEqual0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt(42);
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
        expect(copied.toString()).assertEqual('42');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0200
     * @tc.name testBigIntConstructorCopyLargeString0200
     * @tc.desc Verify copy constructor matches large decimal string source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLargeString0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt('9007199254740993');
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0300
     * @tc.name testBigIntConstructorCopySameValue0300
     * @tc.desc Verify copy constructor preserves source numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopySameValue0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt(1);
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
        expect(copied.toString()).assertEqual('1');
      });
  });
}
