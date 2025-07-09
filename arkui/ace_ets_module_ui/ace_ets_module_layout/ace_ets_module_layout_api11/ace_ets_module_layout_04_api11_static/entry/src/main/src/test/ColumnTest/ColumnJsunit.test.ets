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

import { afterEach, beforeEach, describe, expect, it, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('')
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function columnJsunit() {
  describe('columnTest', () => {
    beforeAll(() => {
      console.info("columnJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/Column',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column state success " + "");
        if (!("Column" == pages.name)) {
          console.info("get Column state success " + "");
          // let result = await routerInstance.pushUrl(options)
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000)
          // console.info("push Column page success " + "");
        }
      } catch (err) {
        console.error("push Column page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Column after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0670
     * @tc.name testColumn010_static_01
     * @tc.desc aceEtsTest
     */
    it('testColumn010_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('testColumn010_static_01 START');
      let strJson = inspector.getInspectorByKey('column');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('Column');
     console.info("yr new Column0-Column: " + JSON.stringify(obj.getString('$type')));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Center');
     console.log("yr new Column0 alignItems-'HorizontalAlign.Center':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testColumn010_static_01 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0680
     * @tc.name testColumn020_static_02
     * @tc.desc aceEtsTest
     */
    it('testColumn020_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('testColumn020_static_02 START');
      let strJson = inspector.getInspectorByKey('column1');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Start');
     console.log("yr new Column1 alignItems-'HorizontalAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testColumn020_static_02 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0690
     * @tc.name testColumn030_static_03
     * @tc.desc aceEtsTest
     */
    it('testColumn030_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('testColumn030_static_03 START');
      let strJson = inspector.getInspectorByKey('column2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.End');
     console.log("yr new Column2 alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testColumn030_static_03 END');
      done();
    });
  })
}
