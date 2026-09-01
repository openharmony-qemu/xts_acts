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
import {beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitWebViewCookieTrack"

export default function ActsAcewebViewCookieTrack() {
  describe('ActsAcewebViewCookieTrack', () :void=> {

    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        let cmd = 'aa start -a EntryAbility -b com.open.harmony.antitrackingtwotest.static';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        abilityDelegator.executeShellCommand(cmd)
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");

    })

    /**
     * @tc.name   testEnableIntelligentTrackingPreventionNullStatic001
     * @tc.number SUB_ACE_WEB_ENABLEITP_NULL_0100
     * @tc.desc   test enableIntelligentTrackingPrevention with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableIntelligentTrackingPreventionNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitEnableIntelligentTrackingPreventionNullStatic001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testEnableIntelligentTrackingPreventionNullStatic001", '401', 41023001, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testEnableIntelligentTrackingPreventionUndefinedStatic001
     * @tc.number SUB_ACE_WEB_ENABLEITP_UNDEFINED_0100
     * @tc.desc   test enableIntelligentTrackingPrevention with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableIntelligentTrackingPreventionUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitEnableIntelligentTrackingPreventionUndefinedStatic001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testEnableIntelligentTrackingPreventionUndefinedStatic001", '401', 41023002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_enableIntelligentTrackingPrevention_API_0001
     * @tc.name       : testWebViewCookieTrackEnableTrueStatic
     * @tc.desc       : test enableIntelligentTrackingPrevention true
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testWebViewCookieTrackEnableTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let emitKey = "emitWebViewCookieTrackEnableTrue";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testWebViewCookieTrackEnableTrue", true, 7701, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /**
     * @tc.name        testAddIntelligentTrackingPreventionBypassingListError001
     * @tc.number      SUB_WEB_ERRORCODE_ADDINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_0100
     * @tc.desc        test addIntelligentTrackingPreventionBypassingList error code 801
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testAddIntelligentTrackingPreventionBypassingListError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAddIntelligentTrackingPreventionBypassingListError001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testAddIntelligentTrackingPreventionBypassingListError001", true, 202503301, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /**
     * @tc.name        testRemoveIntelligentTrackingPreventionBypassingListError001
     * @tc.number      SUB_WEB_ERRORCODE_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_0100
     * @tc.desc        test removeIntelligentTrackingPreventionBypassingList error code 801
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testRemoveIntelligentTrackingPreventionBypassingListError001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testRemoveIntelligentTrackingPreventionBypassingListError001", true, 202503302, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /**
     * @tc.name        testClearIntelligentTrackingPreventionBypassingListError001
     * @tc.number      SUB_WEB_ERRORCODE_CLEARINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_0100
     * @tc.desc        test clearIntelligentTrackingPreventionBypassingList error code 801
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testClearIntelligentTrackingPreventionBypassingListError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testClearIntelligentTrackingPreventionBypassingListError001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testClearIntelligentTrackingPreventionBypassingListError001", true, 202503303, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /*
     * @tc.number     : SUB_ACE_WEB_enableIntelligentTrackingPrevention_API_0002
     * @tc.name       : testWebViewCookieTrackEnableFalseStatic
     * @tc.desc       : test enableIntelligentTrackingPrevention false
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testWebViewCookieTrackEnableFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      let emitKey = "emitWebViewCookieTrackEnableFalse";
      await Utils.msSleep(2000);
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testWebViewCookieTrackEnableFalse", true, 1278, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_clearIntelligentTrackingPreventionByPassingList_API_0005
    * @tc.name       : testCookieTrackClearTrackingPreventionStatic
    * @tc.desc       : test clearIntelligentTrackingPreventionByPassingList
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testCookieTrackClearTrackingPreventionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      let emitKey = "emitCookieTrackClearTrackingPrevention";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testCookieTrackClearTrackingPrevention", true, 1282, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

  })
}

