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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it } from '../../../hypium/index';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function EnableAdvancedSecurityModeTest() {
  describe('EnableAdvancedSecurityModeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) { console.log('-----' + err.code) }
      });
      await Utils.msSleep(2000)
      console.log('beforeAll end')
    });

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic001
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_JITCOMPILATION_TRUE_0100
     * @tc.desc   enableAdvancedSecurityMode with disableJITCompilation true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode001', true, 210001, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic002
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_JITCOMPILATION_FALSE_0200
     * @tc.desc   enableAdvancedSecurityMode with disableJITCompilation false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode002', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode002', true, 210002, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic003
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_WEBASSEMBLY_TRUE_0300
     * @tc.desc   enableAdvancedSecurityMode with disableWebAssembly true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode003', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode003', true, 210003, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic004
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_WEBASSEMBLY_FALSE_0400
     * @tc.desc   enableAdvancedSecurityMode with disableWebAssembly false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode004', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode004', true, 210004, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic005
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_WEBGL_TRUE_0500
     * @tc.desc   enableAdvancedSecurityMode with disableWebGL true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode005', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode005', true, 210005, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic006
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_WEBGL_FALSE_0600
     * @tc.desc   enableAdvancedSecurityMode with disableWebGL false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode006', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode006', true, 210006, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic007
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_PDFVIEWER_TRUE_0700
     * @tc.desc   enableAdvancedSecurityMode with disablePDFViewer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode007', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode007', true, 210007, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic008
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_PDFVIEWER_FALSE_0800
     * @tc.desc   enableAdvancedSecurityMode with disablePDFViewer false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode008', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode008', true, 210008, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic009
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_MATHML_TRUE_0900
     * @tc.desc   enableAdvancedSecurityMode with disableMathML true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode009', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode009', true, 210009, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic010
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_MATHML_FALSE_1000
     * @tc.desc   enableAdvancedSecurityMode with disableMathML false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode010', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode010', true, 210010, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic011
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_SERVICEWORKER_TRUE_1100
     * @tc.desc   enableAdvancedSecurityMode with disableServiceWorker true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        
        Utils.emitEvent('emitEnableAdvancedSecurityMode011', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode011', true, 210011, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic012
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_SERVICEWORKER_FALSE_1200
     * @tc.desc   enableAdvancedSecurityMode with disableServiceWorker false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode012', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode012', true, 210012, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic013
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_NONPROXYUDP_TRUE_1300
     * @tc.desc   enableAdvancedSecurityMode with disableNonProxyUDP true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode013', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode013', true, 210013, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic014
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_NONPROXYUDP_FALSE_1400
     * @tc.desc   enableAdvancedSecurityMode with disableNonProxyUDP false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode014', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode014', true, 210014, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic015
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_ALL_TRUE_1500
     * @tc.desc   enableAdvancedSecurityMode with all params true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode015', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode015', true, 210015, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic016
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_ALL_FALSE_1600
     * @tc.desc   enableAdvancedSecurityMode with all params false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode016', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode016', true, 210016, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic017
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_GROUP_TRUE_1700
     * @tc.desc   enableAdvancedSecurityMode with JIT WebAssembly WebGL true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode017', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode017', true, 210017, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableAdvancedSecurityModeStatic018
     * @tc.number SUB_WEB_ENABLEADVANCEDSECURITYMODE_PDFGROUP_TRUE_1800
     * @tc.desc   enableAdvancedSecurityMode with PDFViewer MathML ServiceWorker NonProxyUDP true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdvancedSecurityModeStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableAdvancedSecurityMode018', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableAdvancedSecurityMode018', true, 210018, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

  })
}
