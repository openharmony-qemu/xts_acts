/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
import observer from '@ohos.telephony.observer';
import sim from '@ohos.telephony.sim';
import call from '@ohos.telephony.call';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}


export default function observerManagerCallStateTest() {
  describe('ObserverManagerCallStateTest', () => {

    /**
     * @tc.number  SUB_Telephony_Observer_CallStateChangeOff_0100
     * @tc.name    testTelephonyObserverCallStateChangeOff0100
     * @tc.desc    Unsubscribe to call status change event.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 0
     */
    it('testTelephonyObserverCallStateChangeOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        // Indicates that there is no call in progress
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          class Value {
            state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
            number: string = ""
          };
          observer.on('callStateChange', (value: Value) => {
            console.info(`${caseName} data ${JSON.stringify(value)}}`);
            ExpectTrue(value != null);
          });
          observer.off("callStateChange");
          done();
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number  SUB_Telephony_Observer_CallStateChangeOff_0200
     * @tc.name    testTelephonyObserverCallStateChangeOff0200
     * @tc.desc    Unsubscribe to call status change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 0
     */
    it('testTelephonyObserverCallStateChangeOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        // Indicates that there is no call in progress
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          class Value {
            state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
            number: string = ""
          };
          let callback: (value: Value) => void = (value: Value) => {
            console.info(`${caseName} data ${JSON.stringify(value)}}`);
            ExpectTrue(value !== null);
          }
          observer.on('callStateChange', callback);
          observer.off("callStateChange", callback);
          done();
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number  SUB_Telephony_Observer_CallStateChangeOff_0400
     * @tc.name    testTelephonyObserverCallStateChangeOff0400
     * @tc.desc    Unsubscribe to call status change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 0
     */
    it('testTelephonyObserverCallStateChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        // Indicates that there is no call in progress
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          class Value {
            state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
            number: string = ""
          };
          let callback: (value: Value) => void = (value: Value) => {
            console.info(`${caseName} data ${JSON.stringify(value)}}`);
            ExpectTrue(value !== null);
          };
          observer.on('callStateChange', callback);
          observer.off("callStateChange", callback);
          observer.off("callStateChange", callback);
          done();
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number  SUB_Telephony_Observer_CallStateChangeOn_0500
     * @tc.name    testTelephonyObserverCallStateChangeOn0500
     * @tc.desc    Unsubscribe to call status change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 0
     */
    it('testTelephonyObserverCallStateChangeOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn0500';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.CallStateInfo) => void = (data: observer.CallStateInfo) => {
          console.log("on callStateChange, data:" + JSON.stringify(data));
        }
        observer.on(null, callback);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number  SUB_Telephony_Observer_CallStateChangeOn_0600
     * @tc.name    testTelephonyObserverCallStateChangeOn0600
     * @tc.desc    Unsubscribe to call status change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 0
     */
    it('testTelephonyObserverCallStateChangeOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn0600';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.CallStateInfo) => void = (data: observer.CallStateInfo) => {
          console.log("on callStateChange, data:" + JSON.stringify(data));
        }
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.on(null, options, callback);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number  SUB_Telephony_Observer_CallStateChangeOff_0700
     * @tc.name    testTelephonyObserverCallStateChangeOff0700
     * @tc.desc    Unsubscribe to call status change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 0
     */
    it('testTelephonyObserverCallStateChangeOff0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0700';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.CallStateInfo) => void = (data: observer.CallStateInfo) => {
          console.log("on callStateChange, data:" + JSON.stringify(data));
        }
        observer.off(null, callback);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0100
    * @tc.name    testTelephonyObserverCallStateChangeExOn0100
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0100';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0200
    * @tc.name    testTelephonyObserverCallStateChangeExOn0200
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 1
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0300
    * @tc.name    testTelephonyObserverCallStateChangeExOn0300
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0300';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 2
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0400
    * @tc.name    testTelephonyObserverCallStateChangeExOn0400
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: -1
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0500
    * @tc.name    testTelephonyObserverCallStateChangeExOn0500
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0500';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: -2
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8800001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0600
    * @tc.name    testTelephonyObserverCallStateChangeExOn0600
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0600';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 3
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8800001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0700
    * @tc.name    testTelephonyObserverCallStateChangeExOn0700
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0700';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOn_0800
    * @tc.name    testTelephonyObserverCallStateChangeExOn0800
    * @tc.desc    Subscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOn0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0800';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on(null, callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOff_0100
    * @tc.name    testTelephonyObserverCallStateChangeExOff0100
    * @tc.desc    Unsubscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0100';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOff_0200
    * @tc.name    testTelephonyObserverCallStateChangeExOff0200
    * @tc.desc    Unsubscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChangeEx', callback);
        observer.off('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOff_0300
    * @tc.name    testTelephonyObserverCallStateChangeExOff0300
    * @tc.desc    Unsubscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOff0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0300';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChangeEx');
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
    * @tc.number  SUB_Telephony_Observer_CallStateChangeExOff_0400
    * @tc.name    testTelephonyObserverCallStateChangeExOff0400
    * @tc.desc    Unsubscribe to call status change event
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   level 0
    */
    it('testTelephonyObserverCallStateChangeExOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off(null, callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

  });
}