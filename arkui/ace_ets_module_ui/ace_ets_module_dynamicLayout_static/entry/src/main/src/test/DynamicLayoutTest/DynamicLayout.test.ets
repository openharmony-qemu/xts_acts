'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function DynamicLayoutTest() {
  describe('DynamicLayoutTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.dynamicLayout.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/DynamicLayout/DynamicLayoutIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] DynamicLayoutTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "DynamicLayoutIndex") { routerInstance.replaceUrl(options); }
        await Utils.sleep(500);
      } catch (err) { console.error('[ARKUI_NEW] DynamicLayoutTest replaceUrl error: ' + err); expect().assertFail(); }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] DynamicLayoutTest afterEach end');
    });

    /**
     * @tc.number DynamicLayoutTest_001
     * @tc.name dynamicLayoutComponentRendered
     * @tc.desc Verify DynamicLayout component renders in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicLayoutComponentRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutComponentRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('dlComp1');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutComponentRendered END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] dynamicLayoutComponentRendered error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DynamicLayoutTest_002
     * @tc.name dynamicLayoutAttributeModifierUndefined
     * @tc.desc Verify DynamicLayout.attributeModifier(undefined) renders normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicLayoutAttributeModifierUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutAttributeModifierUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('dlComp1');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutAttributeModifierUndefined END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] dynamicLayoutAttributeModifierUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DynamicLayoutTest_003
     * @tc.name dynamicLayoutWithoutModifier
     * @tc.desc Verify DynamicLayout without attributeModifier renders normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicLayoutWithoutModifier', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutWithoutModifier START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('dlComp2');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutWithoutModifier END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] dynamicLayoutWithoutModifier error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DynamicLayoutTest_004
     * @tc.name dynamicLayoutChildContentRendered
     * @tc.desc Verify DynamicLayout child content (CustomBuilder) rendered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicLayoutChildContentRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutChildContentRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('dlItemA');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutChildContentRendered END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] dynamicLayoutChildContentRendered error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DynamicLayoutTest_005
     * @tc.name dynamicLayoutPageShown
     * @tc.desc Verify page onPageShow was triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicLayoutPageShown', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutPageShown START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('dlPageShown');
        console.info('[ARKUI_NEW] dlPageShown = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        console.info('[ARKUI_NEW] DynamicLayoutTest execute: dynamicLayoutPageShown END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] dynamicLayoutPageShown error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
