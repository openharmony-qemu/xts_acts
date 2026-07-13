'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function ExecuteAIPageCommandTest() : void{

  describe('ExecuteAIPageCommandTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(500);
      console.info("ExecuteAIPageCommandTest beforeEach start");
    })

    /**
     * @tc.name   testExecuteAIPageCommand001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0100
     * @tc.desc   test executeAIPageCommand with valid command (wants id)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand001", true, 148111, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0400
     * @tc.desc   test executeAIPageCommand with valid command (wants tag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand004", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand004", true, 148114, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0500
     * @tc.desc   test executeAIPageCommand with valid command (wants text)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand005", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand005", true, 148115, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0600
     * @tc.desc   test executeAIPageCommand with valid command (wants role)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand006", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand006", true, 148116, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0700
     * @tc.desc   test executeAIPageCommand with all wants fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand007", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand007", true, 148117, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0800
     * @tc.desc   test executeAIPageCommand with all wants + attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand008", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand008", true, 148118, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_0900
     * @tc.desc   test executeAIPageCommand with invalid attr mixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand009", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand009", true, 148119, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand010
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1000
     * @tc.desc   test executeAIPageCommand with empty wants array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand010", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand010", true, 148120, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand011
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1100
     * @tc.desc   test executeAIPageCommand with wants as string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand011", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand011", true, 148121, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand012
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1200
     * @tc.desc   test executeAIPageCommand with wants null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand012", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand012", true, 148122, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand013
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1300
     * @tc.desc   test executeAIPageCommand with no params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand013", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand013", true, 148123, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand014
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1400
     * @tc.desc   test executeAIPageCommand with invalid method name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand014", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand014", '17100024', 148124, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand015
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1500
     * @tc.desc   test executeAIPageCommand with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand015", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand015", '17100024', 148125, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand016
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1600
     * @tc.desc   test executeAIPageCommand with malformed JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand016", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand016", '17100024', 148126, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand018
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1800
     * @tc.desc   test executeAIPageCommand with empty JSON object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand018", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand018", true, 148128, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand019
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_1900
     * @tc.desc   test executeAIPageCommand via test_commandName map (id)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand019", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand019", true, 148129, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand020
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2000
     * @tc.desc   test executeAIPageCommand via test_commandName map (all_wants)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand020", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand020", true, 148130, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand021
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2100
     * @tc.desc   test executeAIPageCommand getLiteDom wants tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand021", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand021", true, 148131, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand022
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2200
     * @tc.desc   test executeAIPageCommand getLiteDom wants text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand022", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand022", true, 148132, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand023
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2300
     * @tc.desc   test executeAIPageCommand getLiteDom wants role(a tag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand023", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand023", true, 148133, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand024
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2400
     * @tc.desc   test executeAIPageCommand getLiteDom wants rect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand024", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand024", true, 148134, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand025
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2500
     * @tc.desc   test executeAIPageCommand getLiteDom wants bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand025", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand025", true, 148135, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand026
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2600
     * @tc.desc   test executeAIPageCommand getLiteDom wants visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand026", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand026", true, 148136, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand027
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2700
     * @tc.desc   test executeAIPageCommand getLiteDom wants isInViewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand027", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand027", true, 148137, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand028
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2800
     * @tc.desc   test executeAIPageCommand getLiteDom wants clickable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand028", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand028", true, 148138, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand029
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_2900
     * @tc.desc   test executeAIPageCommand getLiteDom full tags role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand029", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand029", true, 148139, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand030
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3000
     * @tc.desc   test executeAIPageCommand getLiteDom isInViewport false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand030", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand030", true, 148140, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand031
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3100
     * @tc.desc   test executeAIPageCommand getLiteDom isInViewport true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand031", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand031", true, 148141, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand032
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3200
     * @tc.desc   test executeAIPageCommand getLiteDom wants title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand032", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand032", true, 148142, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand033
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3300
     * @tc.desc   test executeAIPageCommand getLiteDom wants aria-label(a tag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand033", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand033", true, 148143, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand034
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3400
     * @tc.desc   test executeAIPageCommand getLiteDom wants aria-label(button tag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand034", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand034", true, 148144, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand035
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3500
     * @tc.desc   test executeAIPageCommand getLiteDom visible false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand035", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand035", true, 148145, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand036
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3600
     * @tc.desc   test executeAIPageCommand getLiteDom visible true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand036", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand036", true, 148146, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand037
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3700
     * @tc.desc   test executeAIPageCommand getLiteDom attributes filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand037", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand037", true, 148147, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand038
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3800
     * @tc.desc   test executeAIPageCommand getLiteDom role filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand038", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand038", true, 148148, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand039
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_3900
     * @tc.desc   test executeAIPageCommand getLiteDom unsupported tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand039", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand039", true, 148149, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand040
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4000
     * @tc.desc   test executeAIPageCommand getLiteDom XSS in wants
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand040", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand040", true, 148150, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand041
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4100
     * @tc.desc   test executeAIPageCommand getLiteDom non-existent tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand041", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand041", true, 148151, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand042
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4200
     * @tc.desc   test executeAIPageCommand getLiteDom malformed JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand042", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand042", '17100024', 148152, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand043
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4300
     * @tc.desc   test executeAIPageCommand getLiteDom empty method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand043", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand043", true, 148153, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand044
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4400
     * @tc.desc   test executeAIPageCommand getLiteDom no params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand044", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand044", true, 148154, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand045
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4500
     * @tc.desc   test executeAIPageCommand with whitespace string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand045", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand045", '17100024', 148155, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand046
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4600
     * @tc.desc   test executeAIPageCommand with JSON array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand046", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand046", '17100024', 148156, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testExecuteAIPageCommand047
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_4700
     * @tc.desc   test executeAIPageCommand with JSON number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteAIPageCommand047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExecuteAIPageCommand047", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testExecuteAIPageCommand047", '17100024', 148157, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ExecuteAIPageCommandTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
