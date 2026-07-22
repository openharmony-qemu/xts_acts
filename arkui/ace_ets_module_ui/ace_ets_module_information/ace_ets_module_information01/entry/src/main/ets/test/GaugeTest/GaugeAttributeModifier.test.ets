/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';

export default function GaugeAttributeModifierTest() {
  describe('GaugeAttributeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GaugeAttributeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gauge/GaugeAttributeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GaugeAttributeModifierTest state pages: " + JSON.stringify(pages));
        if (!("GaugeAttributeModifier" == pages.name)) {
          console.info("get GaugeAttributeModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GaugeAttributeModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GaugeAttributeModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GaugeAttributeModifierTest afterEach called");
    });

    /**
     * @tc.name   SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001
     * @tc.number SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001
     * @tc.desc   测试 Gauge 使用 AttributeModifier 设置初始 startAngle 属性为 210
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('gauge_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('Gauge');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let startAngleValue: Object | undefined = attrs ? attrs['startAngle'] : undefined;
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001] startAngle: " + JSON.stringify(startAngleValue));
        expect(startAngleValue?.toString()).assertEqual('210.00');
      } catch (err) {
        console.error('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001
     * @tc.number SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001
     * @tc.desc   测试 Gauge 使用 AttributeModifier 设置初始 strokeWidth 属性为 20vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('gauge_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('Gauge');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let strokeWidthValue: Object | undefined = attrs ? attrs['strokeWidth'] : undefined;
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001] strokeWidth: " + JSON.stringify(strokeWidthValue));
        expect(strokeWidthValue?.toString()).assertEqual('20.00vp');
      } catch (err) {
        console.error('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001
     * @tc.number SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001
     * @tc.desc   测试 Gauge 使用 AttributeModifier 动态更新 startAngle 属性从 210 到 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('gauge_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialStartAngle: Object | undefined = attrs ? attrs['startAngle'] : undefined;
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001] initial startAngle: " + JSON.stringify(initialStartAngle));
        expect(initialStartAngle?.toString()).assertEqual('210.00');

        let btnStartAngle0 = await driver.findComponent(ON.id('btn_startAngle_0'));
        await (btnStartAngle0?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('gauge_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedStartAngle: Object | undefined = attrs2 ? attrs2['startAngle'] : undefined;
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001] updated startAngle: " + JSON.stringify(updatedStartAngle));
        expect(updatedStartAngle?.toString()).assertEqual('0.00');
      } catch (err) {
        console.error('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STARTANGLE_UPDATE_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001
     * @tc.number SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001
     * @tc.desc   测试 Gauge 使用 AttributeModifier 动态更新 strokeWidth 属性从 20vp 到 30vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('gauge_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialStrokeWidth: Object | undefined = attrs ? attrs['strokeWidth'] : undefined;
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001] initial strokeWidth: " + JSON.stringify(initialStrokeWidth));
        expect(initialStrokeWidth?.toString()).assertEqual('20.00vp');

        let btnStrokeWidth30 = await driver.findComponent(ON.id('btn_strokeWidth_30'));
        await (btnStrokeWidth30?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('gauge_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedStrokeWidth: Object | undefined = attrs2 ? attrs2['strokeWidth'] : undefined;
        console.info("[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001] updated strokeWidth: " + JSON.stringify(updatedStrokeWidth));
        expect(updatedStrokeWidth?.toString()).assertEqual('30.00vp');
      } catch (err) {
        console.error('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_GAUGE_ATTRIBUTEMODIFIER_STROKEWIDTH_UPDATE_001] END');
      done();
    });
  })
}
