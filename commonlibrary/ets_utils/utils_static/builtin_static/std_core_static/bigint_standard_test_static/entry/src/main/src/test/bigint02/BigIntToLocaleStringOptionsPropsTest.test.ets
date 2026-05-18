'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigIntToLocaleStringOptions_属性测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToLocaleStringOptionsPropsTest(): void {
  describe('BigIntToLocaleStringOptions 属性（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_PROPS_0100
     * @tc.name testBigIntToLocaleStringOptionsProps0100
     * @tc.desc Verify BigIntToLocaleStringOptions property read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsProps0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let options: BigIntToLocaleStringOptions = { compactDisplay: 'short' };
        expect(options.compactDisplay).assertEqual('short');
        options = { notation: 'compact' };
        expect(options.compactDisplay).assertUndefined();
        options = { compactDisplay: 'long', notation: 'compact' };
        expect(options.compactDisplay).assertEqual('long');
        expect(options.notation).assertEqual('compact');
      });
  });
}
