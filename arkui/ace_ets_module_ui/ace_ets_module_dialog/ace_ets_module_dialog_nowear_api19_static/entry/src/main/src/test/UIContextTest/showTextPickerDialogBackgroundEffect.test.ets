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

export default function showTextPickerDialogBackgroundEffectTest() {
  describe('ShowTextPickerDialogBackgroundEffectTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("showTextPickerDialogBackgroundEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/showTextPickerDialogBackgroundEffect',
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      let pages = routerInstance.getState();
      console.info("get ShowTextPickerDialogBackgroundEffectTest state pages: " + JSON.stringify(pages));
      if (!("showTextPickerDialogBackgroundEffect" == pages.name)) {
        console.info("get ShowTextPickerDialogBackgroundEffectTest state pages.name: " + JSON.stringify(pages.name));
        routerInstance.pushUrl(options);
        try {
          await Utils.sleep(2000);
        } catch (err) {
          console.info('xxxTest err: ' + JSON.stringify(err));
        }
      }
    });

    
    
    
    
/**
     * @tc.number   showTextPickerDialogBackgroundEffectTest_static_0100
     * @tc.name     showTextPickerDialogBackgroundEffectTest_static_0100
     * @tc.desc     showTextPickerDialogBackgroundEffectTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showTextPickerDialogBackgroundEffectTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showTextPickerDialogBackgroundEffectTest_static_0100';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowTextPickerDialog_Effect001'))  as Component;
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
      let dialog = obj.getArray('$children')[1]
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if(uniRenderFlag == 'false' ){
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      }else{
        console.info("[showTextPickerDialogBackgroundEffectTest_static_0100] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#FFFFC0CB');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(40);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(25);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(2);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#FF0000FF');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[20.000000,20.000000]');
      }
      let btn1: Component = await driver.findComponent(ON.text('确定')) as Component;
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
     * @tc.number   showTextPickerDialogBackgroundEffectTest_static_0200
     * @tc.name     showTextPickerDialogBackgroundEffectTest_static_0200
     * @tc.desc     showTextPickerDialogBackgroundEffectTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showTextPickerDialogBackgroundEffectTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showTextPickerDialogDialogBackgroundEffectTest_static_0200';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowTextPickerDialog_Effect002')) as Component;
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
      console.info("[showTextPickerDialogBackgroundEffectTest_static_0200] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1: Component = await driver.findComponent(ON.text('确定')) as Component;
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
     * @tc.number   showTextPickerDialogBackgroundEffectTest_static_0300
     * @tc.name     showTextPickerDialogBackgroundEffectTest_static_0300
     * @tc.desc     showTextPickerDialogBackgroundEffectTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showTextPickerDialogBackgroundEffectTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showTextPickerDialogBackgroundEffectTest_static_0300';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowTextPickerDialog_Effect003')) as Component;
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
      console.info("[showTextPickerDialogBackgroundEffectTest_static_0300] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1: Component = await driver.findComponent(ON.text('确定')) as Component;
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