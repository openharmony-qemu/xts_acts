'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../../hypium';

const TAG = 'ImageXts.createImageReceiver';

export default function createImageReceiverPackerTest(): void {
  describe('createImageReceiverPackerTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0500
     * @tc.desc   createImageReceiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0500';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        const ImageFormat = image.ImageFormat.JPEG;
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, ImageFormat, 8);
        expect(receiver!.size.height === size.height).assertTrue();
        expect(receiver!.size.width === size.width).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0600
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0600
     * @tc.desc   createImageReceiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0600';
      try {
        let size: image.Size = {
          height: 8,
          width: 8192
        };
        const ImageFormat = image.ImageFormat.JPEG;
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, ImageFormat, 8);
        expect(receiver!.size.height === size.height).assertTrue();
        expect(receiver!.size.width === size.width).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0300
     * @tc.desc   createImageReceiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0300';
      try {
        let size: image.Size = {
          height: 0,
          width: 0
        };
        const ImageFormat = image.ImageFormat.JPEG;
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, ImageFormat, 8);
        expect(receiver!.size.height === size.height).assertTrue();
        expect(receiver!.size.width === size.width).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0400
     * @tc.desc   createImageReceiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0400';
      try {
        let size: image.Size = {
          height: 0,
          width: 0
        };
        const ImageFormat = image.ImageFormat.YCBCR_422_SP;
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, ImageFormat, 8);
        expect().assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_0700
     * @tc.desc       createImageReceiver cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0700';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver!.size为：' + receiver!.size.height);
        expect(receiver!.size.height).assertEqual(8192);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_0800
     * @tc.desc       createImageReceiver cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0800';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver!.size为：' + receiver!.size.width);
        expect(receiver!.size.width).assertEqual(8192);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_0900
     * @tc.desc       createImageReceiver cover capacity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0900';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver!.capacity为：' + receiver!.capacity);
        expect(receiver!.capacity).assertEqual(8);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_1000
     * @tc.desc       createImageReceiver cover format
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_1000';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver!.format为：' + receiver!.format);
        expect(receiver!.format).assertEqual(2000);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_1100
     * @tc.desc       createImageReceiver cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_1100';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'size.height：'+ receiver!.size.height);
        expect(receiver!.size.height).assertEqual(480);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_1200
     * @tc.desc       createImageReceiver cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_1200';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'size.width为：'+ receiver!.size.width);
        expect(receiver!.size.width).assertEqual(480);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_1300
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_1300
     * @tc.desc       createImageReceiver cover return capacity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_1300';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'capacity为：'+ receiver!.capacity);
        expect(receiver!.capacity).assertEqual(3);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}