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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
let testAbilityContext: common.UIAbilityContext;

const driver = Driver.create();
export default function webViewEventResultConstructor():void {
  describe('webViewEventResultConstructor', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   testEventResultConstructorStatic01
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0100
     * @tc.desc   EventResult constructor interface call test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitEventResultConstructor01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEventResultConstructor01', true, 100140, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
        await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic01' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic02
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0200
     * @tc.desc   EventResult constructor return value test - setGestureEventResult true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitEventResultConstructor02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEventResultConstructor02', true, 100150, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
        await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic02' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic03
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0300
     * @tc.desc   EventResult constructor return value test - setGestureEventResult false with stopPropagation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor03', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor03', true, 100160, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic03' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic04
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0400
     * @tc.desc   EventResult constructor return value test - setMouseEventResult true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor04', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor04', true, 100170, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic04' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic05
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0500
     * @tc.desc   EventResult constructor return value test - setMouseEventResult false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor05', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor05', true, 100180, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic05' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic06
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0600
     * @tc.desc   EventResult constructor return value test - setGestureEventResult false single param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor06', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor06', true, 100190, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic06' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic07
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0700
     * @tc.desc   EventResult constructor return value test - setGestureEventResult true, true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor07', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor07', true, 100200, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic07' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic08
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0800
     * @tc.desc   EventResult constructor return value test - setGestureEventResult true, false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitEventResultConstructor08', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEventResultConstructor08', true, 100210, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
        await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic08' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic09
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_0900
     * @tc.desc   EventResult constructor return value test - setGestureEventResult false, false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor09', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor09', true, 100220, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic09' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic10
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_1000
     * @tc.desc   EventResult constructor return value test - setMouseEventResult true single param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor10', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor10', true, 100230, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic10' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic11
     * @tc.number  SUB_ACE_WEB_EVENT_RESULT_1100
     * @tc.desc   EventResult constructor return value test - setMouseEventResult false single param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor11', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor11', true, 100240, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic11' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic12
     * @tc.number  SUB_ACE_WEB_EVENT_RESULT_1200
     * @tc.desc   EventResult constructor return value test - setMouseEventResult true, false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor12', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor12', true, 100250, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic12' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic13
     * @tc.number  SUB_ACE_WEB_EVENT_RESULT_1300
     * @tc.desc   EventResult constructor return value test - setMouseEventResult false, true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor13', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor13', true, 100260, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic13' + err);
      }
      done();
    })

    /**
     * @tc.name   testEventResultConstructorStatic14
     * @tc.number  SUB_ACE_WEB_EVENT_RESULT_1400
     * @tc.desc   EventResult constructor return value test - multiple instances independence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventResultConstructorStatic14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      Utils.emitEvent('emitEventResultConstructor14', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitEventResultConstructor14', true, 100270, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
      await Utils.msSleep(4000);
      } catch(err) {
        console.log('testEventResultConstructorStatic14' + err);
      }
      done();
    })

    /**
     * @tc.name   testOnSwitchNextPage03
     * @tc.number  SUB_ACE_WEB_EVENT_RESULT_1500
     * @tc.desc   test testOnSwitchNextPage03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSwitchNextPage03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnSwitchNextPage03', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewEventResultConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testOnSwitchNextPage03' + err);
        }
        done()
      })
  })
}