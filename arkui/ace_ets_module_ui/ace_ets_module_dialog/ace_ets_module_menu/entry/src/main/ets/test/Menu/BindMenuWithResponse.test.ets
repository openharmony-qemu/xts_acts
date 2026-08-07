/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  MouseButton
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function BindMenuWithResponse() {
  describe('BindMenuWithResponse', () => {
    beforeEach(async (done: Function) => {
      console.info("BindMenuWithResponse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/BindMenuWithResponse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BindMenuWithResponse state pages: " + JSON.stringify(pages));
        if (!("BindMenuWithResponse" == pages.name)) {
          console.info("get BindMenuWithResponse state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push BindMenuWithResponse success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BindMenuWithResponse page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BindMenuWithResponse after each called");
    });

    /**
     * @tc.name : BindMenuWithResponse_0100
     * @tc.number : BindMenuWithResponse_0100
     * @tc.desc : To test bindContextMenuWithResponse long Click
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL0
     */
    it('BindMenuWithResponse_0100', Level.LEVEL0, async (done: Function) => {
      console.info('BindMenuWithResponse_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindClickId'));
      await button?.longClick();
      console.info('[BindMenuWithResponse_0100] long click');
      await CommonFunc.sleep(1000);
      let menu: Component = await driver.findComponent(ON.type('Menu'));
      expect(menu !== null).assertTrue();
      await menu?.click();
      await CommonFunc.sleep(1000);
      let hideBtn = await driver.findComponent(ON.id('hideId'));
      await hideBtn?.click();
      console.info('[BindMenuWithResponse_0100] hideBtn click');
      await CommonFunc.sleep(2000);
      console.info('BindMenuWithResponse_0100 END');
      done();
    });

    /**
     * @tc.name : BindMenuWithResponseArray_0200
     * @tc.number : BindMenuWithResponseArray_0200
     * @tc.desc : bindContextMenuWithResponse MenuElement[] 调用+入参+返回链式绑定
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('BindMenuWithResponseArray_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('bindArrayId'));
        expect(btn !== undefined).assertTrue();
        await btn?.longClick();
        await CommonFunc.sleep(1000);
        let menu: Component = await driver.findComponent(ON.type('Menu'));
        expect(menu !== null).assertTrue();
        let hideBtn = await driver.findComponent(ON.id('hideId'));
        await hideBtn?.click();
        await CommonFunc.sleep(500);
        done();
      });

    /**
     * @tc.name : BindMenuWithResponseArrayAbnormal_0300
     * @tc.number : BindMenuWithResponseArrayAbnormal_0300
     * @tc.desc : Array 重载异常入参 null/undefined 组件可构建
     * @tc.type : FUNCTION
     * @tc.size : SMALLTEST
     * @tc.level : LEVEL2
     */
    it('BindMenuWithResponseArrayAbnormal_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        let driver = await Driver.create();
        let n1 = await driver.findComponent(ON.id('bindArrayContentNullId'));
        let n2 = await driver.findComponent(ON.id('bindArrayContentUndefId'));
        let n3 = await driver.findComponent(ON.id('bindArrayOptionsNullId'));
        let n4 = await driver.findComponent(ON.id('bindArrayOptionsUndefId'));
        expect(n1 !== undefined).assertTrue();
        expect(n2 !== undefined).assertTrue();
        expect(n3 !== undefined).assertTrue();
        expect(n4 !== undefined).assertTrue();
        done();
      });
  })
}