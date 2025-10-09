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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webErrorCode() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.logdottingtwotest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('componentLifeCycleTestOne beforeEach start');

    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMIN_0100
    * @tc.name       : testZoomInErrorStatic001
    * @tc.desc       : test zoomIn error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testZoomInErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitZoomIn', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testZoomInError001', 17100001, 1012, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMIN_0200
    * @tc.name       : testZoomInErrorStatic002
    * @tc.desc       : test zoomIn error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testZoomInErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitZoomIn2', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testZoomInError002', 17100004, 1013, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMOUT_0100
    * @tc.name       : testZoomOutErrorStatic001
    * @tc.desc       : test zoomOut error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testZoomOutErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitZoomOut', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testZoomOutError001', 17100001, 1028, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
   * @tc.number     : SUB_WEB_ERRORCODE_ZOOMOUT_0200
   * @tc.name       : testZoomOutErrorStatic002
   * @tc.desc       : test zoomOut error
   * @tc.size       : MEDIUM
   * @tc.type       : Function
   * @tc.level      : Level 3
   */
    it('testZoomOutErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitZoomOut2', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testZoomOutError002', 17100004, 1065, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SLIDESCROLL_0100
    * @tc.name       : testSlideScrollErrorStatic001
    * @tc.desc       : test slideScroll error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSlideScrollErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSlideScroll', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSlideScrollError001', 17100001, 1033, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SCROLLBY_0100
    * @tc.name       : testScrollByErrorStatic001
    * @tc.desc       : test scrollBy error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testScrollByErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitScrollBy', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testScrollByError001', 17100001, 1034, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOM_0100
    * @tc.name       : testZoomErrorStatic001
    * @tc.desc       : test zoom error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testZoomErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitZoom', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testZoomError001', 17100001, 1049, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOM_0200
    * @tc.name       : testZoomErrorStatic002
    * @tc.desc       : test zoom error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testZoomErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitZoom2', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testZoomError002', 17100004, 1050, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })
  })
}
