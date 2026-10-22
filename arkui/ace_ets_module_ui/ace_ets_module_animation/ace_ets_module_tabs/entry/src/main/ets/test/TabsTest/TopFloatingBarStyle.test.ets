import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

export default function topFloatingBarStyleTest() {
  describe('TopFloatingBarStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarStyle',
      };
      try {
        router.clear();
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
     * @tc.desc   Test barStyle(TOP) with topBarFloatingStyle({barWidth, maskColor, maskHeight}) renders correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle001', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle001] START');
      let strJson = getInspectorByKey('tabs_top_basic');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle001] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0200
     * @tc.desc   Test topBarFloatingStyle({barWidth: 400}) renders floating container with specified width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle002', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle002] START');
      let strJson = getInspectorByKey('tabs_top_barWidth');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle002] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0300
     * @tc.desc   Test topBarFloatingStyle({maskColor, maskHeight}) renders mask with specified color and height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle003', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle003] START');
      let strJson = getInspectorByKey('tabs_top_mask');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle003] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle004
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0400
     * @tc.desc   Test topBarFloatingStyle({maxWidth: 500}) constrains floating bar width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle004', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle004] START');
      let strJson = getInspectorByKey('tabs_top_maxWidth');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle004] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle005
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0500
     * @tc.desc   Test topBarFloatingStyle({offset: {x: 20, y: 0}}) offsets floating bar position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle005', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle005] START');
      let strJson = getInspectorByKey('tabs_top_offset');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle005] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle006
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0600
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: 16, barTopMargin: 8}) renders margins correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle006', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle006] START');
      let strJson = getInspectorByKey('tabs_top_margin');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle006] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle007
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0100
     * @tc.desc   Test barPosition(Start) is ignored when barStyle(TOP) is set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle007', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle007] START');
      let strJson = getInspectorByKey('tabs_top_barPosition_ignored');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle007] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle008
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0700
     * @tc.desc   Test topBarFloatingStyle({barWidth: '50%'}) percentage value renders correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle008', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle008] START');
      let strJson = getInspectorByKey('tabs_top_barWidth_percent');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle008] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle009
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0800
     * @tc.desc   Test topBarFloatingStyle({maskHeight: '20%'}) percentage value renders correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle009', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle009] START');
      let strJson = getInspectorByKey('tabs_top_maskHeight_percent');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle009] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle010
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_0900
     * @tc.desc   Test topBarFloatingStyle({maxWidth: '80%'}) percentage value renders correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle010', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle010] START');
      let strJson = getInspectorByKey('tabs_top_maxWidth_percent');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle010] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarStyle011
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_PARAM_1000
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: '5%', barTopMargin: '2%'}) percentage values render correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarStyle011', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarStyle011] START');
      let strJson = getInspectorByKey('tabs_top_margin_percent');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarStyle011] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });
  });
}
