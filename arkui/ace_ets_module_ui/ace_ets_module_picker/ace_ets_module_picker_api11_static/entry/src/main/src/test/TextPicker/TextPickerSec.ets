/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

async function forKey(Key: string, text: string) {
  console.info("web afterEach start:" + Key);
  try {
    let backData: events_emitter.EventData = {
      data: {
        "type": Key,
        "text": text,
      } as Record<string, Object>
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  sleep(2000);
}

export default function TextPickerSec() {
  describe('TextPickerSec', () => {

    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextPicker/TextPickerSec",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerSec state pages:" + JSON.stringify(pages));
        if (!("TextPickerSec" == pages.name)) {
          console.info("get TextPickerSec pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextPickerSec page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerSec page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0100
     * @tc.name Set the canLoop property of the TextPicker component with a parameter of true
     * @tc.desc Verify that the CanLoop property parameter of the TextPicker component can scrol
     *               l through loops when it is true
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "true");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0100 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0200
     * @tc.name Set the canLoop property of the TextPicker component with a parameter of false
     * @tc.desc Verifying that the CanLoop property parameter of the TextPicker component cannot
     *               scroll through loops when it is false
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "false");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0200 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0300
     * @tc.name Set the canLoop property of the TextPicker component with a parameter of null
     * @tc.desc Failed to set the default loopable scrolling when verifying the CanLoop property
     *               parameter of the TextPicker component to null
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPickerErr", "null");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0300 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0300 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0400
     * @tc.name Set the canLoop property of the TextPicker component with a parameter of undefined
     * @tc.desc Failed to set the default loopable scrolling when verifying the CanLoop property
     *               parameter of the TextPicker component to undefined
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPickerErr", "undefined");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0400 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0500
     * @tc.name Continuously set the canLoop property of the TextPicker component, with all parameters
     *               set to normal values
     * @tc.desc When verifying that the canLoop property parameters of the TextPicker component are all normal
     *               values, whether to cycle is based on the last normal value
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "true");
      await sleep(1000)
      await forKey("TextPicker", "false");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0500 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0500 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0600
     * @tc.name Continuously set the canLoop property of the TextPicker component,
     *               with parameters first normal and then abnormal
     * @tc.desc Verify whether the CanLoop property parameter of the TextPicker component is looped based on
     *               the last normal value when it is abnormal first and then normal
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPickerErr", "null");
      await sleep(1000)
      await forKey("TextPicker", "false");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0600 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0700
     * @tc.name Continuously set the canLoop property of the TextPicker component,
     *               with parameters first normal and then abnormal
     * @tc.desc Verify whether the CanLoop property parameter of the TextPicker component returns
     *               to the default value when it is normal first and then abnormal
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "false");
      await sleep(1000)
      await forKey("TextPickerErr", "null");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0700 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0800
     * @tc.name Set the canLoop property of the TextPicker component with the parameter ''
     * @tc.desc Failed to set the default loopable scrolling when verifying the CanLoop property
     *               parameter of TextPicker component to ''
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPickerErr');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0800 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_0900
     * @tc.name Set the canLoop property of the TextPicker component with a parameter of type number 0
     * @tc.desc When verifying that the CanLoop property parameter of the TextPicker component is of type number 0
     *               setting failed to default to loopable scrolling
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "0");
      await sleep(1000)
      try {
        let strJson = inspector.getInspectorByKey('TextPickerErr');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0900 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPicker_CanLoop_static_1000
     * @tc.name Do not set the canLoop property of the TextPicker component
     * @tc.desc Verify if the TextPicker component does not set the canLoop property, and whether the looping
     *               scrolling is set to the default loopable scrolling
     */
    it('ArkUX_Stage_TextPicker_CanLoop_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('TextPickerNoCanLoop');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_1000 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_1000 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextPickerDialog_CanLoop_0100
     * @tc.name TextPickerDialog component added CanLoop interface coverage
     * @tc.desc TextPickerDialog component added CanLoop interface coverage
     */
    it('ArkUX_Stage_TextPickerDialog_CanLoop_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('TextPickerDialog');
        console.info('ArkUX_Stage_TextPickerDialog_CanLoop_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPickerDialog_CanLoop_0100 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPickerDialog_CanLoop_0100 err  :' + JSON.stringify(err))
        done()
      }
    })
  })
}