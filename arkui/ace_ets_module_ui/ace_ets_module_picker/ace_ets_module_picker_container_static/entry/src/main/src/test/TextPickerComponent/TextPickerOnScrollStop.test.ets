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
import { describe, beforeEach, it, expect, Level, beforeAll, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, ON, MouseButton, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
export default function TextPickerOnScrollStopTest() {
  describe('TextPickerOnScrollStopTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("TextPickerOnScrollStopTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextPickerOnScrollStopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPickerComponent/TextPickerOnScrollStop',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerOnScrollStopTest state pages:' + JSON.stringify(pages));
        if (!('TextPickerOnScrollStop' == pages.name)) {
          console.info('get TextPickerOnScrollStopTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push TextPickerOnScrollStopTest page error:' + err);
      }
      console.info('TextPickerOnScrollStopTest beforeEach end');
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ONSCROLLSTOP_STATIC_0010
     * @tc.name     TextPickerOnScrollStop_static_001
     * @tc.desc     Test TextPickerScrollStopCallback with single column text list - value is string, index is number
     * @tc.level    Level.LEVEL1
     */
    it('TextPickerOnScrollStop_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerOnScrollStop_static_001 START');
      const driver = Driver.create();
      await Utils.sleep(SLEEP_TIME_L);
      const picker = await driver.findComponent(ON.id('textpicker_onscrollstop_single'));
      console.info('TextPickerOnScrollStop_static_001 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const valueText = await driver.findComponent(ON.id('text_onscrollstop_single_value'));
      const valueStr = await valueText?.getText();
      console.info('TextPickerOnScrollStop_static_001 valueStr: ' + valueStr);
      await Utils.sleep(SLEEP_TIME_L);
      expect(valueStr).assertContain('singleValue:');
      let isValidValue: boolean = valueStr!.indexOf('apple1') >= 0 || valueStr!.indexOf('orange2') >= 0 ||
        valueStr!.indexOf('peach3') >= 0 || valueStr!.indexOf('grape4') >= 0;
      expect(isValidValue).assertTrue();
      const indexText = await driver.findComponent(ON.id('text_onscrollstop_single_index'));
      const indexStr = await indexText?.getText();
      console.info('TextPickerOnScrollStop_static_001 indexStr: ' + indexStr);
      await Utils.sleep(SLEEP_TIME_L);
      expect(indexStr).assertContain('singleIndex:');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ONSCROLLSTOP_STATIC_0020
     * @tc.name     TextPickerOnScrollStop_static_002
     * @tc.desc     Test TextPickerScrollStopCallback with single column image-only list - value is empty string
     * @tc.level    Level.LEVEL1
     */
    it('TextPickerOnScrollStop_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerOnScrollStop_static_002 START');
      const driver = Driver.create();
      await Utils.sleep(SLEEP_TIME_L);
      const picker = await driver.findComponent(ON.id('textpicker_onscrollstop_image'));
      console.info('TextPickerOnScrollStop_static_002 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const valueText = await driver.findComponent(ON.id('text_onscrollstop_image_value'));
      const valueStr = await valueText?.getText();
      console.info('TextPickerOnScrollStop_static_002 valueStr: ' + valueStr);
      await Utils.sleep(SLEEP_TIME_L);
      expect(valueStr).assertContain('imageValue:');
      const indexText = await driver.findComponent(ON.id('text_onscrollstop_image_index'));
      const indexStr = await indexText?.getText();
      console.info('TextPickerOnScrollStop_static_002 indexStr: ' + indexStr);
      await Utils.sleep(SLEEP_TIME_L);
      expect(indexStr).assertContain('imageIndex:');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ONSCROLLSTOP_STATIC_0030
     * @tc.name     TextPickerOnScrollStop_static_003
     * @tc.desc     Test TextPickerScrollStopCallback with multi-column text list - value is string[], index is number[]
     * @tc.level    Level.LEVEL1
     */
    it('TextPickerOnScrollStop_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerOnScrollStop_static_003 START');
      const driver = Driver.create();
      await Utils.sleep(SLEEP_TIME_L);
      const picker = await driver.findComponent(ON.id('textpicker_onscrollstop_multi'));
      console.info('TextPickerOnScrollStop_static_003 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const valueText = await driver.findComponent(ON.id('text_onscrollstop_multi_value'));
      const valueStr = await valueText?.getText();
      console.info('TextPickerOnScrollStop_static_003 valueStr: ' + valueStr);
      await Utils.sleep(SLEEP_TIME_L);
      expect(valueStr).assertContain('multiValue:[');
      const indexText = await driver.findComponent(ON.id('text_onscrollstop_multi_index'));
      const indexStr = await indexText?.getText();
      console.info('TextPickerOnScrollStop_static_003 indexStr: ' + indexStr);
      await Utils.sleep(SLEEP_TIME_L);
      expect(indexStr).assertContain('multiIndex:[');
      done();
    })
  })
}
