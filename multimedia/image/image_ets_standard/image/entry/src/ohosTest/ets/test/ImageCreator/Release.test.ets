/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium-dynamic';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'ImageCreator_release';
const POLL_INTERVAL_MS = 20;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

async function releaseImageTest(testName: string, size: image.Size) {
  let result: boolean = false;
  let flag: boolean = false;
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
      } else {
        console.info(testName, 'Succeeded in dequeue the Image.')
      }
      creator.release().then(async () => {
        console.info(testName, 'Succeeded in release creator.');
        let aaa: image.Image = await creator.dequeueImage();
        console.log(testName, `aaa is ${aaa}`)
        if (aaa === undefined) {
          result = true;
          flag = true;
          console.log(testName, `result is ${result}`)
        }
      }).catch((error: BusinessError) => {
        console.error(testName, `Failed to release the creator.code ${error.code},message is ${error.message}`);
      })
    });
    while (!flag){
      await sleep(POLL_INTERVAL_MS);
    }
  } catch (error) {
    console.info(testName, `failed; error: ${error},${error.code}`);
  }
  expect(result).assertTrue();
}

export default function releaseTest() {
  describe('releaseTest', () => {

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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0100
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await releaseImageTest(testName, size);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0200
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_IMAGE_0200';
      const size: image.Size = {
      height: 8,
      width: 8192
      };
      let testNumber = 10;
      for(let i = 0; i < testNumber; i++) {
        await releaseImageTest(testName, size);
      }
      done();
    });
  })
}