/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toLocaleString_2测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToLocaleString2Test(): void {
  describe('BigInt.toLocaleString(locales, options)（导图 toLocaleString_2）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0100
     * @tc.name testBigIntToLocaleString2Locale0100
     * @tc.desc Verify toLocaleString with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Locale0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const s = new BigInt(1000000).toLocaleString('en-US');
        expect(s.length > 0).assertTrue();
        const zh = new BigInt(1000000).toLocaleString('zh-CN', { notation: 'compact', compactDisplay: 'short' });
        expect(zh.length > 0).assertTrue();
      });
  });
}
