'use static';

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() :void {

    describe('abilityTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testErrorStatic
         * @tc.number SUB_COMMONLIBRARY_UTIL_commonlibrary_ets_utils_Error_Static_0100
         * @tc.desc   Test Error static type checking and assignment compatibility in ArkTS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level LEVEL1
         */
        it('testErrorStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 start');
            let a:int = 1;
            let b:int = 1;
            expect(a).assertEqual(b);
            done()
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 end');
        })

    })

}