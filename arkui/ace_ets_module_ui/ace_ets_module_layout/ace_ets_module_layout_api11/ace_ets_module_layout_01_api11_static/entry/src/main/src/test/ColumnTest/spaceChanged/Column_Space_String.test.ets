/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Column_Space_String() {
  describe('Column_Space_String', () => {
    beforeAll(() => {
      console.info("Column_Space_String beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Column_Space_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space_String",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column_Space_String state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Column_Space_String pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Column_Space_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space_String page error:" + err);
      }
      console.info("Column_Space_String beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space_String after each called")
    });

    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0100
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '30'
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0100', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0100] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: '30'
      });
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0100] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0100] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0100] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0200
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50px'
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0200', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0200] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: '50px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0200] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0200] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 50)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 50)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0200] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0300
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50fp'
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0300', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0300] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: '50fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0300] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0300] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.fp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.fp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_013.bottom - Column_Space_String_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0300] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0400
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50lpx'
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0400', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0400] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: '50lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0400] Column_Space_String_011.left - Column_Space_String_01.left', +(Column_Space_String_011.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0400] Column_Space_String_012.left - Column_Space_String_01.left', +(Column_Space_String_012.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0400] Column_Space_String_013.left - Column_Space_String_01.left', +(Column_Space_String_013.left - Column_Space_String_01.left))
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0400] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0400] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.lpx2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.lpx2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0400] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0500
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to uiContext.vp2px(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0500', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0500] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: uiContext.vp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0500] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0500] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0500] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0600
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2vp(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0600', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0600] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: uiContext.px2vp(10) + 'vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0600] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0600] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0600] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0700
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to uiContext.fp2px(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0700', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0700] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: uiContext.fp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0700] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0700] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.fp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.fp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0700] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0800
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2fp(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0800', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0800] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: uiContext.px2fp(10) + 'fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0800] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0800] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0800] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_0900
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to uiContext.lpx2px(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_static_0900', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0900] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: uiContext.lpx2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0900] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_0900] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.lpx2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.lpx2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_0900] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_1000
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2lpx(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_static_1000', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_1000] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: uiContext.px2lpx(10) + 'lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1000] Column_Space_String_011.left - Column_Space_String_01.left', +(Column_Space_String_011.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1000] Column_Space_String_012.left - Column_Space_String_01.left', +(Column_Space_String_012.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1000] Column_Space_String_013.left - Column_Space_String_01.left', +(Column_Space_String_013.left - Column_Space_String_01.left))
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1000] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1000] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_01000] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_1100
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '3'+'0'
     */
    it('SUB_ACE_Column_Space_String_TEST_static_1100', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_01100] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: '3' + '0'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_01100] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_01100] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_01100] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_static_1200
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50'
     */
    it('SUB_ACE_Column_Space_String_TEST_static_1200', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_static_1200] START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<string>('value')?.message.notify({
        name: 'addSpace', value: '50'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1200] Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_static_1200] Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_static_1200] END');
    });

  })
}