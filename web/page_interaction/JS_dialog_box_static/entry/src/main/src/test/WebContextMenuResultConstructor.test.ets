'use static';
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function webContextMenuResultConstructor():void {

  describe('WebContextMenuResultConstructorTest', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic001
     * @tc.number SUB_WEB_MENU_RESULT_0100
     * @tc.desc   WebContextMenuResult constructor return value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebContextMenuResultConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(1000);
          Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
          await Utils.msSleep(3000);
          Utils.emitEvent("emitConstructorReturn001", 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testWebContextMenuResultConstructorStatic001", "true", 70042, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
          await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic001' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic002
     * @tc.number SUB_WEB_MENU_RESULT_0200
     * @tc.desc   WebContextMenuResult constructor invocation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebContextMenuResultConstructorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(1000);
          Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
          await Utils.msSleep(3000);
          Utils.emitEvent("emitConstructor001", 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testWebContextMenuResultConstructorStatic002", "constructorSuccess", 70040, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
          await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic002' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic003
     * @tc.number SUB_WEB_MENU_RESULT_0300
     * @tc.desc   WebContextMenuResult closeContextMenu method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebContextMenuResultConstructorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(1000);
          Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
          await Utils.msSleep(3000);
          Utils.emitEvent("emitCloseContextMenu001", 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testWebContextMenuResultConstructorStatic003", "closeContextMenuSuccess", 70044, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
          await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic003' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic004
     * @tc.number SUB_WEB_MENU_RESULT_0400
     * @tc.desc   WebContextMenuResult copyImage method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebContextMenuResultConstructorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitCopyImage001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebContextMenuResultConstructorStatic004", "copyImageSuccess", 70046, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic004' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic005
     * @tc.number SUB_WEB_MENU_RESULT_0500
     * @tc.desc   WebContextMenuResult copy method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebContextMenuResultConstructorStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitCopy001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebContextMenuResultConstructorStatic005", "copySuccess", 70048, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic005' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic006
     * @tc.number SUB_WEB_MENU_RESULT_0600
     * @tc.desc   WebContextMenuResult cut method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebContextMenuResultConstructorStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitCut001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebContextMenuResultConstructorStatic006", "cutSuccess", 70050, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic006' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebContextMenuResultConstructorStatic007
     * @tc.number SUB_WEB_MENU_RESULT_0700
     * @tc.desc   WebContextMenuResult selectAll method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebContextMenuResultConstructorStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticWebContextMenuResult", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitSelectAll001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebContextMenuResultConstructorStatic007", "selectAllSuccess", 70052, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebContextMenuResultConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebContextMenuResultConstructorStatic007' + err)
        }
        done();
      })
  })
}

