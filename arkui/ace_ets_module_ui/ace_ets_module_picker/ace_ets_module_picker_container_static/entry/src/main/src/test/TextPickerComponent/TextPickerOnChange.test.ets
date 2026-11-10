'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, ON, MouseButton, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME_L = 1000;
export default function TextPickerOnChangeTest() {
  describe('TextPickerOnChangeTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info('TextPickerOnChangeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPickerComponent/TextPickerOnChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerOnChangeTest state pages:' + JSON.stringify(pages));
        if (!('TextPickerOnChange' == pages.name)) {
          console.info('get TextPickerOnChangeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push TextPickerOnChangeTest page error:' + err);
      }
      console.info('TextPickerOnChangeTest beforeEach end');
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ONCHANGE_STATIC_0010
     * @tc.name     TextPickerOnChange_static_001
     * @tc.desc     Test OnTextPickerChangeCallback with single column text list - selectItem is string, index is number
     * @tc.level    Level.LEVEL1
     */
    it('TextPickerOnChange_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerOnChange_static_001 START')
      try {
        const driver = Driver.create();
	await Utils.sleep(SLEEP_TIME_L);
        const picker = await driver.findComponent(ON.id('textpicker_onchange_single'));
        console.info('TextPickerOnChange_static_001 findComponent');
        const rect = await (picker?.getBounds() as Promise<Rect>);
        let top = rect.top;
        let left = rect.left;
        let right = rect.right;
        let bottom = rect.bottom;
        console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
        let displayId = await picker?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round((left + right) / 2).toInt(), y: Math.round((top + bottom) / 2).toInt(), displayId: displayId },
          { x: Math.round((left + right) / 2).toInt(), y: Math.round((top + bottom) / 4).toInt(), displayId: displayId }, 600
        );
        await Utils.sleep(SLEEP_TIME_L);
        const valueText = await driver.findComponent(ON.id('text_onchange_single_value'));
        const valueStr = await valueText?.getText();
        console.info('TextPickerOnChange_static_001 valueStr: ' + valueStr);
        expect(valueStr).assertContain('singleValue:');
        let isValidValue: boolean = valueStr!.indexOf('apple1') >= 0 || valueStr!.indexOf('orange2') >= 0 ||
          valueStr!.indexOf('peach3') >= 0 || valueStr!.indexOf('grape4') >= 0;
        expect(isValidValue).assertTrue();
        const indexText = await driver.findComponent(ON.id('text_onchange_single_index'));
        const indexStr = await indexText?.getText();
        console.info('TextPickerOnChange_static_001 indexStr: ' + indexStr);
        expect(indexStr).assertContain('singleIndex:');
      } catch (error) {
        console.info('TextPickerOnChange_static_001 err: ' + JSON.stringify(error));
      }
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ONCHANGE_STATIC_0020
     * @tc.name     TextPickerOnChange_static_002
     * @tc.desc     Test OnTextPickerChangeCallback with single column image-only list - selectItem is empty string
     * @tc.level    Level.LEVEL1
     */
    it('TextPickerOnChange_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerOnChange_static_002 START');
      try {
        const driver = Driver.create();
	await Utils.sleep(SLEEP_TIME_L);
        const picker = await driver.findComponent(ON.id('textpicker_onchange_image'));
        console.info('TextPickerOnChange_static_002 findComponent');
        const rect = await (picker?.getBounds() as Promise<Rect>);
        let top = rect.top;
        let left = rect.left;
        let right = rect.right;
        let bottom = rect.bottom;
        console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
        let displayId = await picker?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round((left + right) / 2).toInt(), y: Math.round((top + bottom) / 2).toInt(), displayId: displayId },
          { x: Math.round((left + right) / 2).toInt(), y: Math.round((top + bottom) / 4).toInt(), displayId: displayId }, 600
        );
        await Utils.sleep(SLEEP_TIME_L);
        const valueText = await driver.findComponent(ON.id('text_onchange_image_value'));
        const valueStr = await valueText?.getText();
        console.info('TextPickerOnChange_static_002 valueStr: ' + valueStr);
        expect(valueStr).assertContain('imageValue:');
        const indexText = await driver.findComponent(ON.id('text_onchange_image_index'));
        const indexStr = await indexText?.getText();
        console.info('TextPickerOnChange_static_002 indexStr: ' + indexStr);
        expect(indexStr).assertContain('imageIndex:');
      } catch (error) {
        console.info('TextPickerOnChange_static_002 err: ' + JSON.stringify(error));
      }
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ONCHANGE_STATIC_0030
     * @tc.name     TextPickerOnChange_static_003
     * @tc.desc     Test OnTextPickerChangeCallback with multi-column text list - selectItem is string[], index is number[]
     * @tc.level    Level.LEVEL1
     */
    it('TextPickerOnChange_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerOnChange_static_003 START');
      try {
        const driver = Driver.create();
	await Utils.sleep(SLEEP_TIME_L);
        const picker = await driver.findComponent(ON.id('textpicker_onchange_multi'));
        console.info('TextPickerOnChange_static_003 findComponent');
        const rect = await (picker?.getBounds() as Promise<Rect>);
        let top = rect.top;
        let left = rect.left;
        let right = rect.right;
        let bottom = rect.bottom;
        console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
        let displayId = await picker?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round((left + right) / 2).toInt(), y: Math.round((top + bottom) / 2).toInt(), displayId: displayId },
          { x: Math.round((left + right) / 2).toInt(), y: Math.round((top + bottom) / 4).toInt(), displayId: displayId }, 600
        );
        await Utils.sleep(SLEEP_TIME_L);
        const valueText = await driver.findComponent(ON.id('text_onchange_multi_value'));
        const valueStr = await valueText?.getText();
        console.info('TextPickerOnChange_static_003 valueStr: ' + valueStr);
        expect(valueStr).assertContain('multiValue:[');
        const indexText = await driver.findComponent(ON.id('text_onchange_multi_index'));
        const indexStr = await indexText?.getText();
        console.info('TextPickerOnChange_static_003 indexStr: ' + indexStr);
        expect(indexStr).assertContain('multiIndex:[');
      } catch (error) {
        console.info('TextPickerOnChange_static_003 err: ' + JSON.stringify(error));
      }
      done();
    })
  })
}
