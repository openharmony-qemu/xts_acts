import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextTailIndentsTest() {
  describe('TextTailIndentsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTailIndentsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextTailIndents',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextTailIndentsTest state pages: " + JSON.stringify(pages));
        if (!("TextTailIndents" == pages.name)) {
          console.info("get TextTailIndentsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextTailIndentsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextTailIndentsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0010
     * @tc.number SUB_ACE_TextTailIndentsTest_0010
     * @tc.desc   test the attr of Text: tailIndents(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0010] START');
      let strJson = getInspectorByKey('Text_tailIndents_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0010] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertEqual(undefined);
      console.info('[TextTailIndentsTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0020
     * @tc.number SUB_ACE_TextTailIndentsTest_0020
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0020] START');
      let strJson = getInspectorByKey('Text_tailIndents_vp20');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0020] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('20.00vp');
      console.info('[TextTailIndentsTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0030
     * @tc.number SUB_ACE_TextTailIndentsTest_0030
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.px(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0030] START');
      let strJson = getInspectorByKey('Text_tailIndents_px20');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0030] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('20.00px');
      console.info('[TextTailIndentsTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0040
     * @tc.number SUB_ACE_TextTailIndentsTest_0040
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.fp(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0040] START');
      let strJson = getInspectorByKey('Text_tailIndents_fp20');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0040] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('20.00fp');
      console.info('[TextTailIndentsTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0050
     * @tc.number SUB_ACE_TextTailIndentsTest_0050
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.lpx(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0050] START');
      let strJson = getInspectorByKey('Text_tailIndents_lpx20');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0050] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('20.00lpx');
      console.info('[TextTailIndentsTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0060
     * @tc.number SUB_ACE_TextTailIndentsTest_0060
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(0)) boundary zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0060] START');
      let strJson = getInspectorByKey('Text_tailIndents_vp0');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0060] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('0.00vp');
      console.info('[TextTailIndentsTest_0060] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0070
     * @tc.number SUB_ACE_TextTailIndentsTest_0070
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(-10)) boundary negative treated as default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0070] START');
      let strJson = getInspectorByKey('Text_tailIndents_vpNegative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0070] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('0.00px');
      console.info('[TextTailIndentsTest_0070] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0080
     * @tc.number SUB_ACE_TextTailIndentsTest_0080
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(999)) boundary large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0080', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0080] START');
      let strJson = getInspectorByKey('Text_tailIndents_vpLarge');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0080] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('999.00vp');
      console.info('[TextTailIndentsTest_0080] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0090
     * @tc.number SUB_ACE_TextTailIndentsTest_0090
     * @tc.desc   test the attr of Text: tailIndents(undefined) same as default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0090', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0090] START');
      let strJson = getInspectorByKey('Text_tailIndents_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0090] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('0.00px');
      console.info('[TextTailIndentsTest_0090] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0100
     * @tc.number SUB_ACE_TextTailIndentsTest_0100
     * @tc.desc   test the attr of Text: tailIndents(null) same as default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0100] START');
      let strJson = getInspectorByKey('Text_tailIndents_null');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0100] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('0.00px');
      console.info('[TextTailIndentsTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0110
     * @tc.number SUB_ACE_TextTailIndentsTest_0110
     * @tc.desc   test the attr of Text: tailIndents(Array<LengthMetrics>) multi-line indent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0110', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0110] START');
      let strJson = getInspectorByKey('Text_tailIndents_arrayMulti');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0110] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('10.00vp');
      expect(obj.$attrs.tailIndents).assertContain('20.00vp');
      expect(obj.$attrs.tailIndents).assertContain('30.00vp');
      console.info('[TextTailIndentsTest_0110] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0120
     * @tc.number SUB_ACE_TextTailIndentsTest_0120
     * @tc.desc   test the attr of Text: tailIndents([LengthMetrics.vp(15)]) single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0120', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0120] START');
      let strJson = getInspectorByKey('Text_tailIndents_arraySingle');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0120] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('15.00vp');
      console.info('[TextTailIndentsTest_0120] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0130
     * @tc.number SUB_ACE_TextTailIndentsTest_0130
     * @tc.desc   test the attr of Text: tailIndents with negative value in array treated as default per element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0130', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0130] START');
      let strJson = getInspectorByKey('Text_tailIndents_arrayNegative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0130] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('0.00px');
      expect(obj.$attrs.tailIndents).assertContain('20.00vp');
      console.info('[TextTailIndentsTest_0130] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0140
     * @tc.number SUB_ACE_TextTailIndentsTest_0140
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.percent(0.5)) percentage not supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0140', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0140] START');
      let strJsonDefault = getInspectorByKey('Text_tailIndents_default');
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      let strJson = getInspectorByKey('Text_tailIndents_percent');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0140] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('0.00px');
      console.info('[TextTailIndentsTest_0140] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0150
     * @tc.number SUB_ACE_TextTailIndentsTest_0150
     * @tc.desc   test the attr of TextModifier: tailIndents(LengthMetrics.vp(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0150', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0150] START');
      let strJson = getInspectorByKey('TextModifier_tailIndents_vp20');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0150] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('20.00vp');
      console.info('[TextTailIndentsTest_0150] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0160
     * @tc.number SUB_ACE_TextTailIndentsTest_0160
     * @tc.desc   test the attr of TextModifier: tailIndents(LengthMetrics.px(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0160', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0160] START');
      let strJson = getInspectorByKey('TextModifier_tailIndents_px20');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0160] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertContain('20.00px');
      console.info('[TextTailIndentsTest_0160] END');
      done();
    });
    /**
     * @tc.name   TextTailIndentsTest_0170
     * @tc.number SUB_ACE_TextTailIndentsTest_0170
     * @tc.desc   test the attr of Text: tailIndents([]) empty array treated as default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0170', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0170] START');
      let strJson = getInspectorByKey('Text_tailIndents_emptyArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0170] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertEqual('[]');
      console.info('[TextTailIndentsTest_0170] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0180
     * @tc.number SUB_ACE_TextTailIndentsTest_0180
     * @tc.desc   test the attr of TextModifier: tailIndents([]) empty array treated as default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0180', Level.LEVEL2, async (done: Function) => {
      console.info('[TextTailIndentsTest_0180] START');
      let strJson = getInspectorByKey('TextModifier_tailIndents_emptyArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextTailIndentsTest_0180] tailIndents: ' + JSON.stringify(obj.$attrs.tailIndents));
      expect(obj.$attrs.tailIndents).assertEqual('[]');
      console.info('[TextTailIndentsTest_0180] END');
      done();
    });
  })
}
