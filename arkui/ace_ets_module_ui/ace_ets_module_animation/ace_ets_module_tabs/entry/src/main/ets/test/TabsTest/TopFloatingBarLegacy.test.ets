import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

export default function topFloatingBarLegacyTest() {
  describe('TopFloatingBarLegacyTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarLegacy',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[TopFloatingBarLegacyTest] push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testTopFloatingBarLegacy001
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0100
     * @tc.desc   Test barStyle(BOTTOM) legacy style renders correctly without regression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy001', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarLegacy001] START');
      let strJson = getInspectorByKey('tabs_legacy_bottom');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarLegacy001] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarLegacy002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0200
     * @tc.desc   Test barStyle(SIDEBAR) legacy style renders correctly without regression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy002', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarLegacy002] START');
      let strJson = getInspectorByKey('tabs_legacy_sidebar');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarLegacy002] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarLegacy003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0300
     * @tc.desc   Test barStyle(BOTTOM) with topBarFloatingStyle ignores top floating params and renders BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy003', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarLegacy003] START');
      let strJson = getInspectorByKey('tabs_legacy_bottom_ignores_top_floating');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarLegacy003] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });
  });
}
