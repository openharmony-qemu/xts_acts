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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ImageCreator].on';

async function onCallbackTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let callbackFunc = () => {
    console.info(TAG, 'Succeeded in getting imageRelease callback.');
  }
  creator.onImageRelease(callbackFunc);
  await creator.dequeueImage().then(async (img: image.Image) => {
    await img.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
      let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
      for (let i: int = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 0;
        bufferArr[(i + 1) as int] = 0;
        bufferArr[(i + 2) as int] = 255;
        bufferArr[(i + 3) as int] = 255;
      }
    })
    await creator.queueImage(img);
    await creator.release();
    creator.offImageRelease(callbackFunc);
    done();
  })
}

export default function ImageCreatorOnTest(): void {
  describe('ImageCreatorOnTest', () => {

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
     * @tc.name   ImageCreator_on_callback_001
     * @tc.number IMAGE_CREATOR_ON_001
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_on_callback_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_on_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await onCallbackTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `failed; error: ${err.code},message is ${err.message}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_on_callback_002
     * @tc.number IMAGE_CREATOR_ON_002
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_on_callback_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_on_callback_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await onCallbackTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `failed; error: ${err.code},message is ${err.message}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}