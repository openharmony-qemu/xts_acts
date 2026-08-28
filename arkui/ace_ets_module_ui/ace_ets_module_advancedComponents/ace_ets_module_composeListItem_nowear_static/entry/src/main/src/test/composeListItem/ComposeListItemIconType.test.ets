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

export default function ComposeListItemIconType() {
  describe('ComposeListItemIconType', () => {
    beforeEach(async () => {
      console.info('ComposeListItemIconType beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItem/ComposeListItemIconType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ComposeListItemIconType state pages:' + JSON.stringify(pages));
        if (!('ComposeListItemIconType' == pages.name)) {
          console.info('get ComposeListItemIconType pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ComposeListItemIconType page error:' + err);
      }
      console.info('ComposeListItemIconType beforeEach end');
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0100
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0200
     * @tc.desc   Test ComposeListItem contentItem with IconType.BADGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0100] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let badgeText = await driver.findComponent(ON.text('BADGE'));
        expect(badgeText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0100] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0200
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0300
     * @tc.desc   Test ComposeListItem contentItem with IconType.SYSTEM_ICON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0200] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let systemIconText = await driver.findComponent(ON.text('SYSTEM_ICON'));
        expect(systemIconText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0200] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0300
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0400
     * @tc.desc   Test ComposeListItem contentItem with IconType.HEAD_SCULPTURE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0300] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let headSculptureText = await driver.findComponent(ON.text('HEAD_SCULPTURE'));
        expect(headSculptureText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0300] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0400
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0500
     * @tc.desc   Test ComposeListItem contentItem with IconType.APP_ICON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0400] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let appIconText = await driver.findComponent(ON.text('APP_ICON'));
        expect(appIconText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0400] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0400] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0500
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0600
     * @tc.desc   Test ComposeListItem contentItem with IconType.PREVIEW
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0500] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let previewText = await driver.findComponent(ON.text('PREVIEW'));
        expect(previewText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0500] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0500] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0600
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0700
     * @tc.desc   Test ComposeListItem contentItem with IconType.LONGITUDINAL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0600] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let longitudinalText = await driver.findComponent(ON.text('LONGITUDINAL'));
        expect(longitudinalText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0600] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0600] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ComposeListItemContentItem_static_0700
     * @tc.number SUB_ARKUI_COMPOSELISTITEM_CONTENTITEM_STATIC_0800
     * @tc.desc   Test ComposeListItem contentItem with IconType.VERTICAL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComposeListItemContentItem_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ComposeListItemContentItem_static_0700] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let verticalText = await driver.findComponent(ON.text('VERTICAL'));
        expect(verticalText !== null).assertTrue();
        console.info('[ComposeListItemContentItem_static_0700] END');
        done();
      } catch (error) {
        console.error('[ComposeListItemContentItem_static_0700] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}