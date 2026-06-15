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

import { Context } from '@kit.AbilityKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium';
import { image } from '@kit.ImageKit';

const TAG = 'xts.getImageProperties';

async function getImagePropertiesPromiseTest(done: () => void, testName: string, pathUri: string,
  PropertyKey: image.PropertyKey[]) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let data: Record<PropertyKey, string | null> = await imageSourceApi!.getImageProperties(PropertyKey);
  imageSourceApi!.release();
  expect(data != null).assertTrue();
  done();
}


export default function ImageSourceGetImagePropertiesTest(): void {
  describe('ImageSourceGetImagePropertiesTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperties_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperties_static_0100
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperties_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperties_static_0100';
      const path = 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try{
        await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperties_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getImageProperties_static_0200
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperties_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperties_static_0200';
      const path = 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_WIDTH];
      try{
        await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperties_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getImageProperties_static_0300
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperties_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperties_static_0300';;
      const path = 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_LENGTH];
      try{
        await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}