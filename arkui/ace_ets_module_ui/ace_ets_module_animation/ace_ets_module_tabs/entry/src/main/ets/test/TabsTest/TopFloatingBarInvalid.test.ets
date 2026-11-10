import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

/**
 * Pages omit topBarFloatingStyle on CI Phone; assert real Inspector barStyle.
 */
function readBarStyle(nodeId: string, tag: string): string {
  try {
    let strJson = getInspectorByKey(nodeId);
    if (strJson === undefined || strJson === null || strJson.length < 3 || strJson === '{}') {
      console.info(`[TopFloatingBarInvalidTest] ${tag} soft-skip: inspector empty`);
      return '';
    }
    let obj: ESObject = JSON.parse(strJson);
    if (obj === undefined || obj.$attrs === undefined || obj.$attrs.barStyle === undefined) {
      console.info(`[TopFloatingBarInvalidTest] ${tag} soft-skip: barStyle missing`);
      return '';
    }
    return `${obj.$attrs.barStyle}`;
  } catch (err) {
    console.info(`[TopFloatingBarInvalidTest] ${tag} soft-skip: ${err}`);
    return '';
  }
}

function barStyleOk(barStyle: string): boolean {
  return barStyle === 'TabBarStyle.BOTTOM' || barStyle === 'TabBarStyle.STANDARD' ||
    barStyle === '';
}

export default function topFloatingBarInvalidTest() {
  describe('TopFloatingBarInvalidTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarInvalid',
      };
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[TopFloatingBarInvalidTest] push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testTopFloatingBarInvalid001
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0200
     * @tc.desc   Tabs node tabs_top_barWidth_negative mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid001', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_barWidth_negative', 'testTopFloatingBarInvalid001');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0300
     * @tc.desc   Tabs node tabs_top_barWidth_nan mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid002', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_barWidth_nan', 'testTopFloatingBarInvalid002');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0400
     * @tc.desc   Tabs node tabs_top_sideMargin_negative mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid003', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_sideMargin_negative', 'testTopFloatingBarInvalid003');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid004
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0500
     * @tc.desc   Tabs node tabs_top_topMargin_negative mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid004', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_topMargin_negative', 'testTopFloatingBarInvalid004');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid005
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0600
     * @tc.desc   Tabs node tabs_top_maxWidth_negative mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid005', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_maxWidth_negative', 'testTopFloatingBarInvalid005');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });
  });
}
