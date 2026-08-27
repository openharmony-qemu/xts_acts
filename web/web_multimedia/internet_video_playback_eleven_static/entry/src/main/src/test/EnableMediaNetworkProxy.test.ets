'use static'
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function enableMediaNetworkProxyTestJsunit(): void {
  describe('enableMediaNetworkProxyTest', () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context;
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          console.log('-----' + err.code);
        }
        console.log('BusinessError  end');
      });
      await Utils.msSleep(500);
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.internetvideoplaybackeleventest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(2000);
      console.log('beforeAll end,%s', 'Succeed!');
    });

    beforeEach(async (): Promise<void> => {
      console.info('enableMediaNetworkProxy beforeEach start');
    });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TRUE_0100
     * @tc.name   SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TRUE_0100
     * @tc.desc   enableMediaNetworkProxy(true) applies without error (HLS).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TRUE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        await Utils.emitEvent('enableMediaNetworkProxyTrue', 132860);
        let waitReply = Utils.waitRegisterEvent('enableMediaNetworkProxyTrue', 'true', 132870);
        await Utils.msSleep(300);
        inspector.sendEventByKey('EnableMediaNetworkProxy_Button', 10, '');
        await waitReply;
      });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_FALSE_0100
     * @tc.name   SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_FALSE_0100
     * @tc.desc   enableMediaNetworkProxy(false) applies without error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_FALSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        await Utils.emitEvent('enableMediaNetworkProxyFalse', 132860);
        let waitReply = Utils.waitRegisterEvent('enableMediaNetworkProxyFalse', 'false', 132870);
        await Utils.msSleep(300);
        inspector.sendEventByKey('EnableMediaNetworkProxy_Button', 10, '');
        await waitReply;
      });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TOGGLE_0100
     * @tc.name   SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TOGGLE_0100
     * @tc.desc   Toggle proxy true then false ends with false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TOGGLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        await Utils.emitEvent('enableMediaNetworkProxyToggle', 132860);
        let waitReply = Utils.waitRegisterEvent('enableMediaNetworkProxyToggle', 'false', 132870);
        await Utils.msSleep(300);
        inspector.sendEventByKey('EnableMediaNetworkProxy_Button', 10, '');
        await waitReply;
      });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_NULL_0100
     * @tc.name   SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_NULL_0100
     * @tc.desc   enableMediaNetworkProxy(null) applies without throwing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        await Utils.emitEvent('enableMediaNetworkProxyNull', 132860);
        let waitReply = Utils.waitRegisterEvent('enableMediaNetworkProxyNull', 'null', 132870);
        await Utils.msSleep(300);
        inspector.sendEventByKey('EnableMediaNetworkProxy_Button', 10, '');
        await waitReply;
      });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_UNDEFINED_0100
     * @tc.name   SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_UNDEFINED_0100
     * @tc.desc   enableMediaNetworkProxy(undefined) applies without throwing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        await Utils.emitEvent('enableMediaNetworkProxyUndefined', 132860);
        let waitReply = Utils.waitRegisterEvent('enableMediaNetworkProxyUndefined', 'undefined', 132870);
        await Utils.msSleep(300);
        inspector.sendEventByKey('EnableMediaNetworkProxy_Button', 10, '');
        await waitReply;
      });
	  
	  
		/**
		 * @tc.name   testOnSwitchNextPageChangeParamTest
		 * @tc.number SUB_WEB_NEXT_PAGE_0200
		 * @tc.desc   PAGE_REDIRECT.
		 * @tc.size   MEDIUMTEST
		 * @tc.type   FUNCTION
		 * @tc.level  LEVEL0
		 */
		it('testOnSwitchNextPageChangeParamTest',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
		  await Utils.msSleep(2000);
		  Utils.emitEvent('emitOnSwitchNextPageChangeParamTest', 10)
		  await Utils.msSleep(2000);
		  inspector.sendEventByKey('EnableMediaNetworkProxy_Button', 10, '');
		  await Utils.msSleep(2000);
		  done();
		})
	
  });
}
