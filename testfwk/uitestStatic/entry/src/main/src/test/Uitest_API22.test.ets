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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation,
  ComponentEventType, WindowChangeType, UiWindow, ResizeDirection, Point } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import display from '@ohos.display';
import { Utils, startAbility, stopApplication } from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag = 'uitestTag';
const waitUiReadyMs: int = 1000;
const DeviceErrorCode = 17000005;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}


function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) { }
  return
}

export default function uitestDriverTestApi22() {
  describe('uitestTest_Api22', (): void => {
    let driver: Driver;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverTestApi22 loadup start!!!!!");
      driver = Driver.create();
      await Utils.msSleep(1000);
      hilog.info(domain, tag, "uitestDriverTestApi22 loadup over!!!!!")
    })

    /**
     * @tc.number uitestDriverTest_Api22_001
     * @tc.name testComponentEventOccurOptionsClickMonitor_static
     * @tc.desc monitor component click.
     */
    it('testComponentEventOccurOptionsClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == 'toast').assertTrue()
          expect(elementInfo.type == 'Button').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        let on1 = ON.isBefore(ON.text('next page')).type('Button');
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 9000,
          on: on1
        } , callback)
      } catch(error: BusinessError) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static onceComponentEventOccur error ,${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }

      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let btn = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      if (btn) {
        await btn.click()
        await driver.delayMs(11000)
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_002
     * @tc.name testComponentEventOccurOptionsLongClickMonitor_static
     * @tc.desc monitor component LongClick.
     */
    it('testComponentEventOccurOptionsLongClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Button').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_LONG_CLICKED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static callback,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_LONG_CLICKED,{
          on: ON.type('Button').text('')
        }, callback);
      } catch(error: BusinessError) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.text('next page'));
      expect(btn != null).assertTrue()
      if (btn) {
        await btn.longClick();
        await driver.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_003
     * @tc.name testComponentEventOccurOptionsWithInClickMonitor_static
     * @tc.desc monitor component click.
     */
    it('testComponentEventOccurOptionsWithInClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsWithInClickMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsWithInClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == 'toast').assertTrue();
          expect(elementInfo.type == 'Button').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsWithInClickMonitor_static error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 9000,
          on: ON.within(ON.type('Scroll')).text('toast')
        } , callback);
      } catch(error: BusinessError) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsWithInClickMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('toast'));
      expect(btn != null).assertTrue();
      if(btn) {
        await btn.click();
        await driver.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsWithInClickMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_004
     * @tc.name testComponentEventOccurOptionsScrollStartMonitor_static
     * @tc.desc monitor component Scroll start.
     */
    it('testComponentEventOccurOptionsScrollStartMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Scroll').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_START).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_START, {
          on: ON.type('Scroll').id('parentScroll')
        }, callback);
      } catch(error: BusinessError) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      if(scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()});
        await driver.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_005
     * @tc.name testComponentEventOccurOptionsScrollEndMonitor_static
     * @tc.desc monitor component Scroll end.
     */
    it('testComponentEventOccurOptionsScrollEndMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == '').assertTrue()
          expect(elementInfo.type == 'Scroll').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_END).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static callback error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_END,{
          on: ON.type('Scroll').id('parentScroll')
        }, callback);
      } catch(error: BusinessError) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      if (scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()});
        await driver.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_006
     * @tc.name testComponentEventOccurOptionsTextContentMonitor_static
     * @tc.desc monitor component text changed.
     */
    it('testComponentEventOccurOptionsTextContentMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '123456').assertTrue();
          expect(elementInfo.type == 'TextInput').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_TEXT_CHANGED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static callback error, ${JSON.stringify(err)}`);
        }
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let nextPageBtn = await driver.findComponent(ON.text('next page'));
      await driver.delayMs(waitUiReadyMs);
      expect(nextPageBtn != null).assertTrue();
      if(nextPageBtn) {
        await nextPageBtn.click();
        await driver.delayMs(waitUiReadyMs);
        try {
          observer.onceComponentEventOccur(ComponentEventType.COMPONENT_TEXT_CHANGED,{
            on: ON.id('changContext')
          }, callback);
        } catch(error: BusinessError) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
          expect(error.code).assertEqual(DeviceErrorCode);
        }

        let changContextTxt = await driver.findComponent(ON.id('changContext'));
        expect(changContextTxt != null).assertTrue();
        if(changContextTxt) {
          await changContextTxt.inputText('123456');
          await driver.delayMs(5000);
        }
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_007
     * @tc.name testComponentEventOccurOptionsTimeOutClickMonitor_static
     * @tc.desc monitor component click.
     */
    it('testComponentEventOccurOptionsTimeOutClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static start`);
      let isCallback = false;
      let observer = driver.createUIEventObserver()
      let callback = (elementInfo : UIElementInfo): void => {
        try {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
          isCallback = true;
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == 'toast').assertTrue()
          expect(elementInfo.type == 'Button').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
        } catch (err) {
          isCallback = false;
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 3000,
          on: ON.isBefore(ON.text('next page')).type('Button')
        } , callback)
      } catch(error: BusinessError) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let btn = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      await driver.delayMs(5000);
      if (btn) {
        await btn.click()
      }
      await driver.delayMs(waitUiReadyMs)
      await stopApplication('com.uitestScene.acts')
      expect(isCallback).assertFalse();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_008
     * @tc.name tesIsComponentPresentWhenLongClickTrue_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('tesIsComponentPresentWhenLongClickTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue_static start`);
      await driver.delayMs(waitUiReadyMs);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue_static start driver.findComponent`);
      let to5Btn = await driver.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if(to5Btn != null) {
        await to5Btn.click();
        await driver.delayMs(waitUiReadyMs);
      }
      let longClickBtn = await driver.findComponent(ON.id('longClickBtn'));
      await driver.delayMs(waitUiReadyMs);
      expect(longClickBtn != null).assertTrue();
      if (longClickBtn != null) {
        let center = await longClickBtn.getBoundsCenter();
        await driver.delayMs(waitUiReadyMs);
        let result =  await driver.isComponentPresentWhenLongClick(ON.text('ShowLongEventText'), center, 5000)
        expect(result).assertTrue();
        await driver.delayMs(waitUiReadyMs);
        let longClickTextResultBtn = await driver.findComponent(ON.id('longClickTextResult'));
        expect(longClickTextResultBtn != null).assertTrue();
        if (longClickTextResultBtn != null) {
          let longClickText = await longClickTextResultBtn.getText();
          expect(longClickText == 'longClickEvent').assertTrue();
        }
      }
      await driver.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_09
     * @tc.name tesIsComponentPresentWhenLongClickFalse_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('tesIsComponentPresentWhenLongClickFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let to5Btn = await driver.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if(to5Btn != null) {
        await to5Btn.click();
        await driver.delayMs(waitUiReadyMs);
      }
      let longClickBtn = await driver.findComponent(ON.id('longClickBtn'));
      expect(longClickBtn != null).assertTrue();
      if (longClickBtn != null) {
        await driver.delayMs(waitUiReadyMs);
        let center = await longClickBtn.getBoundsCenter();
        await driver.delayMs(waitUiReadyMs);
        let disPlay = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom disPlay is: ${JSON.stringify(disPlay)}`);
        let result =  await driver.isComponentPresentWhenLongClick(ON.text('ShowLongEventTextNot'), {
          x: center.x,
          y: center.y,
          displayId: disPlay.id.toInt()
        }, 3000)
        expect(result).assertFalse();
        await driver.delayMs(waitUiReadyMs);
        let longClickTextResultBtn = await driver.findComponent(ON.id('longClickTextResult'));
        expect(longClickTextResultBtn != null).assertTrue();
        if (longClickTextResultBtn != null) {
          let longClickText = await longClickTextResultBtn.getText();
          expect(longClickText == 'longClickEvent').assertTrue();
        }
        await driver.delayMs(waitUiReadyMs);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_010
     * @tc.name tesIsComponentPresentWhenDragTrue_static
     * @tc.desc isComponentPresentWhenDrag test.
     */
    it('tesIsComponentPresentWhenDragTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let to5Btn = await driver.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver.delayMs(waitUiReadyMs);
      let dragColCom = await driver.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue();
      if (dragColCom != null) {
        await driver.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue();
        if (dragResultTextCom != null) {
          await driver.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let result =  await driver.isComponentPresentWhenDrag(ON.text('ShowDragEventText'), center1, center2, 5000)
          console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static result, ${JSON.stringify(result)}`);
          expect(result).assertTrue();
        }
      }
      let text = await driver.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_011
     * @tc.name tesIsComponentPresentWhenDragFalse_static
     * @tc.desc isComponentPresentWhenDrag test.
     */
    it('tesIsComponentPresentWhenDragFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let to5Btn = await driver.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue()
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver.delayMs(waitUiReadyMs);
      let dragColCom = await driver.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue()
      if (dragColCom != null) {
        await driver.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue()
        if (dragResultTextCom != null) {
          await driver.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let disPlay = display.getDefaultDisplaySync();
          console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static disPlay is: ${JSON.stringify(disPlay)}`);
          let result =  await driver.isComponentPresentWhenDrag(ON.text('ShowDragEventTextNot'), {
            x: center1.x,
            y: center1.y,
            displayId: disPlay.id.toInt()
          }, {
            x: center2.x,
            y: center2.y,
            displayId: disPlay.id.toInt()
          })
          console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static result, ${JSON.stringify(result)}`);
          expect(result).assertFalse();
        }
      }
      let text = await driver.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_012
     * @tc.name tesIsComponentPresentWhenSwipeTrue_static
     * @tc.desc isComponentPresentWhenSwipe test.
     */
    it('tesIsComponentPresentWhenSwipeTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue()
      if (scrollBar != null) {
        let rect = await scrollBar.getBounds()
        let center = await scrollBar.getBoundsCenter()
        let result =  await driver.isComponentPresentWhenSwipe(ON.text('ShowSwipeEventCom'),
          {x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()}, 9000)
        console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue_static result, ${JSON.stringify(result)}`);
        expect(result).assertTrue();
      }
      let text = await driver.findComponent(ON.text('toast'))
      expect(text == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_013
     * @tc.name tesIsComponentPresentWhenSwipeFalse_static
     * @tc.desc isComponentPresentWhenSwipe test.
     */
    it('tesIsComponentPresentWhenSwipeFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue()
      if (scrollBar != null) {
        let rect = await scrollBar.getBounds()
        let center = await scrollBar.getBoundsCenter()
        let disPlay = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static disPlay is: ${JSON.stringify(disPlay)}`);
        let result =  await driver.isComponentPresentWhenSwipe(ON.text('ShowSwipeEventComNot'),
          {x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt()})
        console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static result, ${JSON.stringify(result)}`);
        expect(result).assertFalse();
      }
      let text = await driver.findComponent(ON.text('toast'))
      expect(text == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_014
     * @tc.name tesKnuckleKnockSingle_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('tesKnuckleKnockSingle_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockSingle_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesKnuckleKnockSingle_static play, ${JSON.stringify(play)}`);
        let points: Array<Point> = []
        let point: Point = {
          x: (play.width / 2).toInt(),
          y: (play.height / 2).toInt(),
          displayId: play.id.toInt()
        }
        points.push(point)
        await driver.delayMs(waitUiReadyMs)
        await driver.knuckleKnock(points, 2)
        await driver.delayMs(waitUiReadyMs * 2)
        let screenPng = await driver.findComponent(ON.id('SCREENSHOT_PICTURE_PREVIEWER_IMAGE'));
        expect(screenPng != null).assertTrue();
      } catch (error: BusinessError) {
        console.log(`${TestTag}, tesKnuckleKnockSingle_static error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      console.log(`${TestTag}, tesKnuckleKnockSingle_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_015
     * @tc.name tesKnuckleKnockDouble_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('tesKnuckleKnockDouble_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockDouble_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        let points: Array<Point> = []
        let point: Point = {
          x: (play.width /2).toInt(),
          y: (play.height / 2).toInt(),
          displayId: play.id.toInt()
        }
        points.push(point)
        points.push(point)
        await driver.knuckleKnock(points, 2);
        await driver.delayMs(waitUiReadyMs * 2)
        let screenPng = await driver.findComponent(ON.id('.hmos.screenrecorder__1000', MatchPattern.ENDS_WITH));
        expect(screenPng != null).assertTrue();
        await driver.knuckleKnock(points, 2);
        await driver.delayMs(waitUiReadyMs);
      } catch (error: BusinessError) {
        console.log(`${TestTag}, tesKnuckleKnockDouble_static error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      console.log(`${TestTag}, tesKnuckleKnockDouble_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_016
     * @tc.name tesKnuckleKnockS_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('tesKnuckleKnockS_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockS_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        let centerX = (play.width / 2).toInt();
        let centY = (play.height / 2).toInt();
        let fivePoint: Point = {x: centerX - 40, y: centY - 80};
        let sixPoint: Point = {x: centerX - 40, y: centY - 60};
        let sevPoint: Point = {x: centerX - 40, y: centY - 40};
        let eigPoint: Point = {x: centerX -40, y: centY - 20};
        let niePoint: Point = {x: centerX - 40, y: centY };
        let tenPoint: Point = {x: centerX - 20, y: centY};
        let ten1Point: Point = {x: centerX, y: centY};
        let ten2Point: Point = {x: centerX + 20, y: centY };
        let ten3Point: Point = {x: centerX + 40, y: centY };
        let ten4Point: Point = {x: centerX + 40, y: centY + 20};
        let ten5Point: Point = {x: centerX + 40, y: centY + 40};
        let ten6Point: Point = {x: centerX + 40, y: centY + 60};
        let ten7Point: Point = {x: centerX + 40, y: centY + 80};
        let pointers = PointerMatrix.create(1,13);
        pointers.setPoint(0,0, fivePoint);
        pointers.setPoint(0,1, sixPoint);
        pointers.setPoint(0,2, sevPoint);
        pointers.setPoint(0,3, eigPoint);
        pointers.setPoint(0,4, niePoint);
        pointers.setPoint(0,5, tenPoint);
        pointers.setPoint(0,6, ten1Point);
        pointers.setPoint(0,7, ten2Point);
        pointers.setPoint(0,8, ten3Point);
        pointers.setPoint(0,9, ten4Point);
        pointers.setPoint(0,10, ten5Point);
        pointers.setPoint(0,11, ten6Point);
        pointers.setPoint(0,12, ten7Point);
        await driver.injectKnucklePointerAction(pointers);
        await driver.delayMs(waitUiReadyMs * 2)
        let screenPng = await driver.findComponent(ON.id('ScrollHandWriteBoxStack'));
        expect(screenPng != null).assertTrue();
        await driver.pressBack();
        await Utils.msSleep(2000)
      } catch (error: BusinessError) {
        console.log(`${TestTag}, tesKnuckleKnockS_static error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      await Utils.msSleep(3000)
      console.log(`${TestTag}, tesKnuckleKnockS_static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_017
     * @tc.name tesKnuckleKnockRect_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('tesKnuckleKnockRect_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockRect_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        let centerX = (play.width / 2).toInt();
        let centY = (play.height / 2).toInt();
        let onePoint: Point = {x: centerX - 100, y: centY - 100};
        let twoPoint: Point = {x: centerX -100, y: centY};
        let threePoint: Point = {x: centerX - 100, y: centY + 100 };
        let fourPoint: Point = {x: centerX, y: centY + 100};
        let fivePoint: Point = {x: centerX + 100, y: centY + 100};
        let sixPoint: Point = {x: centerX + 100, y: centY};
        let sevPoint: Point = {x: centerX  + 100, y: centY - 100};
        let eigPoint: Point = {x: centerX, y: centY - 100};
        let ninePoint: Point = {x: centerX - 100, y: centY - 100};
        let pointers = PointerMatrix.create(1,9);
        pointers.setPoint(0,0, onePoint);
        pointers.setPoint(0,1, twoPoint);
        pointers.setPoint(0,2, threePoint);
        pointers.setPoint(0,3, fourPoint);
        pointers.setPoint(0,4, fivePoint);
        pointers.setPoint(0,5, sixPoint);
        pointers.setPoint(0,6, sevPoint);
        pointers.setPoint(0,7, eigPoint);
        pointers.setPoint(0,8, ninePoint);
        await driver.injectKnucklePointerAction(pointers);
        await driver.delayMs(waitUiReadyMs * 6)
        let screenPng = await driver.findComponent(ON.text('保存'));
        expect(screenPng != null).assertTrue();
        await driver.pressBack();
        await Utils.msSleep(2000)
      } catch (error: BusinessError) {
        console.log(`${TestTag}, tesKnuckleKnockRect_static error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      await Utils.msSleep(3000)
      console.log(`${TestTag}, tesKnuckleKnockRect_static end`);
    })


    /**
     * @tc.number uitestDriverTest_Api22_018
     * @tc.name teTouchPadTwoFingersScrollVer_Static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('teTouchPadTwoFingersScrollVer_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, teTouchPadTwoFingersScrollVer_Static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'));
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await driver.delayMs(waitUiReadyMs);
          let center = await scrollBar.getBoundsCenter();
          await driver.delayMs(waitUiReadyMs);
          await driver.touchPadTwoFingersScroll({x: center.x, y: center.y}, UiDirection.UP, 300);
          await driver.delayMs(waitUiReadyMs);
          let text = await driver.findComponent(ON.text('toast'));
          await driver.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue()
          await driver.touchPadTwoFingersScroll({x: center.x, y: center.y}, UiDirection.DOWN, 400);
          let text1 = await driver.findComponent(ON.text('toast'));
          await driver.delayMs(waitUiReadyMs);
          expect(text1 != null).assertTrue()
        }
      } catch (error: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScrollVer_Static error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, teTouchPadTwoFingersScrollVer_Static end`);
    })

    /**
     * @tc.number uitestDriverTest_Api22_019
     * @tc.name teTouchPadTwoFingersScrollHor_static
     * @tc.desc isComponentPresentWhenLongClick test.
     */
    it('teTouchPadTwoFingersScrollHor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, teTouchPadTwoFingersScrollHor_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let scrollBarBtn = await driver.findComponent(ON.text('scroll'));
        expect(scrollBarBtn != null).assertTrue();
        if (scrollBarBtn != null) {
          await driver.delayMs(waitUiReadyMs);
          await scrollBarBtn.click();
          await driver.delayMs(waitUiReadyMs);
        }
        let scrollBar = await driver.findComponent(ON.type('Scroll').id('horizontalScroll'));
        await driver.delayMs(waitUiReadyMs);
        expect(scrollBar != null).assertTrue();
        if (scrollBar != null) {
          let center = await scrollBar.getBoundsCenter();
          await driver.delayMs(waitUiReadyMs);
          await driver.touchPadTwoFingersScroll({x: center.x, y: center.y},
            UiDirection.LEFT, 300);
          await driver.delayMs(waitUiReadyMs);
          let scroll11 = await driver.findComponent(ON.type('Scroll').id('horizontalScroll'));
          expect(scroll11 != null).assertTrue();
          if (scroll11 != null) {
            await driver.delayMs(waitUiReadyMs);
            let btn2 = await scroll11.scrollSearch(ON.id('2'));
            await driver.delayMs(waitUiReadyMs);
            expect(btn2 == null).assertTrue();
          }
          await driver.delayMs(waitUiReadyMs);
          await driver.touchPadTwoFingersScroll({x: center.x, y: center.y},
            UiDirection.RIGHT, 400);
          await driver.delayMs(waitUiReadyMs);
          let scroll111 = await driver.findComponent(ON.type('Scroll').id('horizontalScroll'));
          await driver.delayMs(waitUiReadyMs);
          expect(scroll111 != null).assertTrue();
          if (scroll111 != null) {
            let btn21 = await scroll111.scrollSearch(ON.id('2'));
            await driver.delayMs(waitUiReadyMs);
            expect(btn21 != null).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScrollHor_static error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, teTouchPadTwoFingersScrollHor_static end`);
    })
  })
}