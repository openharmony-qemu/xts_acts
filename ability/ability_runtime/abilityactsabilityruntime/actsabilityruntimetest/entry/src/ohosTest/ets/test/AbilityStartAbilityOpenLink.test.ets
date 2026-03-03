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


import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let context:common.UIAbilityContext;

export default function AbilityRuntimeABILITYStartAbilityOpenLink() {
  describe('AbilityRuntime_NdkStartAbility', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
    })
    beforeEach(async () => {

    })
    afterEach(() => {})
    afterAll(async () => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700
     * @tc.desc   The UIAbilityContext calls openLink with only one parameter, link, set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0700';
      try {
        await context.openLink(null);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600
     * @tc.desc   The UIAbilityContext calls openLink with only one parameter, link, set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0600';
      try {
        await context.openLink(undefined);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900
     * @tc.desc   UIAbilityContext calls openLink to configure only one parameter, link, as a regular string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0900';
      try {
        let link:string = 'test';
        await context.openLink(link);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800
     * @tc.desc   UIAbilityContext calls openLink to configure only one parameter, link only has https://
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0800';
      try {
        let link:string = 'https://';
        await context.openLink(link);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(16000019);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500
     * @tc.desc   UIAbilityContext calls openLink to configure only one parameter, and the link does not have a corresponding UIAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_0500';
      try {
        let link:string = 'https://123.1.1.1';
        await context.openLink(link);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(16000019);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500
     * @tc.desc   UIAbilityContext.startAbility is compatible with appLinking, appLinkingOnly is set to true, and the target application does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4500';
      try {
        let want :Want= {
          parameters:{
            appLinkingOnly:true
          },
          uri:'https://123.1.1.1'
        }
        context.startAbility(want, (err, data) => {
          if (err) {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000019);
            done();
          }else {
            hilog.info(0x0000, 'testTag', `startAbility success: ${data}`);
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(16000019);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4400
     * @tc.desc   UIAbilityContext.startAbility is compatible with appLinking, appLinkingOnly is set to true, and the target application does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4400', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4400';
      try {
        let want :Want= {
          parameters:{
            appLinkingOnly:true,
            demo_key:"demo_value",
            demo_num: 111
          },
          uri:'https://123.1.1.1'
        }
        context.startAbility(want)
          .then((data) => {
            hilog.info(0x0000, 'testTag', `startAbility success: ${data}`);
          })
          .catch((err:BusinessError) => {
            hilog.error(0x0000, 'testTag', `startAbility failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000019);
            done();
          })
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(16000019);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4700
     * @tc.desc   UIEnsionContext.startAbility is compatible with appLinking, appLinkingOnly is set to true, and the target application does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4700', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_4700';
      try {
        let want :Want= {parameters:{appLinkingOnly:true},uri:'https://123.1.1.1'}
        context.startAbility(want)
          .then((data) => {
            hilog.info(0x0000, 'testTag', `startAbility success: ${data}`);
          })
          .catch((err:BusinessError) => {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000019);
            done();
          })
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(16000019);
        done();
      }
    })
  })
}