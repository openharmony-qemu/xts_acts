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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commoneventmanager from '@ohos.commonEventManager';
import subtype from '@ohos.InputMethodSubtype';
import inputMethod from '@ohos.inputMethod';
import display from '@ohos.display';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base'

export default function inputMethodEngineNew() {
  describe('inputMethodEngineNew', () => {
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
        id: "InputNewService",
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
          console.info("====>beforeAll: inputMethodEngineNew switchCurrentInputMethodSubtype success");
          done();
        }, 2000)
      } catch (err) {
        console.info("====>beforeAll: inputMethodEngineNew fail" + JSON.stringify(err));
      }
    })

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async (done: Function) => {
      done();
    })

    let dis = display.getDefaultDisplaySync();
    let driver = Driver.create();

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 1
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 2
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 3
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 4
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 5
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 6
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 7
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 8
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 9
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 10
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 11
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 12
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 13
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 14
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 15
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 16
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 17
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 18
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 19
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 20
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 21
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 22
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300
     * @tc.number Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 23
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100
     * @tc.number Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 24
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200
     * @tc.number Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 25
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300
     * @tc.number Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 26
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 27
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 28
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 29
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 30
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100
     * @tc.number Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 31
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 32
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 33
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200
     * @tc.number Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 34
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetForwardCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientgetForwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetForwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetForwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 35
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetForwardPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientgetForwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetForwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetForwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 36
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetBackwardCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientgetBackwardCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetBackwardCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetBackwardCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 37
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetBackwardPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientgetBackwardPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetBackwardPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetBackwardPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 38
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextCallback_0100
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 39
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 40
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextCallback_0300
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextCallback_0300', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextCallback_0300"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 41
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 42
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextPromise_0200
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 43
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextPromise_0300
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextPromise_0300', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextPromise_0300"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 44
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteForwardSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientdeleteForwardSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteForwardSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteForwardSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 45
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteForwardSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientdeleteForwardSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteForwardSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteForwardSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 46
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 47
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 48
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetForwardSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientgetForwardSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetForwardSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetForwardSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 49
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetForwardSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientgetForwardSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetForwardSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetForwardSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 50
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetBackwardSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientgetBackwardSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetBackwardSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetBackwardSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 51
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientgetBackwardSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientgetBackwardSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientgetBackwardSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientgetBackwardSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 52
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 53
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 54
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientinsertTextSync_0300
     * @tc.number Sub_InputMethod_IME_InputClientinsertTextSync_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientinsertTextSync_0300', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientinsertTextSync_0300"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 55
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientmoveCursorCallback_0100
     * @tc.number Sub_InputMethod_IME_InputClientmoveCursorCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientmoveCursorCallback_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientmoveCursorCallback_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 56
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientmoveCursorPromise_0200
     * @tc.number Sub_InputMethod_IME_InputClientmoveCursorPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientmoveCursorPromise_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientmoveCursorPromise_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 57
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientmoveCursorSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientmoveCursorSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientmoveCursorSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientmoveCursorSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 58
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientmoveCursorSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientmoveCursorSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientmoveCursorSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientmoveCursorSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 59
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByRangeCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientselectByRangeCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByRangeCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByRangeCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 60
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByRangePromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientselectByRangePromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByRangePromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByRangePromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 61
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByRangeSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientselectByRangeSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByRangeSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByRangeSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 62
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByRangeSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientselectByRangeSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByRangeSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByRangeSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 63
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByMovementCallback_0200
     * @tc.number Sub_InputMethod_IME_InputClientselectByMovementCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByMovementCallback_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByMovementCallback_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 64
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByMovementPromise_0100
     * @tc.number Sub_InputMethod_IME_InputClientselectByMovementPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByMovementPromise_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByMovementPromise_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 65
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByMovementSync_0100
     * @tc.number Sub_InputMethod_IME_InputClientselectByMovementSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByMovementSync_0100', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByMovementSync_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 66
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_IME_InputClientselectByMovementSync_0200
     * @tc.number Sub_InputMethod_IME_InputClientselectByMovementSync_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IME_InputClientselectByMovementSync_0200', Level.LEVEL3, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_InputClientselectByMovementSync_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 67
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineNewTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

  })
}