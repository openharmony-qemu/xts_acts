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

export default function PatternLockAttributeModifierTest() {
  describe('PatternLockAttributeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PatternLockAttributeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PatternLock/PatternLockAttributeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockAttributeModifierTest state pages: " + JSON.stringify(pages));
        if (!("PatternLockAttributeModifier" == pages.name)) {
          console.info("get PatternLockAttributeModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PatternLockAttributeModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLockAttributeModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PatternLockAttributeModifierTest afterEach called");
    });

    /**
     * @tc.name   SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001
     * @tc.number SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001
     * @tc.desc   测试 PatternLock 使用 AttributeModifier 设置初始 sideLength 属性为 300vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('patternLock_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('PatternLock');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let sideLengthValue: Object | undefined = attrs ? attrs['sideLength'] : undefined;
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001] sideLength: " + JSON.stringify(sideLengthValue));
        expect(sideLengthValue?.toString()).assertEqual('300.00vp');
      } catch (err) {
        console.error('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001
     * @tc.number SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001
     * @tc.desc   测试 PatternLock 使用 AttributeModifier 设置初始 regularColor 属性为 #FF000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('patternLock_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('PatternLock');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let regularColorValue: Object | undefined = attrs ? attrs['regularColor'] : undefined;
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001] regularColor: " + JSON.stringify(regularColorValue));
        let isBlackColor: boolean = regularColorValue?.toString() === '#FF000000' ||
          regularColorValue?.toString().toLowerCase() === '#ff000000';
        expect(isBlackColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001
     * @tc.number SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001
     * @tc.desc   测试 PatternLock 使用 AttributeModifier 动态更新 sideLength 属性从 300vp 到 200vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('patternLock_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialSideLength: Object | undefined = attrs ? attrs['sideLength'] : undefined;
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001] initial sideLength: " + JSON.stringify(initialSideLength));
        expect(initialSideLength?.toString()).assertEqual('300.00vp');

        let btnSideLength200 = await driver.findComponent(ON.id('btn_sideLength_200'));
        await (btnSideLength200?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('patternLock_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedSideLength: Object | undefined = attrs2 ? attrs2['sideLength'] : undefined;
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001] updated sideLength: " + JSON.stringify(updatedSideLength));
        expect(updatedSideLength?.toString()).assertEqual('200.00vp');
      } catch (err) {
        console.error('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_SIDELENGTH_UPDATE_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001
     * @tc.number SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001
     * @tc.desc   测试 PatternLock 使用 AttributeModifier 动态更新 regularColor 属性从 #FF000000 到 #FFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('patternLock_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialRegularColor: Object | undefined = attrs ? attrs['regularColor'] : undefined;
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001] initial regularColor: " + JSON.stringify(initialRegularColor));

        let btnRegularColorRed = await driver.findComponent(ON.id('btn_regularColor_red'));
        await (btnRegularColorRed?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('patternLock_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedRegularColor: Object | undefined = attrs2 ? attrs2['regularColor'] : undefined;
        console.info("[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001] updated regularColor: " + JSON.stringify(updatedRegularColor));
        let isRedColor: boolean = updatedRegularColor?.toString() === '#FFFF0000' ||
          updatedRegularColor?.toString().toLowerCase() === '#ffff0000';
        expect(isRedColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_PATTERNLOCK_ATTRIBUTEMODIFIER_REGULARCOLOR_UPDATE_001] END');
      done();
    });
  })
}
