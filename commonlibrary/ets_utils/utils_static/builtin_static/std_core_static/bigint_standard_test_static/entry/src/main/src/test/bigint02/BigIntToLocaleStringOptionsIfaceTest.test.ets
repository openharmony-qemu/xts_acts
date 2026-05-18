/*
 * 依据 /Users/yuhu/word/harmony/test/BigIntToLocaleStringOptions_BigInt接口测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToLocaleStringOptionsIfaceTest(): void {
  describe('BigInt.toLocaleString with options（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0100
     * @tc.name testBigIntToLocaleStringWithOptions0100
     * @tc.desc Verify BigInt uses BigIntToLocaleStringOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringWithOptions0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = new BigInt(1234567);
        const opts: BigIntToLocaleStringOptions = { notation: 'standard' };
        const s = val.toLocaleString('en-US', opts);
        expect(s.length > 0).assertTrue();
      });
  });
}
