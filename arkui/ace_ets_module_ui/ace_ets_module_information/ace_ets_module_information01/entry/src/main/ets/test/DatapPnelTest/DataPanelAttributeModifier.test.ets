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

export default function DataPanelAttributeModifierTest() {
  describe('DataPanelAttributeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DataPanelAttributeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanelAttributeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DataPanelAttributeModifierTest state pages: " + JSON.stringify(pages));
        if (!("DataPanelAttributeModifier" == pages.name)) {
          console.info("get DataPanelAttributeModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DataPanelAttributeModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanelAttributeModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DataPanelAttributeModifierTest afterEach called");
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001
     * @tc.number SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001
     * @tc.desc   测试 DataPanel 使用 AttributeModifier 设置初始 closeEffect 属性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('dataPanel_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('DataPanel');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue: Object | undefined = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001] closeEffect: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('false');
      } catch (err) {
        console.error('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001
     * @tc.number SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001
     * @tc.desc   测试 DataPanel 使用 AttributeModifier 设置初始 trackBackgroundColor 属性为 Color.Black
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('dataPanel_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('DataPanel');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let trackBackgroundColorValue: Object | undefined = attrs ? attrs['trackBackgroundColor'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001] trackBackgroundColor: " + JSON.stringify(trackBackgroundColorValue));
        let isBlackColor: boolean = trackBackgroundColorValue?.toString() === '#FF000000' ||
          trackBackgroundColorValue?.toString().toLowerCase() === '#ff000000';
        expect(isBlackColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001
     * @tc.number SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001
     * @tc.desc   测试 DataPanel 使用 AttributeModifier 动态更新 closeEffect 属性从 false 到 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('dataPanel_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialCloseEffect: Object | undefined = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001] initial closeEffect: " + JSON.stringify(initialCloseEffect));
        expect(initialCloseEffect?.toString()).assertEqual('false');

        let btnCloseEffectTrue = await driver.findComponent(ON.id('btn_closeEffect_true'));
        await (btnCloseEffectTrue?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('dataPanel_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedCloseEffect: Object | undefined = attrs2 ? attrs2['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001] updated closeEffect: " + JSON.stringify(updatedCloseEffect));
        expect(updatedCloseEffect?.toString()).assertEqual('true');
      } catch (err) {
        console.error('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_CLOSEEFFECT_UPDATE_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001
     * @tc.number SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001
     * @tc.desc   测试 DataPanel 使用 AttributeModifier 动态更新 trackBackgroundColor 属性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('dataPanel_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialTrackBackgroundColor: Object | undefined = attrs ? attrs['trackBackgroundColor'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001] initial trackBackgroundColor: " + JSON.stringify(initialTrackBackgroundColor));

        let btnTrackBackgroundColorRed = await driver.findComponent(ON.id('btn_trackBackgroundColor_red'));
        await (btnTrackBackgroundColorRed?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('dataPanel_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedTrackBackgroundColor: Object | undefined = attrs2 ? attrs2['trackBackgroundColor'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001] updated trackBackgroundColor: " + JSON.stringify(updatedTrackBackgroundColor));
        let isRedColor: boolean = updatedTrackBackgroundColor?.toString() === '#FFFF0000' ||
          updatedTrackBackgroundColor?.toString().toLowerCase() === '#ffff0000';
        expect(isRedColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_DATAPANEL_ATTRIBUTEMODIFIER_TRACKBACKGROUNDCOLOR_UPDATE_001] END');
      done();
    });
  })
}
