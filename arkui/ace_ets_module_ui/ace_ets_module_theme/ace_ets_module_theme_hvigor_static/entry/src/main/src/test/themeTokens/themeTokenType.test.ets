'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function themeTokenType() {
  describe('themeTokenType', () => {

    beforeEach(async () => {
      console.info('themeTokenType beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/themeTokensPages/themeTokenType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get themeTokenType state pages:' + JSON.stringify(pages));
        if (!('themeTokenType' == pages.name)) {
          console.info('get themeTokenType pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push themeTokenType page error:' + err);
      }
      console.info('themeTokenType beforeEach end');
    });

    /**
     * @tc.name   themeTokenType_static_0100
     * @tc.number SUB_ARKUI_THEME_TOKENTYPE_STATIC_0100
     * @tc.desc   Test theme tokenType property with TokenType.PRIMARY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('themeTokenType_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[themeTokenType_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('themeTokenType_static_0100 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('localTheme_primary');
      console.info("[themeTokenType_static_0100] type: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("Test WithTheme");
      console.info('[themeTokenType_static_0100] END');
      done();
    });
  });
}