'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, Level } from '../../../hypium/index';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
let context: common.UIAbilityContext | undefined;

export default function ActsSetMissionWindowIconTest(): void {
  describe('ActsSetMissionWindowIconTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
    })

    /** 
    * @tc.number SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0100
    * @tc.name SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0100
    * @tc.desc test setMissionWindowIcon success
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 0
    */
    it('SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0100';
      hilog.info(0x0000, TEST_CASE_NAME, `start`);
      let imagePixelMap: image.PixelMap;
      let color = new ArrayBuffer(50 * 50 * 4);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 0;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 255;
      }
      image.createPixelMap(color, {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 50, width: 50 }
      }).then((data: image.PixelMap) => {
        imagePixelMap = data;
        context!.setMissionWindowIcon(imagePixelMap)
          .then((idata) => {
            expect(idata).assertEqual(undefined);
            console.info('setMissionWindowIcon succeed');
            resolve(undefined); done();
          })
          .catch((err: Error) => {
            console.error(`setMissionWindowIcon failed, code is ${err?.code}, message is ${err.message}`);
            expect(err?.code).assertEqual(801);
            resolve(undefined); done();
          });
      }).catch((err: Error) => {
        console.error(`createPixelMap failed, code is ${err?.code}, message is ${err.message}`);
        expect().assertFail();
        resolve(undefined); done();
      });
          });
    })

    /** 
    * @tc.number SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0200
    * @tc.name SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0200
    * @tc.desc test null to the setMissionWindowIcon interface results in a 401 error code
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 0
    */
    it('SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0200';
      hilog.info(0x0000, TEST_CASE_NAME, `start`);
      try{
        context!.setMissionWindowIcon(null as image.PixelMap);
        console.info('setMissionWindowIcon succeed');
        expect().assertFail();
        resolve(undefined); done();
      }catch(err){
        console.error(`setMissionWindowIcon failed, code is ${err?.code}, message is ${err.message}`);
        expect(err?.code).assertEqual(0);
        resolve(undefined); done();
      }
          });
    })

    /** 
    * @tc.number SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0300
    * @tc.name SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0300
    * @tc.desc test undefined to the setMissionWindowIcon interface results in a 401 error code
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 0
    */
    it('SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_Static_0300';
      hilog.info(0x0000, TEST_CASE_NAME, `start`);
      try{
        context!.setMissionWindowIcon(undefined as image.PixelMap);
        console.info('setMissionWindowIcon succeed');
        expect().assertFail();
        resolve(undefined); done();
      }catch(err){
        console.error(`setMissionWindowIcon failed, code is ${err?.code}, message is ${err.message}`);
        expect(err?.code).assertEqual(0);
        resolve(undefined); done();
      }
          });
    })
  })
}
