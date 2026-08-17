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
import { describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webViewContCreatePdfAndOthersError():void {
  describe('ActsAceWebDevWebViewContCreatePdfAndOthersErrorTest', (): void => {

    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });


    beforeEach(async () => {
      await Utils.msSleep(5000);
      console.info('beforeEach start');
    })

    /**
     * @tc.name   testSetPrintBackgroundInitErrStatic
     * @tc.number SUB_WEB_CREATE_PDF_0100
     * @tc.desc   test interface of setPrintBackground with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrintBackgroundInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSetPrintBackgroundInitErr', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testSetPrintBackgroundInitErr', 17100001, 17113, done);
        await Utils.msSleep(3000);
        Utils.registerEvent('testSetPrintBackgroundInitErr',
          'Init error. The WebviewController must be associated with a Web component', 17114, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
        await Utils.msSleep(1000);
        } catch(err) {
          expect().assertFail();
        }
       done();
      })

    /**
     * @tc.name        testOnSwitchNextPage02
     * @tc.number      SUB_WEB_CREATE_PDF_0200
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testOnSwitchNextPage02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
        Utils.emitEvent("emitOnSwitchNextPage02", 10)
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
        await Utils.msSleep(2000);
        } catch(err) {
          expect().assertFail();
        }
        done();
      })
  })
}