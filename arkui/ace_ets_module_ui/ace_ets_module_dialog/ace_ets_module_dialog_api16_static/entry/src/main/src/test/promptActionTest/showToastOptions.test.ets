/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function showToastOptions() {
  describe('showToastOptions', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })

    beforeEach(async () => {
      console.info("showToastOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showToastOptions',
      }
      try {
        const showToastOptions = AppStorage.get<Router>("router") as Router
        showToastOptions.clear();
        let pages:router.RouterState = showToastOptions.getState();
        console.info("get showToastOptions state pages: " + JSON.stringify(pages));
        if (!("showToastOptions" == pages.name)) {
          console.info("get showToastOptions state pages.name: " + JSON.stringify(pages.name));
          // let result = await showToastOptions.pushUrl(options);
          showToastOptions.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showToastOptions success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push showToastOptions page error: " + err);
        expect().assertFail();
      }
    });

    let currentDeviceIsPC = false


    /**
     * @tc.number SUB_ACE_showToastOptions_static_0100
     * @tc.name showToastOptions_static_0100
     * @tc.desc To test showToastOptions  shadow：ShadowStyle.OUTER_DEFAULT_MD
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('showToastOptions_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('md'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      
      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Toast Massage'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1]?.getElement('$attrs')
        console.info('[showToastOptions_static_0100] column'+ JSON.stringify(column))
        let shadow:string = column!.getString('shadow')
        console.info('[showToastOptions_static_0100] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_static_0200
     * @tc.name showToastOptions_static_0200
     * @tc.desc To test  showToastOptions
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('shadowOption'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

       if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')

        let radius:string|undefined = column.getElement('shadow')?.getString('radius ')
        let type:string|undefined  = column.getElement('shadow')?.getString('type')
        let color:string|undefined  = column.getElement('shadow')?.getString('color')
        let offsetX:string|undefined  = column.getElement('shadow')?.getString('offsetX')
        let offsetY:string|undefined  = column.getElement('shadow')?.getString('offsetY')
        let fill:string|undefined  = column.getElement('shadow')?.getString('fill')

        expect(radius).assertEqual('10.000000')
        expect(type).assertEqual('1')
        expect(color).assertEqual('#FF94A0F0')
        expect(offsetX).assertEqual('2.000000')
        expect(offsetY).assertEqual('3.000000')
        expect(fill).assertEqual('1')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0200 END');
      done();
    });
    
    /**
     * @tc.number SUB_ACE_showToastOptions_static_0300
     * @tc.name showToastOptions_static_0300
     * @tc.desc To test  showToastOptions undefined
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('xs'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_static_0400
     * @tc.name showToastOptions_static_0400
     * @tc.desc To test  showToastOptions shadow: ShadowStyle.OUTER_DEFAULT_SM
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('sm'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);


      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
        console.info('[showToastOptions_static_0400] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0400 END');
      done();
    });

    
    /**
     * @tc.number SUB_ACE_showToastOptions_static_0500
     * @tc.name showToastOptions_static_0500
     * @tc.desc To test  showToastOptions shadow: ShadowStyle.OUTER_FLOATING_LG
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('lg'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
      
        console.info('[showToastOptions_static_0500] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG')
     
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_static_0600
     * @tc.name showToastOptions_static_0600
     * @tc.desc To test  showToastOptions shadow: ShadowStyle.OUTER_FLOATING_SM
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('fsm'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);


      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
        console.info('[showToastOptions_static_0600] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM')
      }

      
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0600 END');
      done();
    });


     /**
     * @tc.number SUB_ACE_showToastOptions_static_0700
     * @tc.name showToastOptions_static_0700
     * @tc.desc To test  showToastOptions backgroundBlurStyle
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0700 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('fmd'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
      
        console.info('[showToastOptions_static_0700] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD')
      }

     

      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_static_0800
     * @tc.name showToastOptions_static_0800
     * @tc.desc To test  showToastOptions shadow: null
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0800 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nul'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

       if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
        console.info('[showToastOptions_static_0800] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_static_0900
     * @tc.name showToastOptions_static_0900
     * @tc.desc To test  showToastOptions shadow: null
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastOptions_static_0900 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('unf'));
      await ( button?.click()  as Promise<void> );
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column = obj.getArray('$children')[1].getElement('$attrs')
        let shadow:string = column.getString('shadow')
        console.info('[showToastOptions_static_0900] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD')
      }

      await CommonFunc.sleep(1000);
      console.info('showToastOptions_static_0900 END');
      done();
    });
  })
}