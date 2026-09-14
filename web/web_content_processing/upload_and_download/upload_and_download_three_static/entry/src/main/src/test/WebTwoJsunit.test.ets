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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''

export default function webTwoJsunit() {
  describe('webTwoJsunit', (): void => {
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
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.uploadanddownloadthreetest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(4000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
    })

    /**
     * @tc.name   emitRefreshNullStatic001
     * @tc.number SUB_ACE_WEB_REFRESH_NULL_0100
     * @tc.desc   test refresh with null ignoreCache param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRefreshNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRefreshNullStatic001', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('emitRefreshNullStatic001', true, 41021801, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponenttwo', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitRefreshUndefinedStatic001
     * @tc.number SUB_ACE_WEB_REFRESH_UNDEFINED_0100
     * @tc.desc   test refresh with undefined ignoreCache param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRefreshUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRefreshUndefinedStatic001', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('emitRefreshUndefinedStatic001', true, 41021802, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponenttwo', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   onDownloadFailed
     * @tc.number SUB_ACE_WEB_API_0100
     * @tc.desc   ets allow the Web access overview mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDownloadFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonDownloadFailed', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('onDownloadFailed', true, 6, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponenttwo', 10, '');
        await Utils.msSleep(2000);
		done()
    })

    /**
     * @tc.name   emitRefreshTrueStatic001
     * @tc.number SUB_ACE_WEB_REFRESH_0100
     * @tc.desc   refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRefreshTrueStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRefreshTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('emitRefreshTrue', true, 7, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponenttwo', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitRefreshFalseStatic002
     * @tc.number SUB_ACE_WEB_REFRESH_0200
     * @tc.desc   refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRefreshFalseStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRefreshFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('emitRefreshFalse', true, 8, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponenttwo', 10, '');
        await Utils.msSleep(2000);
        done()
      })
  })
}
