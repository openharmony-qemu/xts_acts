/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import ndkTest from 'libentry.so'

export default function ImageEnumTest() {
  describe('ImageEnumTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM
     * @tc.number SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM
     * @tc.desc   OHOS_IMAGE_COMPONENT_FORMAT_YUV_Y、U、V、JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM', Level.LEVEL1, () => {
      try {
          let ret: number = ndkTest.imageComponentFormatEnum();
          console.info('ret is ' + ret);
          expect(ret).assertEqual(0);
        } catch (err) {
          console.error("fail: " + err);
          expect().assertFail();
        }
    });

  })
}