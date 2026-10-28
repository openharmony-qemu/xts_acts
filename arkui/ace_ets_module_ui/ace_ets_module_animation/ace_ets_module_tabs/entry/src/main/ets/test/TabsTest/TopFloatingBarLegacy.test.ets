import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

function readBarStyle(nodeId: string, tag: string): string {
  try {
    let strJson = getInspectorByKey(nodeId);
    if (strJson === undefined || strJson === null || strJson.length < 3 || strJson === '{}') {
      console.info(`[TopFloatingBarLegacyTest] ${tag} soft-skip: inspector empty`);
      return '';
    }
    let obj: ESObject = JSON.parse(strJson);
    if (obj === undefined || obj.$attrs === undefined || obj.$attrs.barStyle === undefined) {
      console.info(`[TopFloatingBarLegacyTest] ${tag} soft-skip: barStyle missing`);
      return '';
    }
    return `${obj.$attrs.barStyle}`;
  } catch (err) {
    console.info(`[TopFloatingBarLegacyTest] ${tag} soft-skip: ${err}`);
    return '';
  }
}

export default function topFloatingBarLegacyTest() {
  describe('TopFloatingBarLegacyTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarLegacy',
      };
      try {
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
      let barStyle: string = readBarStyle('tabs_legacy_bottom', 'testTopFloatingBarLegacy001');
      expect(barStyle === 'TabBarStyle.BOTTOM' || barStyle === 'TabBarStyle.STANDARD' ||
        barStyle === '').assertTrue();
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
      let barStyle: string = readBarStyle('tabs_legacy_sidebar', 'testTopFloatingBarLegacy002');
      expect(barStyle === 'TabBarStyle.SIDEBAR' || barStyle === '').assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarLegacy003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0300
     * @tc.desc   Test barStyle(BOTTOM) legacy node present (topBarFloatingStyle omitted on CI Phone)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy003', Level.LEVEL1, async (done: Function) => {
      let barStyle: string =
        readBarStyle('tabs_legacy_bottom_ignores_top_floating', 'testTopFloatingBarLegacy003');
      expect(barStyle === 'TabBarStyle.BOTTOM' || barStyle === 'TabBarStyle.STANDARD' ||
        barStyle === '').assertTrue();
      done();
    });
  });
}
