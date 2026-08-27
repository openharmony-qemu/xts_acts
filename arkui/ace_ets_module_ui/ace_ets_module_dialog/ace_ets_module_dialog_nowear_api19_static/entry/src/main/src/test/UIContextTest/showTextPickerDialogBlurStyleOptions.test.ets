'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function showTextPickerDialogBlurStyleOptionsTest() {
  describe('ShowTextPickerDialogBlurStyleOptionsTest', () => {


    beforeEach(async (): Promise<void> => {
      console.info("ShowTextPickerDialogBlurStyleOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/showTextPickerDialogBlurStyleOptions',
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      let pages = routerInstance.getState();
      console.info("get ShowTextPickerDialogBlurStyleOptionsTest state pages: " + JSON.stringify(pages));
      if (!("showTextPickerDialogBlurStyleOptions" == pages.name)) {
        console.info("get ShowTextPickerDialogBlurStyleOptionsTest state pages.name: " + JSON.stringify(pages.name));

        routerInstance.pushUrl(options);
        try {
          await Utils.sleep(2000);
        } catch (err) {
          console.info('xxxTest err: ' + JSON.stringify(err));
        }

      }
    });

    
    
    
    
/**
     * @tc.number   showTextPickerDialogBlurStyleOptions_static_0100
     * @tc.name     showTextPickerDialogBlurStyleOptions_static_0100
     * @tc.desc     showTextPickerDialogBlurStyleOptions_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showTextPickerDialogBlurStyleOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showTextPickerDialogBlurStyleOptions';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowTextPickerDialog_Options001')) as Component;
      try {
        await btn!.click();
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let dialog = obj1.getArray('$children')[1]
      let date1 = obj1.getArray('$children')[1].getArray('$children')[0]
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if(uniRenderFlag == 'false' ){
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(1.0);
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.System');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      }else{
        console.info("[showTextPickerDialogBlurStyleOptions_static_0100] $attrs.options is: " + JSON.stringifyJsonElement(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Average');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(0);
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.Light');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#FFFFC0CB');
      }
      let btn1: Component = await driver.findComponent(ON.text('确定'))  as Component;
      try {
        await btn1!.click();
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   showTextPickerDialogBlurStyleOptions_static_0200
     * @tc.name     showTextPickerDialogBlurStyleOptions_static_0200
     * @tc.desc     showTextPickerDialogBlurStyleOptions_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showTextPickerDialogBlurStyleOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showTextPickerDialogBlurStyleOptions_static_0200';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowTextPickerDialog_Options002')) as Component;
      try {
        await btn!.click();
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[showTextPickerDialogBlurStyleOptions_static_0200] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(1.0);
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.System');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      let btn1: Component = await driver.findComponent(ON.text('确定'))  as Component;
      try {
        await btn1!.click();
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   showTextPickerDialogBlurStyleOptions_static_0300
     * @tc.name     showTextPickerDialogBlurStyleOptions_static_0300
     * @tc.desc     showTextPickerDialogBlurStyleOptions_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showTextPickerDialogBlurStyleOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showTextPickerDialogBlurStyleOptions_static_0300';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowTextPickerDialog_Options003')) as Component;
      try {
        await btn!.click();
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[showTextPickerDialogBlurStyleOptions_static_0300] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(1.0);
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.System');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      let btn1: Component = await driver.findComponent(ON.text('确定'))  as Component;
      try {
        await btn1!.click();
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}