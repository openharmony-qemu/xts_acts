'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toStringAsBinary测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToStringAsBinaryTest(): void {
  describe('BigInt.toStringAsBinary（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_BINARY_0100
     * @tc.name testBigIntToStringAsBinary0100
     * @tc.desc Verify toStringAsBinary output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsBinary0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toStringAsBinary()).assertEqual('11111111');
        expect(new BigInt(-8).toStringAsBinary()).assertEqual('1000');
      });
  });
}
