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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import commoneventmanager from '@ohos.commonEventManager';
import subtype from '@ohos.InputMethodSubtype';
import inputMethod from '@ohos.inputMethod';
import display from '@ohos.display';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

export default function inputMethodEngineHotArea() {
  describe('inputMethodEngineHotArea', () => {
    let dis = display.getDefaultDisplaySync();
    let driver = Driver.create();
    let textArea: Component;
    let text1: Component;
    let text2: Component;
    let text3: Component;
    let text4: Component;
    
    let extra: ESObject = {};
    let inputSever: ESObject = {
      packageName: '',
      methodId: '',
      name: '',
      id: '',
      extra: extra
    }
    beforeAll(async (done: Function) => {
      let inputM = inputMethod.getCurrentInputMethod();
      console.info("====>beforeAll: getCurrentInputMethod inputMethodEngineNew to: " + JSON.stringify(inputM));
      inputSever.packageName = inputM.packageName;
      inputSever.methodId = inputM.methodId;
      inputSever.name = inputM.packageName;
      inputSever.id = inputM.methodId;

      let InputKeyService: subtype = {
        id: "InputHotAreaService",
        label: "",
        name: "com.acts.inputmethodengine.test",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      }
      try {
        await inputMethod.switchCurrentInputMethodSubtype(InputKeyService);
        setTimeout(() => {
          console.info(`====>beforeAll: inputMethodEngineHotArea switchCurrentInputMethodSubtype success`);
          done();
        }, 2000)  
      } catch (err) {
        console.info(`====>beforeAll:inputMethodEngineHotArea catch, code:${err.code}, message:${err.message}`);
      }
    })


    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async (done: Function) => {
      done();
    })

    let touch = async () => {
      textArea = await driver.findComponent(ON.type('TextArea'));
      console.info(`====>beforeAll textArea is: ${JSON.stringify(textArea)}`);
      await driver.delayMs(100);
      await textArea.click();
      await driver.delayMs(1000);
      text1 = await driver.findComponent(ON.id('text1'));
      console.info(`====>beforeAll text1 is: ${JSON.stringify(text1)}`);
      await text1.click();
      await driver.delayMs(100);
      text2 = await driver.findComponent(ON.id('text2'));
      console.info(`====>beforeAll text2 is: ${JSON.stringify(text2)}`);
      await text2.click();
      await driver.delayMs(100);
      text3 = await driver.findComponent(ON.id('text3'));
      console.info(`====>beforeAll text3 is: ${JSON.stringify(text3)}`);
      await text3.click();
      await driver.delayMs(100);
      text4 = await driver.findComponent(ON.id('text4'));
      console.info(`====>beforeAll text4 is: ${JSON.stringify(text4)}`);
      await text4.click();
      await driver.delayMs(100);
    };

    /**
     * @tc.name   Sub_InputMethod_IME_HotAreaTest_0100
     * @tc.number SUB_INPUTMETHOD_IME_HOTAREATEST_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_InputMethod_IME_HotAreaTest_0100', Level.LEVEL0, async (done: Function) => {
      await touch();
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_HotAreaTest_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 1
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineHotAreaTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_HotAreaTest_0200
     * @tc.number SUB_INPUTMETHOD_IME_HOTAREATEST_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_InputMethod_IME_HotAreaTest_0200', Level.LEVEL0, async (done: Function) => {
      
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 publishCallback failed:" + JSON.stringify(err));
        }
        setTimeout(async () => {
          await touch();
        }, 500);
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_HotAreaTest_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_HotAreaTest_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 2
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineHotAreaTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });
  })
}