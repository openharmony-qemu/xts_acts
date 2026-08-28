'use static';
/*
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import { NavigationPolicy } from "@ohos.arkui.component";
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { MicrophoneCaptureState } from "@ohos.arkui.component";
import { Want, StartOptions } from '@kit.AbilityKit';
let driver = Driver.create()

let testAbilityContext:common.UIAbilityContext;

export default function webViewController() {

  describe('WebViewNavigationPolicyTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.logdottingeleventest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(3000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name       testWebViewNavigationPolicyStatic001
     * @tc.number     SUB_WEB_NAVIGATIONAL_0100
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewNavigationPolicyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000)
      Utils.emitEvent('emitWebViewNavigationPolicy001', 10)
      await Utils.msSleep(1000);
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT, 2047)
        console.info("buttonOne.mouseClick")
      }
      await Utils.msSleep(1000);
      let webComponent = await driver.findComponent(ON.id('WebViewNavigationPolicyWeb'));
      if(webComponent){
        await webComponent.click();
        await Utils.msSleep(3000);
        await webComponent.click();
        console.info("webComponent.click")
      }
      Utils.registerBaseEvent('testWebViewNavigationPolicy001', NavigationPolicy.NEW_POPUP, 20260113, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'));
      await Utils.msSleep(2000);
      if(keyButton){
        await keyButton.click();
        await Utils.msSleep(2000);
        console.info("keyButton.click")
        await keyButton.click();
      }
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name       testWebViewNavigationPolicyStatic002
     * @tc.number     SUB_WEB_NAVIGATIONAL_0200
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewNavigationPolicyStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewNavigationPolicy002',10)
      await Utils.msSleep(1000)
      let buttonOne = await driver.findComponent(ON.text('打开新标签'))
      if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT, 2047)
        console.info("buttonOne.mouseClick")
      }
      await Utils.msSleep(1000)
      let webComponent = await driver.findComponent(ON.id('WebViewNavigationPolicyWeb'))
      if(webComponent){
        await webComponent.click()
        await Utils.msSleep(3000)
        await webComponent.click()
        console.info("webComponent.click")
      }
      Utils.registerBaseEvent('testWebViewNavigationPolicy001', NavigationPolicy.NEW_WINDOW, 20260114, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
        await keyButton.click()
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name       testWebViewNavigationPolicyStatic003
     * @tc.number     SUB_WEB_NAVIGATIONAL_0300
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewNavigationPolicyStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitWebViewNavigationPolicy003',10)
        await Utils.msSleep(1000)
        let buttonOne = await driver.findComponent(ON.text('打开新窗口'))
        if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT, 2072)
        console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000)
        let webComponent = await driver.findComponent(ON.id('WebViewNavigationPolicyWeb'))
        if(webComponent){
        await webComponent.click()
        await Utils.msSleep(2000)
        await webComponent.click()
        console.info("webComponent.click")
        }
        Utils.registerBaseEvent('testWebViewNavigationPolicy003', NavigationPolicy.NEW_BACKGROUND_TAB, 20260115, done,
        (backData: events_emitter.EventData, expected: Object) => {
        const data = backData?.data as Record<string, RecordData>;
        const action = data['ACTION'];
        expect(action).assertEqual(expected);
        });
        let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
        await Utils.msSleep(2000)
        if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
        await keyButton.click()
        }
        await Utils.msSleep(6000)
        done()
    
      } catch (err) {
        console.info('[testWebViewNavigationPolicyStatic003] err:'+JSON.stringify(err));
        done();

        }
      })

    /**
     * @tc.name       testWebViewNavigationPolicyStatic004
     * @tc.number     SUB_WEB_NAVIGATIONAL_0400
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewNavigationPolicyStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitWebViewNavigationPolicy004',10)
        await Utils.msSleep(1000)
        let buttonOne = await driver.findComponent(ON.text('打开新标签'))
        if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT)
        console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000)
        let webComponent = await driver.findComponent(ON.id('WebViewNavigationPolicyWeb'))
        if(webComponent){
        await webComponent.click()
        await Utils.msSleep(2000)
        await webComponent.click()
        console.info("webComponent.click")
        }
        Utils.registerBaseEvent('testWebViewNavigationPolicy004', NavigationPolicy.NEW_FOREGROUND_TAB, 20260116, done,
        (backData: events_emitter.EventData, expected: Object) => {
        const data = backData?.data as Record<string, RecordData>;
        const action = data['ACTION'];
        expect(action).assertEqual(expected);
        });
        let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
        await Utils.msSleep(2000)
        if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
        await keyButton.click()
        }
        await Utils.msSleep(6000)
        done()
    
      } catch (err) {
        console.info('[testWebViewNavigationPolicyStatic004] err:'+JSON.stringify(err));
        done();

        }
      })

    /**
     * @tc.name   testHasImageErrorStatic001
     * @tc.number SUB_WEB_ERRORCODE_HASIMAGE_0100
     * @tc.desc   test hasImage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImageErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testHasImageError001", 10);
      Utils.registerBaseEvent("testHasImageError001", '17100001', 115380, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
      }
      await Utils.msSleep(4000)
      done()
    })

    /**
     * @tc.name   testHasImageErrorStatic002
     * @tc.number SUB_WEB_ERRORCODE_HASIMAGE_0200
     * @tc.desc   test hasImage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImageErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testHasImageError002", 10);
      Utils.registerBaseEvent("testHasImageError002", '17100001', 115390, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
      }
      await Utils.msSleep(4000)
      done()
    })

    /**
     * @tc.name   testSetAppCustomUserAgentStatic001
     * @tc.number SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_API_0100
     * @tc.desc   test setAppCustomUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAppCustomUserAgentStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetAppCustomUserAgent001', 10);
      Utils.registerBaseEvent("emitSetAppCustomUserAgent001", true, 174020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
      }
      await Utils.msSleep(8000)
      done()
    })

    /**
     * @tc.name   testSetAppCustomUserAgentStatic002
     * @tc.number SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_API_0200
     * @tc.desc   test setAppCustomUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAppCustomUserAgentStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetAppCustomUserAgent002', 10);
      Utils.registerBaseEvent("emitSetAppCustomUserAgent002", false, 174021, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
      }
      await Utils.msSleep(8000)
      done()
    })

    /**
     * @tc.name   testSetUserAgentForHostsOverRangeStatic001
     * @tc.number SUB_ACE_WEB_SETUSERAGENTFORHOSTS_OVERRANGE_0100
     * @tc.desc   test setUserAgentForHosts overRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentForHostsOverRangeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetUserAgentForHostsOverRange001', 10);
      Utils.registerBaseEvent("emitSetUserAgentForHostsOverRange001", false, 174060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
      }
      await Utils.msSleep(8000)
      done()
    })

    /**
     * @tc.name   testSetUserAgentForHostsOverRangeStatic002
     * @tc.number SUB_ACE_WEB_SETUSERAGENTFORHOSTS_OVERRANGE_0200
     * @tc.desc   test setUserAgentForHosts overRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentForHostsOverRangeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetUserAgentForHostsOverRange002', 10);
      Utils.registerBaseEvent("emitSetUserAgentForHostsOverRange002", false, 174061, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        await Utils.msSleep(2000)
        console.info("keyButton.click")
      }
      await Utils.msSleep(8000)
      done()
    })

    /**
     * @tc.name   testSetSoftKeyboardBehaviorModeErrStatic001
     * @tc.number SUB_ACE_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_API_0001
     * @tc.desc   setSoftKeyboardBehaviorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testSetSoftKeyboardBehaviorModeErrStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitSetSoftKeyboardBehaviorModeErr001", 10);
      Utils.registerBaseEvent("testSetSoftKeyboardBehaviorModeErr", 17100001, 20151222, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   testSetSoftKeyboardBehaviorModeErrStatic002
     * @tc.number SUB_ACE_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_API_0002
     * @tc.desc   setSoftKeyboardBehaviorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testSetSoftKeyboardBehaviorModeErrStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitSetSoftKeyboardBehaviorModeErr002", 10);
      Utils.registerBaseEvent("testSetSoftKeyboardBehaviorModeErr", 17100001, 20151223, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   testOnCameraCaptureStateChangeStatic003
     * @tc.number SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_API_0003
     * @tc.desc   onCameraCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testOnCameraCaptureStateChangeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnCameraCaptureStateChange003", 10)
      Utils.registerBaseEvent("testOnCameraCaptureStateChange003", 2, 20260203, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   testOnTextSelectionChangeStatic02
     * @tc.number SUB_WEB_INTERSECTIONALITIES_0200
     * @tc.desc   onTextSelectionChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testOnTextSelectionChangeStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnTextSelectionChange02", 10);
      Utils.registerBaseEvent("testOnTextSelectionChange02", 'selectionText', 202601212, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      let keyButton1 = await driver.findComponent(ON.id('WebViewNavigationPolicyWeb'))
      await Utils.msSleep(1000)
      if(keyButton1){
        await keyButton1.click()
        console.info("keyButton1.click")
      }
      await Utils.msSleep(8000)
      done()
    })

    /**
     * @tc.name   testOnMicrophoneCaptureStateChangeStatic004
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0004
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testOnMicrophoneCaptureStateChangeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange004", 10)
      Utils.registerBaseEvent("testOnMicrophoneCaptureStateChange004", MicrophoneCaptureState.NONE, 20251231, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(3000)
      done()
    })

    /**
     * @tc.name   emitEnableSelectedDataDetectorStatic001
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0005
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('emitEnableSelectedDataDetectorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitEnableSelectedDataDetector001", 10)
      Utils.registerBaseEvent("emitEnableSelectedDataDetector001", 'false', 20251232, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(3000)
      done()
    })

    /**
     * @tc.name   emitEnableDataDetectorStatic001
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0006
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('emitEnableDataDetectorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitEnableDataDetector001", 10)
      Utils.registerBaseEvent("emitEnableDataDetector001", 'false', 20251233, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(3000)
      done()
    })

    /**
     * @tc.name   emitEnableDataDetectorStatic002
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0007
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('emitEnableDataDetectorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitEnableDataDetector002", 10)
      Utils.registerBaseEvent("emitEnableDataDetector002", 'undefined', 20251234, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(2000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(3000)
      done()
    })

    /**
     * @tc.name   testWebViewMetaViewportTrueStatic
     * @tc.number SUB_ACE_WEB_getLastJavascriptProxyCallingFrameUrl_API_0300
     * @tc.desc   test interface of metaViewport with runjavascript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewMetaViewportTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitWebViewMetaViewportTrue", 10)
      Utils.registerBaseEvent("emitWebViewMetaViewportFalse", "true", 10002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   emitWebViewSetWebDestroyModeStatic001
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0001
     * @tc.desc   emitWebViewSetWebDestroyMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebViewSetWebDestroyModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitwebViewSetWebDestroyMode001', 10)
        Utils.registerBaseEvent('emitwebViewSetWebDestroyMode001', 'webview.WebDestroyMode.FAST_MODE', 138560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
        await Utils.msSleep(1000)
        if(keyButton){
          await keyButton.click()
          console.info("keyButton.click")
        }
        await Utils.msSleep(6000)
        done()
      })

    /**
     * @tc.name   emitWebViewSetWebDestroyModeStatic002
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0002
     * @tc.desc   emitWebViewSetWebDestroyMode002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebViewSetWebDestroyModeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitwebViewSetWebDestroyMode002', 10)
        Utils.registerBaseEvent('emitwebViewSetWebDestroyMode002', 'webview.WebDestroyMode.NORMAL_MODE', 138570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
        await Utils.msSleep(1000)
        if(keyButton){
          await keyButton.click()
          console.info("keyButton.click")
        }
        await Utils.msSleep(6000)
        done()
      })

    /**
     * @tc.name   emitWebViewSetWebDestroyModeNullStatic
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0003
     * @tc.desc   test setWebDestroyMode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebViewSetWebDestroyModeNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSetWebDestroyModeNull', 10)
      Utils.registerBaseEvent('emitWebViewSetWebDestroyModeNullStatic', '401', 138580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if (keyButton) {
        await keyButton.click()
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   emitWebViewSetWebDestroyModeUndefinedStatic
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0004
     * @tc.desc   test setWebDestroyMode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebViewSetWebDestroyModeUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSetWebDestroyModeUndefined', 10)
      Utils.registerBaseEvent('emitWebViewSetWebDestroyModeUndefinedStatic', '401', 138581, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if (keyButton) {
        await keyButton.click()
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   emitWebViewSetWebDestroyModeInvalidStatic
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0005
     * @tc.desc   test setWebDestroyMode invalid enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebViewSetWebDestroyModeInvalidStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSetWebDestroyModeInvalid', 10)
      Utils.registerBaseEvent('emitWebViewSetWebDestroyModeInvalidStatic', '401', 138582, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if (keyButton) {
        await keyButton.click()
      }
      await Utils.msSleep(6000)
      done()
    })

    /**
     * @tc.name   testSetScrollbarModeStatic001
     * @tc.number testSetScrollbarMode001
     * @tc.desc   testSetScrollbarMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollbarModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent('emitSetScrollbarMode001', 10)
      Utils.registerBaseEvent('emitwebViewSetWebDestroyMode002', 1, 20251208, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
      await Utils.msSleep(5000)
      done()
    });

    /**
     * @tc.name   testOnDataResubmittedStatic
     * @tc.number SUB_WEB_SETSCROLLBARMODE_0300
     * @tc.desc   SetScrollbarMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataResubmittedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent('emitOnDataResubmitted', 10)
      Utils.registerBaseEvent('emitOnDataResubmitted', 'onDataResubmitted', 20251210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
      await Utils.msSleep(1000)
      if(keyButton){
        await keyButton.click()
        console.info("keyButton.click")
      }
        let keyButton1 = await driver.findComponent(ON.id('WebViewNavigationPolicyWeb'))
        await Utils.msSleep(1000)
        if(keyButton1){
          await keyButton1.click()
          console.info("keyButton1.click")
        }
        await Utils.msSleep(8000)
      done()
    });

    /**
     * @tc.name   testStartAbilityForResultStatic001
     * @tc.number SUB_WEB_WEBNATIVEMESSAGING_STARTABILITYFORRESULT_0100
     * @tc.desc   test startAbilityForResult(want): call with non-existent ability,
     *            verify BusinessError.code = 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartAbilityForResultStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let topAbility = await abilityDelegator.getCurrentTopAbility();
        let context = topAbility.context;
        let want: Want = {
          bundleName: 'com.invalid.nonexistent.bundle',
          abilityName: 'NonExistentAbility'
        };
        try {
          let result = await context.startAbilityForResult(want);
          console.info('testStartAbilityForResultStatic001 success: ' + JSON.stringify(result));
        } catch (err) {
          console.info('testStartAbilityForResultStatic001 error: ' + err.code);
          expect(err.code).assertEqual(16000001);
        }
        await Utils.msSleep(1000);
        done();
      })

    /**
     * @tc.name   testStartAbilityForResultStatic002
     * @tc.number SUB_WEB_WEBNATIVEMESSAGING_STARTABILITYFORRESULT_0200
     * @tc.desc   test startAbilityForResult(want, options): call with non-existent ability
     *            and StartOptions, verify BusinessError.code = 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartAbilityForResultStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let topAbility = await abilityDelegator.getCurrentTopAbility();
        let context = topAbility.context;
        let want: Want = {
          bundleName: 'com.invalid.nonexistent.bundle',
          abilityName: 'NonExistentAbility'
        };
        let options: StartOptions = { displayId: 0 };
        try {
          let result = await context.startAbilityForResult(want, options);
          console.info('testStartAbilityForResultStatic002 success: ' + JSON.stringify(result));
        } catch (err) {
          console.info('testStartAbilityForResultStatic002 error: ' + err.code);
          expect(err.code).assertEqual(16000001);
        }
        await Utils.msSleep(1000);
        done();
      })

    /**
     * @tc.name   testStartAbilityForResultStatic003
     * @tc.number SUB_WEB_WEBNATIVEMESSAGING_STARTABILITYFORRESULT_0300
     * @tc.desc   test startAbilityForResult with another non-existent ability:
     *            verify BusinessError.code = 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartAbilityForResultStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let topAbility = await abilityDelegator.getCurrentTopAbility();
        let context = topAbility.context;
        let want: Want = {
          bundleName: 'com.nonexistent.app.test',
          abilityName: 'NonExistentAbility'
        };
        try {
          let result = await context.startAbilityForResult(want);
          console.info('testStartAbilityForResultStatic003 success: ' + JSON.stringify(result));
        } catch (err) {
          console.info('testStartAbilityForResultStatic003 error: ' + err.code);
          expect(err.code).assertEqual(16000001);
        }
        await Utils.msSleep(1000);
        done();
      })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      testWebViewWindowFeatures010
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        let keyButton = await driver.findComponent(ON.id('WebViewNavigationPolicyButton'))
        await Utils.msSleep(1000)
        if(keyButton){
          await keyButton.click()
          console.info("keyButton.click")
        }
        await Utils.msSleep(5000)
        done()
      })
  })
}
