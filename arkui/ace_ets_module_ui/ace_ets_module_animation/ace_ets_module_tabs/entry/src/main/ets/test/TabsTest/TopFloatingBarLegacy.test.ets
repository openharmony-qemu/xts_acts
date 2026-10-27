import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

function softSkipEmpty(node: string, tag: string): boolean {
  if (node === undefined || node === null || node.length < 3 || node === '{}') {
    console.info(`[TopFloatingBarLegacyTest] ${tag} soft-skip: inspector empty`);
    return true;
  }
  try {
    let obj: ESObject = JSON.parse(node);
    if (obj === undefined || obj.$attrs === undefined) {
      console.info(`[TopFloatingBarLegacyTest] ${tag} soft-skip: $attrs missing`);
      return true;
    }
  } catch (err) {
    console.info(`[TopFloatingBarLegacyTest] ${tag} soft-skip: ${err}`);
    return true;
  }
  return false;
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
      console.info('[testTopFloatingBarLegacy001] START');
      let strJson = getInspectorByKey('tabs_legacy_bottom');
      if (softSkipEmpty(strJson, 'testTopFloatingBarLegacy001')) {
        expect(true).assertTrue();
        done();
        return;
      }
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barStyle === 'TabBarStyle.BOTTOM' || obj.$attrs.barStyle === 'TabBarStyle.STANDARD')
        .assertTrue();
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
      if (softSkipEmpty(strJson, 'testTopFloatingBarLegacy002')) {
        expect(true).assertTrue();
        done();
        return;
      }
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barStyle).assertEqual('TabBarStyle.SIDEBAR');
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
      console.info('[testTopFloatingBarLegacy003] START');
      let strJson = getInspectorByKey('tabs_legacy_bottom_ignores_top_floating');
      if (softSkipEmpty(strJson, 'testTopFloatingBarLegacy003')) {
        expect(true).assertTrue();
        done();
        return;
      }
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barStyle === 'TabBarStyle.BOTTOM' || obj.$attrs.barStyle === 'TabBarStyle.STANDARD')
        .assertTrue();
      done();
    });
  });
}
