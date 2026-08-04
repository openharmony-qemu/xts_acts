/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import display from '@ohos.display';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import deviceinfo from '@ohos.deviceInfo';
import { Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation, Rect } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { util } from '@kit.ArkTS';

export default function InputMethodEditBoxAbility() {
  describe('InputMethodEditBoxTest', () => {
    let driver = Driver.create();
    let textArea1: Component;
    let textArea2: Component;
    let textArea3: Component;
    let textArea4: Component;
    let textArea5: Component;
    let textArea6: Component;
    let textArea7: Component;
    let textArea8: Component;
    let textArea9: Component;
    let textArea10: Component;
    let rectInfo: Rect;
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.acts.inputmethodeditbox.test -f');
        await delegator.executeShellCommand('ime -s com.acts.inputmethodeditbox.test');
        console.info('====>beforeAll inputMethod_enable success');
        await driver.delayMs(1000);
        let scroll = await driver.findComponent(ON.id('Column1'));
        console.info('====>beforeAll scrollSearch success');
        textArea1 = await scroll.scrollSearch(ON.id('TextArea1'));
        console.info(`====>TextArea1 is: ${JSON.stringify(textArea1)}`);
        textArea2 = await scroll.scrollSearch(ON.id('TextArea2'));
        console.info(`====>TextArea2 is: ${JSON.stringify(textArea2)}`);
        textArea3 = await scroll.scrollSearch(ON.id('TextArea3'));
        console.info(`====>TextArea3 is: ${JSON.stringify(textArea3)}`);
        textArea4 = await scroll.scrollSearch(ON.id('TextArea4'));
        console.info(`====>TextArea4 is: ${JSON.stringify(textArea4)}`);
        textArea5 = await scroll.scrollSearch(ON.id('TextArea5'));
        console.info(`====>TextArea5 is: ${JSON.stringify(textArea5)}`);
        textArea6 = await scroll.scrollSearch(ON.id('TextArea6'));
        console.info(`====>TextArea6 is: ${JSON.stringify(textArea6)}`);
        textArea7 = await scroll.scrollSearch(ON.id('TextArea7'));
        console.info(`====>TextArea7 is: ${JSON.stringify(textArea7)}`);
        textArea8 = await scroll.scrollSearch(ON.id('TextArea8'));
        console.info(`====>TextArea8 is: ${JSON.stringify(textArea8)}`);
        textArea9 = await scroll.scrollSearch(ON.id('TextArea9'));
        console.info(`====>TextArea9 is: ${JSON.stringify(textArea9)}`);
        textArea10 = await scroll.scrollSearch(ON.id('TextArea10'));
        console.info(`====>TextArea10 is: ${JSON.stringify(textArea10)}`);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message));
        done();
      }
    })

    afterEach(async (done: Function) => {
      try {
        await inputMethod.getController().detach();
        console.info('====>afterEach detach success');
        done();
      } catch (err) {
        console.info(`====>afterEach throw err: ${JSON.stringify(err.message)}`);
        done();
      }
    })

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0800
     * @tc.number Sub_InputMethod_extraConfig_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0800', Level.LEVEL2, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0800 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0800 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0800 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0800 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0800']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0800 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0800 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 10
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0900
     * @tc.number Sub_InputMethod_extraConfig_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_InputMethod_extraConfig_0900', Level.LEVEL0, async (done: Function) => {
      await textArea2.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0900 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0900 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0900 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0900 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0900 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0900 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0900 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0900 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0900']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0900 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0900 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 20
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0700
     * @tc.number Sub_InputMethod_extraConfig_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0700', Level.LEVEL2, async (done: Function) => {
      await textArea3.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 30
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_1000
     * @tc.number Sub_InputMethod_extraConfig_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_1000', Level.LEVEL2, async (done: Function) => {
      await textArea4.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_1000 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_1000 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_1000 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_1000 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_1000 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_1000 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_1000 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_1000 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_1000']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_1000 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_1000 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 40
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0500
     * @tc.number Sub_InputMethod_extraConfig_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_InputMethod_extraConfig_0500', Level.LEVEL0, async (done: Function) => {
      await textArea5.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 50
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0600
     * @tc.number Sub_InputMethod_extraConfig_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0600', Level.LEVEL2, async (done: Function) => {
      await textArea6.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 60
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0100
     * @tc.number Sub_InputMethod_extraConfig_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0100', Level.LEVEL2, async (done: Function) => {
      await textArea7.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 70
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0300
     * @tc.number Sub_InputMethod_extraConfig_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_extraConfig_0300', Level.LEVEL2, async (done: Function) => {
      await textArea8.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 80
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0200
     * @tc.number Sub_InputMethod_extraConfig_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0200', Level.LEVEL2, async (done: Function) => {
      await textArea9.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 90
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0400
     * @tc.number Sub_InputMethod_extraConfig_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_extraConfig_0400', Level.LEVEL2, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 100
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_sendMessagePromise_0100
     * @tc.number Sub_InputMethod_IMF_sendMessagePromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_sendMessagePromise_0100', Level.LEVEL3, async (done: Function) => {
      try{
        await inputMethod.getController().sendMessage(null, null);
        console.info("====>Sub_InputMethod_IMF_sendMessagePromise_0100  success");
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_sendMessagePromise_0100 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_sendMessagePromise_0200
     * @tc.number Sub_InputMethod_IMF_sendMessagePromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_sendMessagePromise_0200', Level.LEVEL3, async (done: Function) => {
      try{
        await inputMethod.getController().sendMessage(undefined, undefined);
        console.info("====>Sub_InputMethod_IMF_sendMessagePromise_0200  success");
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_sendMessagePromise_0200 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_sendMessagePromise_0300
     * @tc.number Sub_InputMethod_IMF_sendMessagePromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_sendMessagePromise_0300', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      };
      await inputMethod.getController().attach(true, ATTRIBUTE);
      console.info("====>Sub_InputMethod_IMF_sendMessagePromise_0300 attach  success");
      try{
        let msgParam: ArrayBuffer = new ArrayBuffer(128);
        await inputMethod.getController().sendMessage('', msgParam);
        console.info("====>Sub_InputMethod_IMF_sendMessagePromise_0300  success");
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_sendMessagePromise_0300 errCode:${err.code}, errMessage is ${err.message}`)
        await inputMethod.getController().detach();
        expect(err.code).assertEqual(12800015);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_recvMessagePromise_0100
     * @tc.number Sub_InputMethod_IMF_recvMessagePromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_recvMessagePromise_0100', Level.LEVEL3, async (done: Function) => {
      try{
        await inputMethod.getController().recvMessage(null);
        console.info("====>Sub_InputMethod_IMF_recvMessagePromise_0100  success");
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_recvMessagePromise_0100 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_recvMessagePromise_0200
     * @tc.number Sub_InputMethod_IMF_recvMessagePromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_recvMessagePromise_0200', Level.LEVEL3, async (done: Function) => {
      try{
        await inputMethod.getController().recvMessage(undefined);
        console.info("====>Sub_InputMethod_IMF_recvMessagePromise_0200  success");
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_recvMessagePromise_0200 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0100
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0100', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 101
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0200
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0200', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 102
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0300
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0300', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 103
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0100
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 104
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0200
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 105
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0300
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0300', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 106
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0400
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0400', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 107
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0500
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0500', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 108
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0600
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0600', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 109
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentCallback_0700
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentCallback_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentCallback_0700', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentCallback_0700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 110
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0400
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0400', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 111
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0500
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0500', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 112
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0600
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0600', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 113
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetUiContentPromise_0700
     * @tc.number Sub_InputMethod_IME_PanelsetUiContentPromise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetUiContentPromise_0700', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetUiContentPromise_0700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 114
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizeCallback_0100
     * @tc.number Sub_InputMethod_IME_PanelresizeCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizeCallback_0100', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizeCallback_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizeCallback_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 115
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizeCallback_0200
     * @tc.number Sub_InputMethod_IME_PanelresizeCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizeCallback_0200', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizeCallback_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizeCallback_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 116
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizeCallback_0300
     * @tc.number Sub_InputMethod_IME_PanelresizeCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizeCallback_0300', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizeCallback_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizeCallback_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 117
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizeCallback_0400
     * @tc.number Sub_InputMethod_IME_PanelresizeCallback_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizeCallback_0400', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizeCallback_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizeCallback_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizeCallback_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 118
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizePromise_0100
     * @tc.number Sub_InputMethod_IME_PanelresizePromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizePromise_0100', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizePromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizePromise_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 119
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizePromise_0200
     * @tc.number Sub_InputMethod_IME_PanelresizePromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizePromise_0200', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizePromise_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizePromise_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 120
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizePromise_0300
     * @tc.number Sub_InputMethod_IME_PanelresizePromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizePromise_0300', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizePromise_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizePromise_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 121
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelresizePromise_0400
     * @tc.number Sub_InputMethod_IME_PanelresizePromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelresizePromise_0400', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelresizePromise_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelresizePromise_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelresizePromise_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 122
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToCallback_0100
     * @tc.number Sub_InputMethod_IME_PanelmoveToCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToCallback_0100', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToCallback_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 123
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToCallback_0200
     * @tc.number Sub_InputMethod_IME_PanelmoveToCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToCallback_0200', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToCallback_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 124
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToCallback_0300
     * @tc.number Sub_InputMethod_IME_PanelmoveToCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToCallback_0300', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToCallback_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 125
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToCallback_0400
     * @tc.number Sub_InputMethod_IME_PanelmoveToCallback_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToCallback_0400', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToCallback_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToCallback_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 126
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToPromise_0100
     * @tc.number Sub_InputMethod_IME_PanelmoveToPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToPromise_0100', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToPromise_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 127
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToPromise_0200
     * @tc.number Sub_InputMethod_IME_PanelmoveToPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToPromise_0200', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToPromise_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 128
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToPromise_0300
     * @tc.number Sub_InputMethod_IME_PanelmoveToPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToPromise_0300', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToPromise_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 129
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelmoveToPromise_0400
     * @tc.number Sub_InputMethod_IME_PanelmoveToPromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelmoveToPromise_0400', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelmoveToPromise_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelmoveToPromise_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 130
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PaneladjustPanelRect_0100
     * @tc.number Sub_InputMethod_IME_PaneladjustPanelRect_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PaneladjustPanelRect_0100', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PaneladjustPanelRect_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 131
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PaneladjustPanelRect_0200
     * @tc.number Sub_InputMethod_IME_PaneladjustPanelRect_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PaneladjustPanelRect_0200', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PaneladjustPanelRect_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 132
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PaneladjustPanelRect_0300
     * @tc.number Sub_InputMethod_IME_PaneladjustPanelRect_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PaneladjustPanelRect_0300', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PaneladjustPanelRect_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 133
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelupdateRegion_0100
     * @tc.number Sub_InputMethod_IME_PanelupdateRegion_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelupdateRegion_0100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelupdateRegion_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelupdateRegion_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 134
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelupdateRegion_0200
     * @tc.number Sub_InputMethod_IME_PanelupdateRegion_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelupdateRegion_0200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelupdateRegion_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelupdateRegion_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelupdateRegion_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 135
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetImmersiveEffec_0100
     * @tc.number Sub_InputMethod_IME_PanelsetImmersiveEffec_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetImmersiveEffec_0100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetImmersiveEffec_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 136
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetImmersiveEffec_0200
     * @tc.number Sub_InputMethod_IME_PanelsetImmersiveEffec_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetImmersiveEffec_0200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetImmersiveEffec_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 137
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100
     * @tc.number Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 138
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200
     * @tc.number Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 139
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100
     * @tc.number Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 140
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200
     * @tc.number Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 141
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300
     * @tc.number Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 142
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400
     * @tc.number Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 143
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0100
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 147
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0200
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 148
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0300
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0300', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 149
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0400
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0400', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 150
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0500
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0500', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 151
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0600
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0600', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 152
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0700
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0700', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 153
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0800
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0800', Level.LEVEL3, async (done: Function) => {
      await textArea9.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0800']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0800 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 154
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_0900
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_0900', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_0900 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_0900']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_0900 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 155
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1000
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1000', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1000 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1000']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1000 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 156
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1100
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 157
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1200
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1200', Level.LEVEL3, async (done: Function) => {
      await textArea9.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 158
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1300
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1300', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 159
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1400
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1400', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 160
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1500
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1500', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 161
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1600
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1600', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 162
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1700
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1700', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 163
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1800
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1800', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1800']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1800 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 164
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_1900
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_1900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_1900', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_1900 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_1900']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_1900 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 165
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2000
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2000', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2000 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2000']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2000 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 166
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2100
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2100', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 167
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2200
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2200', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 168
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2300
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2300', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 169
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2400
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2400', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 170
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2500
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2500', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 171
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2600
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2600', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 172
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2700
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2700', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 173
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2800
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2800', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2800']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2800 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 174
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_2900
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_2900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_2900', Level.LEVEL3, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_2900 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_2900']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_2900 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 175
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_updatePanelRectSync_3000
     * @tc.number SUB_INPUTMETHOD_IME_UPDATEPANELRECTSYNC_3000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_updatePanelRectSync_3000', Level.LEVEL3, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IME_updatePanelRectSync_3000 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IME_updatePanelRectSync_3000']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IME_updatePanelRectSync_3000 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 176
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_consumeKeyEvents_0300
     * @tc.number SUB_INPUTMETHOD_IME_CONSUMEKEYEVENTS_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_consumeKeyEvents_0300', Level.LEVEL3, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        await inputMethod.getController().detach();
        await inputMethod.getController().attach(false, ATTRIBUTE);
        if (err) {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_consumeKeyEvents_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 144
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_consumeKeyEvents_0100
     * @tc.number SUB_INPUTMETHOD_IME_CONSUMEKEYEVENTS_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_consumeKeyEvents_0100', Level.LEVEL3, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0, consumeKeyEvents: true
          }
        }
        await inputMethod.getController().detach();
        await inputMethod.getController().attach(false, ATTRIBUTE);
        if (err) {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_consumeKeyEvents_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 145
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_consumeKeyEvents_0200
     * @tc.number SUB_INPUTMETHOD_IME_CONSUMEKEYEVENTS_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_consumeKeyEvents_0200', Level.LEVEL3, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0, consumeKeyEvents: false
          }
        }
        await inputMethod.getController().detach();
        await inputMethod.getController().attach(false, ATTRIBUTE);
        if (err) {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_consumeKeyEvents_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_consumeKeyEvents_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 146
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

  });
};