/*
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

import { describe, beforeEach, it, expect, Level, TestType, Size } from '@ohos/hypium'
import nativeTest from 'libentry.so'
import { GlobalContext } from '../test/global';

const SUCCESS = 0 // 成功
const ERROR_CODE_INVALID_INPUT_PARAMETER = 401 // 参数无效
const ERROR_CODE_RES_ID_NOT_FOUND = 9001001 // 无效的资源ID

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let resManager: Context;
    beforeEach(() => {
      resManager = (GlobalContext.getContext().getObject('yq') as Context);
      nativeTest.GetResourceManager(resManager.resourceManager);
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0100
    * @tc.name      TestGetMediaBase640100
    * @tc.desc      getResourceManager with folder
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it('TestGetMediaBase640100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640100 start====");
          let result: number = nativeTest.GetMediaBase640100($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase640100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0200
    * @tc.name      TestGetMediaBase640200
    * @tc.desc      getResourceManager with folder
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it('TestGetMediaBase640200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640200 start====");
          let result: number = nativeTest.GetMediaBase640200($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase640200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0300
    * @tc.name      TestGetMediaBase640300
    * @tc.desc      getResourceManager with folder
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it('TestGetMediaBase640300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640300 start====");
          let result: number = nativeTest.GetMediaBase640300(0);
          console.info(`====>TestGetMediaBase640300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0100
    * @tc.name      TestGetMediaBase64Data0100
    * @tc.desc      getResourceManager with folder
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it('TestGetMediaBase64Data0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0100 start====");
          let result: number = nativeTest.GetMediaBase64Data0100($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase64Data0100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0200
    * @tc.name      TestGetMediaBase64Data0200
    * @tc.desc      getResourceManager with folder
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it('TestGetMediaBase64Data0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0200 start====");
          let result: number = nativeTest.GetMediaBase64Data0200($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase64Data0200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0300
    * @tc.name      TestGetMediaBase64Data0300
    * @tc.desc      getResourceManager with folder
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it('TestGetMediaBase64Data0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0300 start====");
          let result: number = nativeTest.GetMediaBase64Data0300(0);
          console.info(`====>TestGetMediaBase64Data0300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}