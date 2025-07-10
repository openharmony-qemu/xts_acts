/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avplayer from 'libavplayerndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import Utils from './Utils';

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}
const PATH_DEMO =  "demo_no_audio_10s.mp4"

export default function AVPlayerSeekNdkTest() {
  describe('AVPlayerSeekNdkTest', () => {

    beforeAll(async () => {
      await Utils.sleep(2000)
    })

    beforeEach(async () => {
      await Utils.sleep(2000)
    })

    /**
     * @tc.number     : testOhAvPlayerCreate001080
     * @tc.name       : testOhAvPlayerCreate001080
     * @tc.desc       : test OH_AVPlayer_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerCreate001080', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor = await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + this.fileDescriptor?.fd);
      let result: number = avplayer.setup('sss', fileDescriptor.fd, fileDescriptor.offset, fileDescriptor.length);
      expect(result).assertEqual(0);
      done();
    });

  })
}
