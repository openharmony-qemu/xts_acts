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

import { Context } from '@kit.AbilityKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'ImageXts.release';

async function releasePromiseTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  await imageSourceApi!.release();
  done();
}

async function releaseCallbackTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  imageSourceApi!.release((err: BusinessError | null) => {
    if (err) {
      expect().assertFail();
    } else {
      console.info(`release success`);
    }
    done();
  });
}

export default function ImageSourceReleaseTest(): void {
  describe('ImageSourceReleaseTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_release_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_release_promise_static_0100
     * @tc.desc   imageSource_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_release_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_release_promise_static_0100';
      const path = 'test.jpeg';
      try{
        await releasePromiseTest(done, testName, path);
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_release_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_release_callback_static_0100
     * @tc.desc   imageSource_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_release_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_release_callback_static_0100';
      const path = 'test.jpeg';
      try{
        await releaseCallbackTest(done, testName, path);
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}