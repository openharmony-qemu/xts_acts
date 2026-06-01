/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import openextndk from 'libopenextndktest.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { deviceInfo } from '@kit.BasicServicesKit'

export default function openExtNdkTest() {
  describe('OpenExtNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
    * @tc.name   testMuslSymExportedOpenExt001
    * @tc.number SUB_THIRDPARTY_MUSL_OPEN_2_0100
    * @tc.desc   test __open_2
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testMuslSymExportedOpenExt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = openextndk.open2Test();
      let deviceType: string = deviceInfo.deviceType; 
      let isValid: boolean =  (deviceType === '2in1' && resNum == 1) || (deviceType !== '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}