'use static';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() :void {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testInt32ArrayAbilityStatic
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ABILITY_0100
         * @tc.desc   Test Int32Array static ability runner smoke check in ArkTS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testInt32ArrayAbilityStatic", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
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
