'use static';
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
import {beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let emitKey = 'scroll01';

let testAbilityContext:common.UIAbilityContext;

export default function webViewSrollableJsunit(){
  describe('scrollByToTest',  () =>{
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      let cmd = 'aa start -a EntryAbility -b com.pageInteractionTwo.test.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info('scroll beforeEach start');
    })

    /**
     * @tc.name   scrollByToStatic01
     * @tc.number SUB_SCTOLL_BY_TO_API_001
     * @tc.desc   test blurMode01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByToStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('scrollByTo01', 10)
      await Utils.msSleep(1000);
      let driver:Driver = Driver.create();
      await Utils.msSleep(1000);
      Utils.registerBaseEvent('scrollByTo01', 0, 20250322, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('scrollByToButton'));
      button?.click();
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebViewGetScrollOffsetStatic
     * @tc.number SUB_SCTOLL_BY_TO_API_1_001
     * @tc.desc   test GetScrollOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetScrollOffsetStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebViewGetScrollOffset', 10)
        await Utils.msSleep(1000);
        let driver:Driver = Driver.create();
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testWebViewGetScrollOffset', false, 1601319, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('scrollByToButton'));
        button?.click();
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage1', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('scrollByToButton'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(2000)
        expect(button != null).assertTrue();

        done();
      })

    /**
     * @tc.name   testSetScrollableNullStatic001
     * @tc.number SUB_WEB_SETSCROLLABLE_NULL_0100
     * @tc.desc   test setScrollable with null enable param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollableNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('testSetScrollableNullStatic001', 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent('testSetScrollableNullStatic001', true, 41022801, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('scrollByToButton', 10, '');
          await Utils.msSleep(3000);
          done()
      
        } catch (err) {
          console.info('[testSetScrollableNullStatic001] err:'+JSON.stringify(err));
          done();

          }
      })

    /**
     * @tc.name   testSetScrollableUndefinedStatic001
     * @tc.number SUB_WEB_SETSCROLLABLE_UNDEFINED_0100
     * @tc.desc   test setScrollable with undefined enable param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollableUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('testSetScrollableUndefinedStatic001', 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent('testSetScrollableUndefinedStatic001', true, 41022802, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('scrollByToButton', 10, '');
          await Utils.msSleep(3000);
          done()
      
        } catch (err) {
          console.info('[testSetScrollableUndefinedStatic001] err:'+JSON.stringify(err));
          done();

          }
      })

    /**
     * @tc.name   testSetScrollableTypeNullStatic001
     * @tc.number SUB_WEB_SETSCROLLABLE_TYPE_NULL_0100
     * @tc.desc   test setScrollable with null ScrollType param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollableTypeNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('testSetScrollableTypeNullStatic001', 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent('testSetScrollableTypeNullStatic001', true, 41022803, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('scrollByToButton', 10, '');
          await Utils.msSleep(3000);
          done()
      
        } catch (err) {
          console.info('[testSetScrollableTypeNullStatic001] err:' + JSON.stringify(err));
          done();
        }
      })

    /**
     * @tc.name   testSetScrollableTypeInvalidStatic001
     * @tc.number SUB_WEB_SETSCROLLABLE_TYPE_INVALID_0100
     * @tc.desc   test setScrollable with invalid ScrollType enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollableTypeInvalidStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('testSetScrollableTypeInvalidStatic001', 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent('testSetScrollableTypeInvalidStatic001', 401, 41022804, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('scrollByToButton', 10, '');
          await Utils.msSleep(3000);
          done()
      
        } catch (err) {
          console.info('[testSetScrollableTypeInvalidStatic001] err:' + JSON.stringify(err));
          done();
        }
      })

    /**
     * @tc.name   testSetScrollableTypeUndefinedStatic001
     * @tc.number SUB_WEB_SETSCROLLABLE_TYPE_UNDEFINED_0100
     * @tc.desc   test setScrollable with undefined ScrollType enum param spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollableTypeUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('testSetScrollableTypeUndefinedStatic001', 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent('testSetScrollableTypeUndefinedStatic001', true, 41022805, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('scrollByToButton', 10, '');
          await Utils.msSleep(3000);
          done()

        } catch (err) {
          console.info('[testSetScrollableTypeUndefinedStatic001] err:' + JSON.stringify(err));
          done();
        }
      })
  })
}