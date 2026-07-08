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
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { image } from '@kit.ImageKit';

const TAG = 'xts.getDisposalTypeList';

interface ErrorCodeType {
  Invalid_Image_Source: number;
  Invalid_Media_operation: number;
}

const ErrorCode: ErrorCodeType = {
  Invalid_Image_Source: 62980149,
  Invalid_Media_operation: 62980137
};

async function getDisposalTypeListPromiseTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let disposalTypes: Array<Int> = await imageSourceApi!.getDisposalTypeList();
  console.info(TAG, 'disposalTypes', JSON.stringify(disposalTypes));
  expect(disposalTypes != undefined).assertTrue();
  imageSourceApi!.release();
  done();
}

async function getDisposalTypeListPromiseAbnormalTest(done: () => void, testName: string, pathUri: string) {
  try {
    let testContext: Context = Hypium.get("Context") as Context;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
    let disposalTypes: Array<Int> = await imageSourceApi!.getDisposalTypeList();
    console.info(TAG, 'disposalTypes', JSON.stringify(disposalTypes));
    imageSourceApi!.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Invalid_Image_Source || error.code == ErrorCode.Invalid_Media_operation)
        .assertTrue();
    } else {
      expect(error == ErrorCode.Invalid_Image_Source || error == ErrorCode.Invalid_Media_operation).assertTrue();
    }
    done();
  }
}

export default function ImageSourceGetDisposalTypeListTest(): void {
  describe('ImageSourceGetDisposalTypeListTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0100
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0100';
      const path = 'test6.gif';
      try {
        await getDisposalTypeListPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0200
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0200';
      const path = 'test.jpg';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0300
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0300';
      const path = 'test.svg';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0400
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0400
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0400';
      const path = 'test7.png';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0500
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0500
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0500';
      const path = 'test8.bmp';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0600
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0600
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0600';
      const path = 'test_aisr.dng';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0700
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0700
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0700';
      const path = 'test_aisr.ico';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0800
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0800
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0800';
      const path = 'test_aisr.dng';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getDisposalType_List_static_0900
     * @tc.number SUB_MEDIA_IMAGE_getDisposalType_List_static_0900
     * @tc.desc   imageSource_getDisposalTypeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getDisposalType_List_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getDisposalType_List_static_0900';
      const path = 'test_exif_empty2.webp';
      try {
        await getDisposalTypeListPromiseAbnormalTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}