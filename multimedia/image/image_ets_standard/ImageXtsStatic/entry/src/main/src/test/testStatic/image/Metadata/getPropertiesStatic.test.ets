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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '@ohos/hypium-binary/src/main/indexStatic';

const TAG = 'xtsStatic_getPropertiesStatic';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function getPropertiesPromiseTest(done: () => void, testName: string, path: string,
  callback:(metaData: image.Metadata | undefined ) => Promise<void>) {
  let pathUri = `file://${testContext.filesDir}/${path}`;
  let imageSource: image.ImageSource | undefined = image.createImageSource(pathUri);
  let commodityPixelMap: image.PixelMap | undefined= await imageSource!.createPixelMap();
  let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
  if(pictureObj != null){
    let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
    let metaData: image.Metadata | undefined = await pictureObj.getMetadata(metadataType);
    if (metaData != null) {
      callback(metaData);
    }else {
      console.info(TAG, `failed; error:pictureObj.getMetadata,`, testName);
      expect().assertFail();
      done();
    }
  }else {
    console.info(TAG, `failed; createPicture error:,`, testName);
    expect().assertFail();
    done();
  }
  await pictureObj!.release();
}

export default function metaDataGetPropertiesTestStatic(): void {
  describe('metaDataGetPropertiesTestStatic', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0100
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0100';
      const path = 'CUVAHdr.jpg';
      let attributeKey = ["ImageWidth", "ImageLength"];
      await getPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.getProperties(attributeKey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey["ImageWidth"]), JSON.stringify(resultKey["ImageLength"]));
          expect(resultKey["ImageWidth"]).assertEqual("3072");
          expect(resultKey["ImageLength"]).assertEqual("4096");

        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0200
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0200';
      const path = 'CUVAHdrMulti.jpg';
      let attributeKey = ["ImageWidth"];
      await getPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.getProperties(attributeKey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey["ImageWidth"]), JSON.stringify(resultKey["ImageLength"]));
          expect(resultKey["ImageWidth"]).assertEqual("4000");
          expect(resultKey["ImageLength"]).assertEqual("3000");
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0300
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getProperties_promise_Supp_Static_0300';
      const path = 'test_exif_v2.jpg';
      let attributeKey = ["ImageLength"];
      await getPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.getProperties(attributeKey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey["ImageWidth"]), JSON.stringify(resultKey["ImageLength"]));
          expect(resultKey["ImageWidth"]).assertEqual("0");
          expect(resultKey["ImageLength"]).assertEqual("0");
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_getProperties_abnormal_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_getProperties_abnormal_promise_Supp_Static_0100
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getProperties_abnormal_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getProperties_abnormal_promise_Supp_Static_0100';
      const path = 'test_exif_v2.jpg';
      let attributeKey = ['1111'];
      await getPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.getProperties(attributeKey);
          console.info(TAG, testName, 'Set metadata success');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600202);
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

  })
}