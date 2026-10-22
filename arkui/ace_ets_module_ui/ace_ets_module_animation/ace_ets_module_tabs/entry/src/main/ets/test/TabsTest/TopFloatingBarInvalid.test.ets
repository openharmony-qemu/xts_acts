import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

export default function topFloatingBarInvalidTest() {
  describe('TopFloatingBarInvalidTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarInvalid',
      };
      try {
        router.clear();
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
     * @tc.desc   Test topBarFloatingStyle({barWidth: -100}) negative barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid001', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid001] START');
      let strJson = getInspectorByKey('tabs_top_barWidth_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid001] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0300
     * @tc.desc   Test topBarFloatingStyle({barWidth: NaN}) NaN barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid002', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid002] START');
      let strJson = getInspectorByKey('tabs_top_barWidth_nan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid002] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0400
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: -16}) negative barSideMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid003', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid003] START');
      let strJson = getInspectorByKey('tabs_top_sideMargin_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid003] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid004
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0500
     * @tc.desc   Test topBarFloatingStyle({barTopMargin: -8}) negative barTopMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid004', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid004] START');
      let strJson = getInspectorByKey('tabs_top_topMargin_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid004] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid005
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0600
     * @tc.desc   Test topBarFloatingStyle({maxWidth: -1}) negative maxWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid005', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid005] START');
      let strJson = getInspectorByKey('tabs_top_maxWidth_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid005] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });
  });
}
