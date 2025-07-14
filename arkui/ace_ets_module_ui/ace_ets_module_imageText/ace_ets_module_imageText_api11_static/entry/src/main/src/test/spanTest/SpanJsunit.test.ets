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

import { afterEach, beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function spanJsunit() {
  describe('SpanTest', () => {
    beforeAll(() => {
      console.info("spanJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SpanTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/SpanTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SpanTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SpanTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SpanTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanTest page error:" + err);
      }
      console.info("SpanTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Span after each called");
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1080
     * @tc.name testGetSpanAttr_static_010
     * @tc.desc aceEtsTest
     */
    it('testGetSpanAttr_static_010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSpanAttr1 START');
      let strJson = inspector.getInspectorByKey('span1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));

      console.info("span1 decoration" + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      console.info("span1 textCase" + JSON.stringify(obj.getElement('$attrs').getString('textCase')));
      console.info("span1 content" + JSON.stringify(obj.getElement('$attrs').getString('content')));
      console.info("span1 fontSize" + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      console.info("span1 letterSpacing" +
      JSON.stringify(obj.getElement('$attrs').getElement('letterSpacing')));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFFF0000",' +
          '"style":"TextDecorationStyle.SOLID"}');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Test Span demo');
      console.info('testGetSpanAttr1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1090
     * @tc.name testGetSpanAttr_static_020
     * @tc.desc aceEtsTest
     */
    it('testGetSpanAttr_static_020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSpanAttr2 START');
      let strJson = inspector.getInspectorByKey('span2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("span2 textCase" + JSON.stringify(obj.getElement('$attrs').getString('textCase')));
      console.info("span2 content" + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.LowerCase');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('The second test Span demo');
      console.info('testGetSpanAttr2 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1100
     * @tc.name testGetSpanAttr_static_030
     * @tc.desc aceEtsTest
     */
    it('testGetSpanAttr_static_030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSpanAttr3 START');
      let strJson = inspector.getInspectorByKey('span3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("span3 textCase" + JSON.stringify(obj.getElement('$attrs').getString('textCase')));
      console.info("span3 content" + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('The third test Span demo');
      console.info('testGetSpanAttr3 END');
      done();
    });
  })
}
