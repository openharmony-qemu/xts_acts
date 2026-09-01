'use static';
/*
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';

let emitKey = ''
let testAbilityContext: common.UIAbilityContext;

export default function ActsAceWebViewIncognitoMode(): void {

  describe('ActsAceWebViewIncognitoMode', (): void => {
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
      }, (err : BusinessError|null) : void => {
        if (err != null ) {

          console.log('-----' + err.code)
        }

        console.log('BusinessError  end')
      })
      await Utils.msSleep(2000)
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.actsaceincognitomodecontrollerfivetest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
        .then(result => {
          console.info('Command executed successfully:', result);
        })
        .catch(err => {
          console.error('Error executing command:', err);
        });
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebViewIncognitoModeStatic13
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0013
     * @tc.desc   test getStoredGeolocation(promise) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewIncognitoModeStatic13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebViewIncognitoMode13', 10)
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode13', 'success', 8031, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic14
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0014
     * @tc.desc   test getStoredGeolocation(callback) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebViewIncognitoMode14', 10)
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode14', 'success', 8032, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic15
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0015
     * @tc.desc   test getStoredGeolocation(promise) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode15'
        await Utils.msSleep(9000);
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode15', 'success', 8033, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic16
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0016
     * @tc.desc   test getStoredGeolocation(callback) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode16'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode16', 'success', 8034, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic17
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0017
     * @tc.desc   test deleteGeolocation incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode17'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode17', 'success', 8035, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic18
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0018
     * @tc.desc   test deleteGeolocation normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode18'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode18', 'success', 8036, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic19
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0019
     * @tc.desc   test deleteAllGeolocation incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode19'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(18000);
        Utils.registerEvent('testWebViewIncognitoMode19', 'success', 8037, done);
        await Utils.msSleep(18000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic20
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0020
     * @tc.desc   test deleteAllGeolocation normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode20'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(18000);
        Utils.registerEvent('testWebViewIncognitoMode20', 'success', 8038, done);
        await Utils.msSleep(18000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic21
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0021
     * @tc.desc   test allowGeolocation with null origin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode21';
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(18000);
        Utils.registerEvent('testWebViewIncognitoModeStatic21', 17100011, 20260257, done);
        await Utils.msSleep(18000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      });
    /**
     * @tc.name   testWebViewIncognitoModeStatic22
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0022
     * @tc.desc   test allowGeolocation with incognito=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode22';
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent('testWebViewIncognitoModeStatic22', 'success', 20260259, done);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      });
    /**
     * @tc.name   testWebViewIncognitoModeStatic23
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0023
     * @tc.desc   test deleteGeolocation with null origin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode23';
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testGetAccessibleGeolocationCallbackValueErr", 17100011, 110520, done);
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebViewIncognitoModeStatic23", "ClearOrigin is wrong", 110530, done);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      });
    /**
     * @tc.name testWebViewIncognitoMode01
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0001
     * @tc.desc test isIncognitoMode true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoMode_static_01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(6000)
      emitKey = 'emitWebViewIncognitoMode01'
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent('testWebViewIncognitoMode01', 'success', 8019, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webViewIncognitoModeButton', 10, '');
      await Utils.msSleep(6000)
      done()
    })
    /**
     * @tc.name testWebViewIncognitoMode02
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0002
     * @tc.desc test isIncognitoMode false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoMode02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(6000)
      emitKey = 'emitWebViewIncognitoMode02'
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent('testWebViewIncognitoMode02', 'success', 8020, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webViewIncognitoModeButton', 10, '');
      await Utils.msSleep(6000)
      done()
    })
    /**
     * @tc.name testWebViewIncognitoMode03
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0003
     * @tc.desc test isIncognitoMode error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoMode03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(6000)
      emitKey = 'emitWebViewIncognitoMode03'
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent('emitWebViewIncognitoMode03', 17100001, 8021, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webViewIncognitoModeButton', 10, '');
      await Utils.msSleep(6000)
       done()
     })
    /**
     * @tc.name   testWebViewIncognitoModeStatic24
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0024
     * @tc.desc   test getStoredGeolocation promise with incognito null, expect 401 error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode24'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic24', 401, 8039, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic25
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0025
     * @tc.desc   test getStoredGeolocation promise with incognito undefined, expect non-empty result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode25'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic25', 'fail', 8040, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic26
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0026
     * @tc.desc   test getStoredGeolocation promise return empty array after deleteAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode26'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic26', 'success', 8041, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic27
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0027
     * @tc.desc   test getStoredGeolocation promise return non-empty array after allowGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode27'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic27', 'success', 8042, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic28
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0028
     * @tc.desc   test getStoredGeolocation callback with incognito null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode28'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic28', 401, 8043, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic29
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0029
     * @tc.desc   test getStoredGeolocation callback with incognito undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode29'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic29', 'success', 8044, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic30
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0030
     * @tc.desc   test getStoredGeolocation callback return empty after deleteAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode30'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic30', 'success', 8045, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic31
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0031
     * @tc.desc   test getStoredGeolocation callback return non-empty after allowGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode31'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoModeStatic31', 'success', 8046, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testDeleteAllGeolocationNull
     * @tc.number SUB_WEB_DELETEALLGEOLOCATION_NULL_0100
     * @tc.desc   test deleteAllGeolocation with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteAllGeolocationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testDeleteAllGeolocationNull', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testDeleteAllGeolocationNull', 'fail', 8047, done);
        await Utils.msSleep(3000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testDeleteAllGeolocationUndefined
     * @tc.number SUB_WEB_DELETEALLGEOLOCATION_UNDEFINED_0100
     * @tc.desc   test deleteAllGeolocation with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteAllGeolocationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testDeleteAllGeolocationUndefined', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testDeleteAllGeolocationUndefined', 'success', 8048, done);
        await Utils.msSleep(3000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
   })
}