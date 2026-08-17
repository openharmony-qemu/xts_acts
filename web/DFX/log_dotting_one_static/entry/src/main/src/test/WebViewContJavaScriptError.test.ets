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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import { Driver } from '@ohos.UiTest'
import Utils from './Util.test';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;

let emitKey:string = '';

export default function webViewContJavaScriptError():void {
  describe('webViewContJavaScriptError', (): void => {
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
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.logdottingonetest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(500);
      console.info(' beforeEach start');
    })

    /**
     * @tc.name   testRunJavaScriptCallbackInitErrStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0100
     * @tc.desc   test interface of runJavaScript (callback) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunJavaScriptCallbackInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptCallbackInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptCallbackInitErr', 17100001, 652, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);

      } catch(err) {
        console.log('testRunJavaScriptCallbackInitErrStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptEmptyStringStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0200
     * @tc.desc   test runJavaScript with empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunJavaScriptEmptyStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptEmptyString';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptEmptyStringStatic', 17100001, 653, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);

      } catch(err) {
        console.log('testRunJavaScriptEmptyStringStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptPromiseInitErrStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0300
     * @tc.desc   interface of runJavaScript (promise) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRunJavaScriptPromiseInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptPromiseInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptPromiseInitErr', 17100001, 654, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);

      } catch(err) {
        console.log('testRunJavaScriptPromiseInitErrStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptPromiseEmptyStringStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0400
     * @tc.desc   test runJavaScript (promise) with empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRunJavaScriptPromiseEmptyStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptPromiseEmptyString';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptPromiseEmptyStringStatic', 17100001, 655, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);
      } catch(err) {
        console.log('testRunJavaScriptPromiseEmptyStringStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtCallbackInitErrStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0500
     * @tc.desc   test interface of runJavaScriptExt (callback) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRunJavaScriptExtCallbackInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptExtCallbackInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptExtCallbackInitErr', 17100001, 656, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);

      } catch(err) {
        console.log('testRunJavaScriptExtCallbackInitErrStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtCallbackEmptyStringStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0600
     * @tc.desc   test runJavaScriptExt (callback) with empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRunJavaScriptExtCallbackEmptyStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptExtCallbackEmptyString';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptExtCallbackEmptyStringStatic', 17100001, 657, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);

      } catch(err) {
        console.log('testRunJavaScriptExtCallbackEmptyStringStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseInitErrStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0700
     * @tc.desc   test interface of runJavaScriptExt (promise) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRunJavaScriptExtPromiseInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptExtPromiseInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptExtPromiseInitErr', 17100001, 658, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);

      } catch(err) {
        console.log('testRunJavaScriptExtPromiseInitErrStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseEmptyStringStatic
     * @tc.number SUB_WEB_RUN_JAVASCRIPT_0800
     * @tc.desc   test runJavaScriptExt (promise) with empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRunJavaScriptExtPromiseEmptyStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      emitKey = 'emitRunJavaScriptExtPromiseEmptyString';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptExtPromiseEmptyStringStatic', 17100001, 659, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);
      } catch(err) {
        console.log('testRunJavaScriptExtPromiseEmptyStringStatic' + err);
      }
      done();
    })

    /**
     * @tc.name        testOnSwitchNextPage01
     * @tc.number      SUB_WEB_RUN_JAVASCRIPT_0900
     * @tc.desc        contCreatePdfAndOthersError
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testOnSwitchNextPage01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
        Utils.emitEvent("emitonSwitchNextPage01", 10)
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
        await Utils.msSleep(2000);
        } catch(err) {
          console.log('testOnSwitchNextPage01' + err);
        }
        done();
      })
  })
}
