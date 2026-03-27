/**
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebViewOnMicrophoneCaptureStateChangeTest() {
  describe('ActsAceWebViewOnMicrophoneCaptureStateChange', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.internetvideoplaybacktwelvetest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testOnMicrophoneCaptureStateChangeStatic001
    * @tc.number       SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_0001
    * @tc.desc         test OnMicrophoneCaptureStateChange
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testOnMicrophoneCaptureStateChangeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnMicrophoneCaptureStateChange001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnMicrophoneCaptureStateChange001', 1, 60700, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testOnMicrophoneCaptureStateChangeStatic002
    * @tc.number       SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0002
    * @tc.desc         SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0003
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testOnMicrophoneCaptureStateChangeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnMicrophoneCaptureStateChange002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnMicrophoneCaptureStateChange002', 2, 60701, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testOnMicrophoneCaptureStateChangeStatic003
    * @tc.number       SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0003
    * @tc.desc         test OnMicrophoneCaptureStateChange
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testOnMicrophoneCaptureStateChangeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnMicrophoneCaptureStateChange003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnMicrophoneCaptureStateChange003', 0, 60702, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

  })
}