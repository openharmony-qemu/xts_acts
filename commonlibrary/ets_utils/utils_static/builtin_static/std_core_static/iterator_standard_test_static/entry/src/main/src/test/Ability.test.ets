'use static';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function abilityTest() :void {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testIteratorStatic
         * @tc.number SUB_commonlibrary_ets_utils_Iterator_Static_0100
         * @tc.desc   Test Iterator static type checking and assignment compatibility in ArkTS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIteratorStatic", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
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