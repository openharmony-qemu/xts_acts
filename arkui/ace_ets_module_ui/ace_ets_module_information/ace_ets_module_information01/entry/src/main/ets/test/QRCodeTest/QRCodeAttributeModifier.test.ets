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

export default function QRCodeAttributeModifierTest() {
  describe('QRCodeAttributeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("QRCodeAttributeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/QRCode/QRCodeAttributeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QRCodeAttributeModifierTest state pages: " + JSON.stringify(pages));
        if (!("QRCodeAttributeModifier" == pages.name)) {
          console.info("get QRCodeAttributeModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push QRCodeAttributeModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QRCodeAttributeModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("QRCodeAttributeModifierTest afterEach called");
    });

    /**
     * @tc.name   SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001
     * @tc.number SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001
     * @tc.desc   测试 QRCode 使用 AttributeModifier 设置初始 color 属性为 #FF0000FF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('qrCode_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('QRCode');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let colorValue: Object | undefined = attrs ? attrs['color'] : undefined;
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001] color: " + JSON.stringify(colorValue));
        let isBlueColor: boolean = colorValue?.toString() === '#FF0000FF' ||
          colorValue?.toString().toLowerCase() === '#ff0000ff';
        expect(isBlueColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001
     * @tc.number SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001
     * @tc.desc   测试 QRCode 使用 AttributeModifier 设置初始 backgroundColor 属性为 #FF008000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001] START');
      try {
        let strJson: string = getInspectorByKey('qrCode_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001] obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('QRCode');
        let attrs = obj['$attrs'] as Record<string, Object>;
        let backgroundColorValue: Object | undefined = attrs ? attrs['backgroundColor'] : undefined;
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001] backgroundColor: " + JSON.stringify(backgroundColorValue));
        let isGreenColor: boolean = backgroundColorValue?.toString() === '#FF008000' ||
          backgroundColorValue?.toString().toLowerCase() === '#ff008000';
        expect(isGreenColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001
     * @tc.number SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001
     * @tc.desc   测试 QRCode 使用 AttributeModifier 动态更新 color 属性从 #FF0000FF 到 #FFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('qrCode_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialColor: Object | undefined = attrs ? attrs['color'] : undefined;
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001] initial color: " + JSON.stringify(initialColor));

        let btnColorRed = await driver.findComponent(ON.id('btn_color_red'));
        await (btnColorRed?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('qrCode_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedColor: Object | undefined = attrs2 ? attrs2['color'] : undefined;
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001] updated color: " + JSON.stringify(updatedColor));
        let isRedColor: boolean = updatedColor?.toString() === '#FFFF0000' ||
          updatedColor?.toString().toLowerCase() === '#ffff0000';
        expect(isRedColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_COLOR_UPDATE_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001
     * @tc.number SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001
     * @tc.desc   测试 QRCode 使用 AttributeModifier 动态更新 backgroundColor 属性从 #FF008000 到 #FFFFFFFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001] START');
      try {
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        let strJson: string = getInspectorByKey('qrCode_attribute_modifier');
        let obj: Record<string, Object> = JSON.parse(strJson);
        let attrs = obj['$attrs'] as Record<string, Object>;
        let initialBackgroundColor: Object | undefined = attrs ? attrs['backgroundColor'] : undefined;
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001] initial backgroundColor: " + JSON.stringify(initialBackgroundColor));

        let btnBackgroundColorWhite = await driver.findComponent(ON.id('btn_backgroundColor_white'));
        await (btnBackgroundColorWhite?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strJson2: string = getInspectorByKey('qrCode_attribute_modifier');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let updatedBackgroundColor: Object | undefined = attrs2 ? attrs2['backgroundColor'] : undefined;
        console.info("[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001] updated backgroundColor: " + JSON.stringify(updatedBackgroundColor));
        let isWhiteColor: boolean = updatedBackgroundColor?.toString() === '#FFFFFFFF' ||
          updatedBackgroundColor?.toString().toLowerCase() === '#ffffffff';
        expect(isWhiteColor).assertTrue();
      } catch (err) {
        console.error('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001] error: ' + JSON.stringify(err));
      }
      console.info('[SUB_ARKUI_QRCODE_ATTRIBUTEMODIFIER_BACKGROUNDOLOR_UPDATE_001] END');
      done();
    });
  })
}
