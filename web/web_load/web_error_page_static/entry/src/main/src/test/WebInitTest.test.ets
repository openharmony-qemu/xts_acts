'use static';
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let testAbilityContext: common.UIAbilityContext;

export default function webInitTest(): void {
  describe('webInitTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
        },
      }, (err: BusinessError | null, data: undefined): void => {
        if (err != null) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.actsweberrorpagetest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testSetErrorPageEnabledAndGetErrorPageEnabledStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0001
    * @tc.desc         test setErrorPageEnabled true getErrorPageEnabled true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledAndGetErrorPageEnabledStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledAndGetErrorPageEnabled01', true, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledAndGetErrorPageEnabledStatic02
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0002
    * @tc.desc         test setErrorPageEnabled false getErrorPageEnabled false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledAndGetErrorPageEnabledStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled02', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledAndGetErrorPageEnabled02', false, 60601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })


    /**
    * @tc.name         testSetErrorPageEnabledErrorCodeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0003
    * @tc.desc         test setErrorPageEnabled init error
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledErrorCode01', 17100001, 60604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testGetErrorPageEnabledErrorCodeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0004
    * @tc.desc         test setErrorPageEnabled init error
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testGetErrorPageEnabledErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetErrorPageEnabledErrorCode01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testGetErrorPageEnabledErrorCode01', 17100001, 60605, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testPrivateNetworkAccessStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0005
    * @tc.desc         test enablePrivateNetworkAccess true isPrivateNetworkAccessEnabled true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testPrivateNetworkAccessStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrivateNetworkAccess01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testPrivateNetworkAccess01', true, 60606, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testPrivateNetworkAccessStatic02
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0006
    * @tc.desc         test enablePrivateNetworkAccess false isPrivateNetworkAccessEnabled false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testPrivateNetworkAccessStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrivateNetworkAccess02', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testPrivateNetworkAccess02', false, 60607, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAutoPreconnectFalseStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0007
    * @tc.desc         test setAutoPreconnect  false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetAutoPreconnectFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAutoPreconnectFalse', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetAutoPreconnectFalse', false, 60608, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAutoPreconnectTrueStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0008
    * @tc.desc         test setAutoPreconnect  true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetAutoPreconnectTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAutoPreconnectTrue', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetAutoPreconnectTrue', true, 60609, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         emitWebSiteIsolationModeStatic001
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0009
    * @tc.desc         emitWebSiteIsolationMode001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('emitWebSiteIsolationModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationMode001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitWebSiteIsolationMode001', true, 60610, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         emitWebSiteIsolationModeStatic002
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0010
    * @tc.desc         emitWebSiteIsolationMode002
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('emitWebSiteIsolationModeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationMode002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitWebSiteIsolationMode002', 17100001, 60611, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

   /**
    * @tc.name         testEnableAdsBlockErrorStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0011
    * @tc.desc         test enableAdsBlock error
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testEnableAdsBlockErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitEnableAdsBlockErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testEnableAdsBlockErrorStatic', 17100001, 60612, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testIsAdsBlockEnabledCheckStatic001
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0012
    * @tc.desc         test isAdsBlockEnabledCheck
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testIsAdsBlockEnabledCheckStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitIsAdsBlockEnabledCheck001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testIsAdsBlockEnabledCheckStatic001', true, 60613, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testIsAdsBlockEnabledCheckStatic002
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0013
    * @tc.desc         test isAdsBlockEnabledCheck
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testIsAdsBlockEnabledCheckStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitIsAdsBlockEnabledCheck002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testIsAdsBlockEnabledCheckStatic002', false, 60614, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testIsAdsBlockEnabledForCurPageStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0014
    * @tc.desc         test isAdsBlockEnabledForCurPage
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testIsAdsBlockEnabledForCurPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitIsAdsBlockEnabledForCurPage', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testIsAdsBlockEnabledForCurPageStatic', false, 60616, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0015
    * @tc.desc         test setErrorPageEnabled(true, true) getErrorPageEnabled true getSubframeErrorPageEnabled true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe01', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeStatic01', 'true,true', 60620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeStatic02
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0016
    * @tc.desc         test setErrorPageEnabled(true, false) getErrorPageEnabled true getSubframeErrorPageEnabled false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe02', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeStatic02', 'true,false', 60621, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeStatic03
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0017
    * @tc.desc         test setErrorPageEnabled(false, true); when enable is false, subframe error page stays disabled
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe03', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeStatic03', 'false,false', 60622, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeStatic04
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0018
    * @tc.desc         test setErrorPageEnabled(false, false) getErrorPageEnabled false getSubframeErrorPageEnabled false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe04', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeStatic04', 'false,false', 60623, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeErrorCodeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0019
    * @tc.desc         test setErrorPageEnabled(enable, includeSubframe) init error 17100001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframeErrorCode01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledWithSubframeErrorCodeStatic01', 17100001, 60624, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testGetSubframeErrorPageEnabledErrorCodeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0020
    * @tc.desc         test getSubframeErrorPageEnabled init error 17100001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testGetSubframeErrorPageEnabledErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetSubframeErrorPageEnabledErrorCode01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testGetSubframeErrorPageEnabledErrorCodeStatic01', 17100001, 60625, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testEnableAdsBlockNullStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0021
    * @tc.desc         test enableAdsBlock null
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testEnableAdsBlockNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitEnableAdsBlockNull', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testEnableAdsBlockNullStatic', '401', 60626, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testEnableAdsBlockNullStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testEnableAdsBlockUndefinedStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0022
    * @tc.desc         test enableAdsBlock undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testEnableAdsBlockUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitEnableAdsBlockUndefined', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testEnableAdsBlockUndefinedStatic', '401', 60627, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testEnableAdsBlockUndefinedStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledNullStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0023
    * @tc.desc         test setErrorPageEnabled null
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledNull', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledNullStatic', '401', 60628, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetErrorPageEnabledNullStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledUndefinedStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0024
    * @tc.desc         test setErrorPageEnabled undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledUndefined', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledUndefinedStatic', '401', 60629, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetErrorPageEnabledUndefinedStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeNullEnableStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0025
    * @tc.desc         test setErrorPageEnabled(null, true)
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeNullEnableStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframeNullEnable', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeNullEnableStatic', '401', 60630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetErrorPageEnabledWithSubframeNullEnableStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeUndefinedEnableStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0026
    * @tc.desc         test setErrorPageEnabled(undefined, true)
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeUndefinedEnableStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframeUndefinedEnable', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeUndefinedEnableStatic', '401', 60631, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetErrorPageEnabledWithSubframeUndefinedEnableStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeNullSubframeStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0027
    * @tc.desc         test setErrorPageEnabled(true, null)
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeNullSubframeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframeNullSubframe', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeNullSubframeStatic', 'true,false', 60632, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetErrorPageEnabledWithSubframeNullSubframeStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledWithSubframeUndefinedSubframeStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0028
    * @tc.desc         test setErrorPageEnabled(true, undefined)
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledWithSubframeUndefinedSubframeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframeUndefinedSubframe', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeUndefinedSubframeStatic', 'true,false', 60633, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetErrorPageEnabledWithSubframeUndefinedSubframeStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testGetSubframeErrorPageEnabledStandaloneStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0029
    * @tc.desc         test getSubframeErrorPageEnabled standalone
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testGetSubframeErrorPageEnabledStandaloneStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetSubframeErrorPageEnabledStandalone', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testGetSubframeErrorPageEnabledStandaloneStatic', true, 60634, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testGetSubframeErrorPageEnabledStandaloneStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testGetSubframeErrorPageEnabledReturnFalseStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0037
    * @tc.desc         test getSubframeErrorPageEnabled return false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testGetSubframeErrorPageEnabledReturnFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetSubframeErrorPageEnabledReturnFalse', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testGetSubframeErrorPageEnabledReturnFalseStatic', false, 60642, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testGetSubframeErrorPageEnabledReturnFalseStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testPrivateNetworkAccessNullStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0030
    * @tc.desc         test enablePrivateNetworkAccess null
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testPrivateNetworkAccessNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrivateNetworkAccessNull', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testPrivateNetworkAccessNullStatic', '401', 60635, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testPrivateNetworkAccessNullStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testPrivateNetworkAccessUndefinedStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0031
    * @tc.desc         test enablePrivateNetworkAccess undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testPrivateNetworkAccessUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrivateNetworkAccessUndefined', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testPrivateNetworkAccessUndefinedStatic', '401', 60636, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testPrivateNetworkAccessUndefinedStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAutoPreconnectNullStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0032
    * @tc.desc         test setAutoPreconnect null
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetAutoPreconnectNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAutoPreconnectNull', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetAutoPreconnectNullStatic', '401', 60637, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetAutoPreconnectNullStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAutoPreconnectUndefinedStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0033
    * @tc.desc         test setAutoPreconnect undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetAutoPreconnectUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAutoPreconnectUndefined', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testSetAutoPreconnectUndefinedStatic', '401', 60638, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testSetAutoPreconnectUndefinedStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebSiteIsolationModeNullStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0034
    * @tc.desc         test setSiteIsolationMode null
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebSiteIsolationModeNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationModeNull', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testWebSiteIsolationModeNullStatic', '401', 60639, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testWebSiteIsolationModeNullStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebSiteIsolationModeUndefinedStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0035
    * @tc.desc         test setSiteIsolationMode undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebSiteIsolationModeUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationModeUndefined', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testWebSiteIsolationModeUndefinedStatic', '401', 60640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testWebSiteIsolationModeUndefinedStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebSiteIsolationModeInvalidStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0036
    * @tc.desc         test setSiteIsolationMode invalid enum
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebSiteIsolationModeInvalidStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationModeInvalid', 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testWebSiteIsolationModeInvalidStatic', '401', 60641, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          expect(data['ACTION']).assertEqual(expected);
        });
      } catch (err) {
        console.info('[testWebSiteIsolationModeInvalidStatic] err:' + JSON.stringify(err));
        done();
      }
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
