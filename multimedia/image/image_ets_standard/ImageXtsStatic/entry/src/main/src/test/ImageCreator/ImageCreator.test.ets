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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "../../../../hypium";
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

const TAG = 'ImageXts.creatImageCreator';

export default function CrateImageCreatorTest(): void {
  describe('CrateImageCreatorTest', (): void => {
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
     * @tc.number     SUB_MEDIA_IMAGE_dequeueImage_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_dequeueImage_static_0100
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_dequeueImage_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_dequeueImage_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        creator.dequeueImage((err: BusinessError | null , img: image.Image | undefined) => {
          if (err) {
            console.error(TAG, testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img!.clipRect));
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img!.size));
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', img!.format);
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', img!.timestamp);
            expect(img!.clipRect.size.width).assertEqual(8192);
            expect(img!.clipRect.size.height).assertEqual(8192);
            expect(img!.clipRect.x).assertEqual(0);
            expect(img!.clipRect.y).assertEqual(0);
            expect(img!.size.height).assertEqual(8192);
            expect(img!.size.width).assertEqual(8192);
            expect(img!.format).assertEqual(12);
            expect(img!.timestamp).assertEqual(0);
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_dequeueImage_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_dequeueImage_static_0200
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_dequeueImage_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_dequeueImage_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        let img = await creator.dequeueImage();
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.clipRect));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.size));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.format);
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.timestamp);
        expect(img.clipRect.size.width).assertEqual(8192);
        expect(img.clipRect.size.height).assertEqual(8192);
        expect(img.clipRect.x).assertEqual(0);
        expect(img.clipRect.y).assertEqual(0);
        expect(img.size.height).assertEqual(8192);
        expect(img.size.width).assertEqual(8192);
        expect(img.format).assertEqual(12);
        expect(img.timestamp).assertEqual(0);
      } catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })

  })
}