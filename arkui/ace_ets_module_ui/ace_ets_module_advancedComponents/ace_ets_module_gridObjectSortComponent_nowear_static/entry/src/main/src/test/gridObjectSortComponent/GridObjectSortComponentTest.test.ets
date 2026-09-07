'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function GridObjectSortComponentTest() {
  describe('GridObjectSortComponentTest', () => {
    beforeEach(async () => {
      console.info('GridObjectSortComponentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridObjectSortComponent/GridObjectSortComponentTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get GridObjectSortComponentTest state pages:' + JSON.stringify(pages));
        if (!('GridObjectSortComponentTest' == pages.name)) {
          console.info('get GridObjectSortComponentTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push GridObjectSortComponentTest page error:' + err);
      }
      console.info('GridObjectSortComponentTest beforeEach end');
    });

    /**
     * @tc.name   GridObjectSortComponentCreate_static_0100
     * @tc.number SUB_ARKUI_GRIDOBJECTSORTCOMPONENT_CREATE_STATIC_0100
     * @tc.desc   Test GridObjectSortComponent is created successfully with options and dataList
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('GridObjectSortComponentCreate_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridObjectSortComponentCreate_static_0100] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let titleBar = await driver.findComponent(ON.text('菜单'));
        expect(titleBar !== null).assertTrue();
        console.info('[GridObjectSortComponentCreate_static_0100] END');
        done();
      } catch (error) {
        console.error('[GridObjectSortComponentCreate_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
