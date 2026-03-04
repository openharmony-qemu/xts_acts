/*
* Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  common,
  Context,
  sendableContextManager
} from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';

let uiAbilityContext: common.UIAbilityContext | undefined;

export default function abilityTest() {

  const CACHE_DIR = '/data/storage/el2/base/haps/entry_test/cache';
  const FILE_DIR = '/data/storage/el2/base/haps/entry_test/files';
  const TEMP_DIR = '/data/storage/el2/base/haps/entry_test/temp';
  const DATABASE_DIR = '/data/storage/el2/database/entry_test';
  const preferences_DIR = '/data/storage/el2/base/haps/entry_test/preferences';
  const BUNDLE_DIR = '/data/storage/el1/bundle';
  const distributedFilesDir_DIR = '/data/storage/el2/distributedfiles';
  const resourceDir_DIR = '';
  const cloudFile_Dir = '/data/storage/el2/cloud';
  const LogFile_Dir = '/data/storage/el2/log';


  describe('CreateAreaModeContext', () => {
    beforeAll(async () => {
      uiAbilityContext = AppStorage.get('context');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900
     * @tc.desc   Retrieve the path property from the displayContext created by uiAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: start');
      try {
        console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: try');
        let displayContext: Context | undefined = uiAbilityContext?.createAreaModeContext(1);
        console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: uiAbilityContext' +
        JSON.stringify(displayContext));
        if (displayContext != undefined) {
          expect(displayContext.cacheDir).assertEqual(CACHE_DIR);
          expect(displayContext.filesDir).assertEqual(FILE_DIR);
          expect(displayContext.tempDir).assertEqual(TEMP_DIR);
          expect(displayContext.databaseDir).assertEqual(DATABASE_DIR);
          expect(displayContext.preferencesDir).assertEqual(preferences_DIR);
          expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR);
          expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR);
          expect(displayContext.resourceDir).assertEqual(resourceDir_DIR);
          expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir);
          expect(displayContext.logFileDir).assertEqual(LogFile_Dir);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000
     * @tc.desc   Retrieve the resourceManager property from the displayContext created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: start');
      try {
        let displayContext: Context | undefined = uiAbilityContext?.createAreaModeContext(1);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: uiAbilityContext' +
          JSON.stringify(displayContext));
          await resourceManagerTest(displayContext).then((data) => {
            console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000] data : ' + data);
            expect(true).assertEqual(data);
          });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: end');
    })
  })
}

export async function resourceManagerTest(displayContext: Context): Promise<boolean> {
  let result: boolean = true;
  await displayContext.resourceManager.getString($r('app.string.ServiceExtAbility_label').id)
    .then((data) => {
      result &&= (data === 'label');
      console.log(`DisplayContextTest resourceManager.getString, data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error('DisplayContextTest resourceManager.getString fail' + error.name + error.message);
    });
  if (result) {
    await displayContext.resourceManager.getStringValue($r('app.string.ServiceExtAbility_label'))
      .then((data) => {
        result &&= (data === 'label');
        console.log(`DisplayContextTest resourceManager.getStringValue, data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getStringValue fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getMedia($r('app.media.background').id)
      .then((data) => {
        result &&= (data.length > 0);
        console.log(`DisplayContextTest resourceManager.getMedia, data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getMedia fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getMediaContent($r('app.media.background'))
      .then((data) => {
        result &&= (data.length > 0);
        console.log(`DisplayContextTest resourceManager.getMediaContent, data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getMediaContent fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getColor($r('app.color.start_window_background').id)
      .then((data) => {
        result &&= (data > 0);
        console.log(`DisplayContextTest resourceManager.getColor(resId), data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getColor(resId) fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getColor($r('app.color.start_window_background'))
      .then((data) => {
        result &&= (data > 0);
        console.log(`DisplayContextTest resourceManager.getColor(res), data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getColor(res) fail' + error.name + error.message);
      });
  }
  console.log(`DisplayContextTest resourceManagerTest end, result: ${result}`);
  return result;
}