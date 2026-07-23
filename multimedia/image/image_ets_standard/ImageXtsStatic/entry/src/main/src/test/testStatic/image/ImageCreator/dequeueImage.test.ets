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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../../../../hypium/index';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ImageCreator].dequeueImage';

async function dequeueImagePromiseTest(done: () => void, testName: string,  size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  await creator.dequeueImage().then((img: image.Image) => {
    expect(img.size.width).assertEqual(size.width);
    expect(img.size.height).assertEqual(size.height);
    creator.release();
    console.info(TAG, 'Succeeded in dequeuing the Image.');
  }).catch((error) => {
    console.error(TAG, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
    expect().assertFail();
  })
  done();
}

async function dequeueImageCallbackTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
    if (err) {
      console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
      expect().assertFail();
    } else {
      expect(img!.size.width).assertEqual(size.width);
      expect(img!.size.height).assertEqual(size.height);
      console.info(TAG, 'Succeeded in dequeuing the Image.')
    }
    creator?.release((err: BusinessError | null) => {
      if (err) {
        console.error(TAG, `Failed to release the image instance.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in releasing the image instance.');
      }
      done();
    })
  });
}

export default function ImageCreatorDequeueImageTest(): void {
  describe('ImageCreatorDequeueImageTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0100
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await dequeueImagePromiseTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0200
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_promise_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await dequeueImagePromiseTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0100
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await dequeueImageCallbackTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `failed; error: ${error.code},message is ${error.message}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0200
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_dequeueImage_callback_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await dequeueImageCallbackTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `failed; error: ${error.code},message is ${error.message}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}