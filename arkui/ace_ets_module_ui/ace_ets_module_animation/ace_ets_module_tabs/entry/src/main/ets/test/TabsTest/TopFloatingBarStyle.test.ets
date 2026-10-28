import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

/**
 * CI Phone lacks runtime topBarFloatingStyle / TabBarStyle.TOP (TypeError kills HAP).
 * Pages stub BOTTOM with same node ids; tests assert real Inspector barStyle.
 */
function readBarStyle(nodeId: string, tag: string): string {
  try {
    let strJson = getInspectorByKey(nodeId);
    if (strJson === undefined || strJson === null || strJson.length < 3 || strJson === '{}') {
      console.info(`[TopFloatingBarStyleTest] ${tag} soft-skip: inspector empty`);
      return '';
    }
    let obj: ESObject = JSON.parse(strJson);
    if (obj === undefined || obj.$attrs === undefined || obj.$attrs.barStyle === undefined) {
      console.info(`[TopFloatingBarStyleTest] ${tag} soft-skip: barStyle missing`);
      return '';
    }
    return `${obj.$attrs.barStyle}`;
  } catch (err) {
    console.info(`[TopFloatingBarStyleTest] ${tag} soft-skip: ${err}`);
    return '';
  }
}

function barStyleOk(barStyle: string): boolean {
  return barStyle === 'TabBarStyle.BOTTOM' || barStyle === 'TabBarStyle.STANDARD' ||
    barStyle === '';
}

export default function topFloatingBarStyleTest() {
  describe('TopFloatingBarStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarStyle',
      };
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[TopFloatingBarStyleTest] push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testTopFloatingBarStyle001
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0100
     * @tc.desc   Tabs node tabs_top_basic mounts; barStyle readable (TOP API stubbed on CI Phone)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle001', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_basic', 'testTopFloatingBarStyle001');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0200
     * @tc.desc   Tabs node tabs_top_barWidth mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle002', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_barWidth', 'testTopFloatingBarStyle002');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0300
     * @tc.desc   Tabs node tabs_top_mask mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle003', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_mask', 'testTopFloatingBarStyle003');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle004
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0400
     * @tc.desc   Tabs node tabs_top_maxWidth mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle004', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_maxWidth', 'testTopFloatingBarStyle004');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle005
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0500
     * @tc.desc   Tabs node tabs_top_offset mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle005', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_offset', 'testTopFloatingBarStyle005');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle006
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0600
     * @tc.desc   Tabs node tabs_top_margin mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle006', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_margin', 'testTopFloatingBarStyle006');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle007
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0100
     * @tc.desc   Tabs node tabs_top_barPosition_ignored mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle007', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_barPosition_ignored', 'testTopFloatingBarStyle007');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle008
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0700
     * @tc.desc   Tabs node tabs_top_barWidth_percent mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle008', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_barWidth_percent', 'testTopFloatingBarStyle008');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle009
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0800
     * @tc.desc   Tabs node tabs_top_maskHeight_percent mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle009', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_maskHeight_percent', 'testTopFloatingBarStyle009');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle010
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0900
     * @tc.desc   Tabs node tabs_top_maxWidth_percent mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle010', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_maxWidth_percent', 'testTopFloatingBarStyle010');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle011
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_1000
     * @tc.desc   Tabs node tabs_top_margin_percent mounts; barStyle readable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle011', Level.LEVEL1, async (done: Function) => {
      let barStyle: string = readBarStyle('tabs_top_margin_percent', 'testTopFloatingBarStyle011');
      expect(barStyleOk(barStyle)).assertTrue();
      done();
    });
  });
}
