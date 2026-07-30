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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../../hypium';

const TAG = 'ImageXts.createImagePacker';

export default function createImagePackerTest(): void {
  describe('createImagePackerTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_createImagePacker_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createImagePacker_static_0200
     * @tc.desc   createImagePacker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImagePacker_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImagePacker_static_0200';
      try {
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        expect(imagePackerApi !== undefined).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail()
        done();
      }
    })
  })
}