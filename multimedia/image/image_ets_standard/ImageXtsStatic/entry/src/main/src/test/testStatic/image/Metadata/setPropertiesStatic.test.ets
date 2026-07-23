'use static';
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
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium/index';

const TAG = 'xtsStatic_setPropertiesStatic';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function setPropertiesPromiseTest(done: () => void, testName: string, path: string,
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

export default function setPropertiesStaticSuppTest(): void {
  describe('setPropertiesStaticSuppTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0100
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0100';
      const path = 'CUVAHdr.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "300",
        "ImageLength": "300"
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
          expect(resultKey["ImageWidth"]).assertEqual("300");
          expect(resultKey["ImageLength"]).assertEqual("300");
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0200
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0200';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "1000",
        "ImageLength": "1000"
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
          expect(resultKey["ImageWidth"]).assertEqual("1000");
          expect(resultKey["ImageLength"]).assertEqual("1000");
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0300
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0300';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "0",
        "ImageLength": "1000"
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
          expect(resultKey["ImageWidth"]).assertEqual("0");
          expect(resultKey["ImageLength"]).assertEqual("1000");
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0400
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0400';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "1000",
        "ImageLength": "0"
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
          expect(resultKey["ImageWidth"]).assertEqual("1000");
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0500
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0500';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "0",
        "ImageLength": "0"
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0600
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0600';
      const path = 'test_exif_v2.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "200",
        "ImageLength": "300"
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0700
     * @tc.number SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0700
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_promise_Supp_Static_0700';
      const path = 'test_exif_v2.jpg';
      let setkey: Record<string, string | null> = {};
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0100
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0100', Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0100';
        const path = 'CUVAHdrMulti.jpg';
        let setkey: Record<string, string | null> = {
          "ImageWidth": '300',
          "ImageLength": null
        };
        await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
          try {
            await metaData!.setProperties(setkey);
            console.info(TAG, testName, 'Set metadata success');
            let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
            console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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

    /**
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0200
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0200';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": null,
        "ImageLength": '600'
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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
    /**
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0300
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0300';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": null,
        "ImageLength": null
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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

    /**
     * @tc.name   SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0400
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_setProperties_abnormal_promise_Supp_Static_0400';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": null,
        "ImageLength": null
      };
      await setPropertiesPromiseTest(done, testName, path, async (metaData: image.Metadata | undefined ): Promise<void> => {
        try {
          await metaData!.setProperties(setkey);
          console.info(TAG, testName, 'Set metadata success');
          let resultKey: Record<string, string | null> = await metaData!.getProperties(["ImageWidth", "ImageLength"]);
          console.info(TAG, testName, 'Get properties result:', JSON.stringify(resultKey));
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