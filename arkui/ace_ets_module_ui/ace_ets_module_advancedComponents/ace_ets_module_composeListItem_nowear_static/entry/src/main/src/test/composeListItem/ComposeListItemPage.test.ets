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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ComposeListItemPage() {
  describe('ComposeListItemPage', () => {
    beforeEach(async () => {
      console.info('ComposeListItemPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItem/ComposeListItemPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ComposeListItemPage state pages:' + JSON.stringify(pages));
        if (!('ComposeListItemPage' == pages.name)) {
          console.info('get ComposeListItemPage pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ComposeListItemPage page error:' + err);
      }
      console.info('ComposeListItemPage beforeEach end');
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0100
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0100
     * @tc.desc   Test ComposeListItem operateItem with icon and subIcon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0100] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let operateText = await driver.findComponent(ON.text('Icon1'));
        expect(operateText !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0100] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0200
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0200
     * @tc.desc   Test ComposeListItem operateItem with image symbolStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0200] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let operateText = await driver.findComponent(ON.text('SymbolStyle2'));
        expect(operateText !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0200] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0300
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0300
     * @tc.desc   Test ComposeListItem operateItem with radio checked
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0300] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let radio = await driver.findComponent(ON.text('Radio3'));
        expect(radio !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0300] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0400
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0400
     * @tc.desc   Test ComposeListItem operateItem with button
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0400] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let operateButton = await driver.findComponent(ON.text('确定'));
        expect(operateButton !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0400] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0400] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0500
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0500
     * @tc.desc   Test ComposeListItem operateItem with arrow and text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0500] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let arrowText = await driver.findComponent(ON.text('右侧'));
        expect(arrowText !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0500] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0500] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0600
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0600
     * @tc.desc   Test ComposeListItem operateItem with checkbox
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0600] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let checkbox = await driver.findComponent(ON.text('Checkbox6'));
        expect(checkbox !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0600] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0600] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemOperateItem_static_0700
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_OPERATEITEM_STATIC_0700
     * @tc.desc   Test ComposeListItem operateItem with toggle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemOperateItem_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemOperateItem_static_0700] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let toggle = await driver.findComponent(ON.text('Toggle7'));
        expect(toggle !== null).assertTrue();
        console.info('[ComposeListItemOperateItem_static_0700] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemOperateItem_static_0700] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}