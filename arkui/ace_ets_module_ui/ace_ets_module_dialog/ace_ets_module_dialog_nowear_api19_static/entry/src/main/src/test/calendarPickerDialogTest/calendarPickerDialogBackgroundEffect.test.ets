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

export default function calendarPickerDialogBackgroundEffectTest() {
  describe('CalendarPickerDialogBackgroundEffectTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("CalendarPickerDialogBackgroundEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBackgroundEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CalendarPickerDialogBackgroundEffectTest state pages: " + JSON.stringify(pages));
        if (!("calendarPickerDialogBackgroundEffect" == pages.name)) {
          console.info("get CalendarPickerDialogBackgroundEffectTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push CalendarPickerDialogBackgroundEffectTest page error: " + err);
      }

    });

    
    
    
    
/**
     * @tc.number   calendarPickerDialogBackgroundEffectTest_static_0100
     * @tc.name     calendarPickerDialogBackgroundEffectTest_static_0100
     * @tc.desc     calendarPickerDialogBackgroundEffectTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('calendarPickerDialogBackgroundEffectTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'calendarPickerDialogBackgroundEffectTest_static_0100';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('CalendarPickerDialog_Effect001'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = obj.getArray('$children')[1]
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if(uniRenderFlag == 'false' ){
        console.info('[' + tagName + '] START2=22222222');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      }else{
        console.info("[calendarPickerDialogBackgroundEffectTest_static_0100] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#FFFFC0CB');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(40);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(25);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(2);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#FF0000FF');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[20.000000,20.000000]');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      try {
        await (btn1?.click() as Promise<void>);
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
     * @tc.number   calendarPickerDialogBackgroundEffectTest_static_0200
     * @tc.name     calendarPickerDialogBackgroundEffectTest_static_0200
     * @tc.desc     calendarPickerDialogBackgroundEffectTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('calendarPickerDialogBackgroundEffectTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'calendarPickerDialogBackgroundEffectTest_static_0200';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('CalendarPickerDialog_Effect002'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      console.info('[' + tagName + '] START===' + JSON.stringify(inspector.getInspectorTree()));
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[calendarPickerDialogBackgroundEffectTest_static_0200] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1 = await driver.findComponent(ON.text('确定'));
      try {
        await (btn1?.click() as Promise<void>);
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
     * @tc.number   calendarPickerDialogBackgroundEffectTest_static_0300
     * @tc.name     calendarPickerDialogBackgroundEffectTest_static_0300
     * @tc.desc     calendarPickerDialogBackgroundEffectTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('calendarPickerDialogBackgroundEffectTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'calendarPickerDialogBackgroundEffectTest_static_0300';
      console.info('[' + tagName + '] START============================');
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('CalendarPickerDialog_Effect003'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('xxxTest err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[calendarPickerDialogBackgroundEffectTest_static_0300] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1 = await driver.findComponent(ON.text('确定'));
      try {
        await (btn1?.click() as Promise<void>);
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