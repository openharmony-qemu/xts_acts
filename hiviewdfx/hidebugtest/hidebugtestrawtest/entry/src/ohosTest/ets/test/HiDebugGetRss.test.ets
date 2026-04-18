import { hilog , hidebug} from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { errorManager } from '@kit.AbilityKit';

export default function HiDebugGetRss() {
  describe('HiDebugGetRss', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001
     * @tc.name testHidebugGetRssinfo01
     * @tc.desc hidebug.getRssInfo动态接口测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugGetRssinfo01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info("====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001 start");
      try {
        const info =  hidebug.getRssInfo();
        console.error( 'testTag', `rss(${info.rss}) rssSwap(${info.swapRss})`);
        expect(info.rss).assertLargerOrEqual(0)
        expect(info.swapRss).assertLargerOrEqual(0)
        done();
      } catch (err) {
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001 end");
    });


    /**
     * @tc.number SUB_DFX_DFR_HIDEBUG_GETRSSINFO_002
     * @tc.name testHidebugGetRssinfo02
     * @tc.desc hidebug.getRssInfo动态接口稳定性测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugGetRssinfo02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info("====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001 start");
      for (let i = 0; i < 100; i++) {
        try {
          const info =  hidebug.getRssInfo();
          console.error( 'testTag', `rss(${info.rss}) rssSwap(${info.swapRss})`);
          expect(info.rss).assertLargerOrEqual(0)
          expect(info.swapRss).assertLargerOrEqual(0)
          done();
        } catch (err) {
          expect(false).assertTrue();
          done();
        }
      }
      console.info("====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_003 end");
    });



  })
}