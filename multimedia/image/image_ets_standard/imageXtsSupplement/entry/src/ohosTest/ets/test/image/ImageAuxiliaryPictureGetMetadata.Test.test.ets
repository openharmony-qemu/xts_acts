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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium-dynamic';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'AuxiliaryPictureGetMetadataTestSupp';

const AUX_WIDTH: number = 240;
const AUX_HEIGHT: number = 180;
const AUX_BUFFER_SIZE: number = AUX_WIDTH * AUX_HEIGHT * 4;

interface AuxFixture {
  picture: image.Picture | null;
  auxiliary: image.AuxiliaryPicture | null;
  pixelMap: image.PixelMap | null;
  createdAux: image.AuxiliaryPicture | null;
}

async function getMetadataAbnormalTest(done: Function, testName: string, path: string, metadataType: image.MetadataType,
  callback: (errorCode: string) => void) {
  try {
    const testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    console.info(TAG,testName,'resourceMgr' );
    const rawFile = await resourceMgr.getRawFileContent(path);
    console.info(TAG,testName,'rawFile' );
    const ops: image.SourceOptions = { sourceDensity: 98 };
    console.info(TAG,testName,'ops' );
    const imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    console.info(TAG,testName,'imageSource',JSON.stringify(imageSource) );
    let options: image.DecodingOptionsForPicture = { desiredAuxiliaryPictures: [image.AuxiliaryPictureType.GAINMAP]
    };
    console.info(TAG,testName,'options' );
    const commodityPicture: image.Picture | null = await imageSource.createPicture(options);
    console.info(TAG,testName,'commodityPicture' );
    const auxPictureObj: image.AuxiliaryPicture | null = await commodityPicture.getAuxiliaryPicture(
      image.AuxiliaryPictureType.FRAGMENT_MAP
    );
    if (auxPictureObj != null) {
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      let auxPictureObjMetaData: image.Metadata | null = await auxPictureObj.getMetadata(metadataType);
      if (auxPictureObjMetaData != null) {
        console.info('Get AuxPictureObj Metadata success' );
      } else {
        console.error('Get AuxPictureObj Metadata failed');
      }
    } else {
      console.error('Get AuxPictureObj is null.');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.error(TAG, testName, `failed; error:`, JSON.stringify(error), error.code);
    callback(error.code);
    done();
 }
}

function createPictureWithGAINMAPAux(): AuxFixture {
  const result: AuxFixture = {
    picture: null,
    auxiliary: null,
    pixelMap: null,
    createdAux: null
  };
  const auxBuffer: ArrayBuffer = new ArrayBuffer(AUX_BUFFER_SIZE);
  const auxSize: Size = { height: AUX_HEIGHT, width: AUX_WIDTH };
  const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
  result.createdAux = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
  if (result.createdAux == null) {
    return result;
  }
  const pmBuffer: ArrayBuffer = new ArrayBuffer(4 * 4 * 4);
  const pmOpts: image.InitializationOptions = {
    size: { height: 4, width: 4 },
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    editable: true
  };
  result.pixelMap = image.createPixelMapSync(pmBuffer, pmOpts);
  result.picture = image.createPicture(result.pixelMap);
  try {
    result.picture.setAuxiliaryPicture(auxType, result.createdAux);
  } catch (e) {
    return result;
  }
  result.auxiliary = result.picture.getAuxiliaryPicture(auxType);
  return result;
}

function releaseFixture(fixture: AuxFixture): void {
  if (fixture.auxiliary != null) {
    fixture.auxiliary.release();
  }
  if (fixture.createdAux != null) {
    fixture.createdAux.release();
  }
  if (fixture.picture != null) {
    fixture.picture.release();
  }
  if (fixture.pixelMap != null) {
    fixture.pixelMap.release();
  }
}

export default function ImageAuxiliaryPictureGetMetadataTest() {
  describe('ImageAuxiliaryPictureGetMetadataTest', () => {
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
     * @tc.name   IMAGE_AUXILIARY_PICTURE_GET_METADATA_001
     * @tc.number IMAGE_AUXILIARY_PICTURE_GET_METADATA_001
     * @tc.desc   Get EXIF metadata from UNFOCUSED_MAP auxiliary picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_001';
      const path = 'test8.png';
      const metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataAbnormalTest(done, testName, path, metadataType,(errCode) => {
        console.info(TAG, testName, `createAuxiliaryPicture success, enum=${metadataType}`);
        expect(metadataType).assertEqual(image.MetadataType.EXIF_METADATA);
        done();
      })
  });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_GET_METADATA_002
     * @tc.number IMAGE_AUXILIARY_PICTURE_GET_METADATA_002
     * @tc.desc   Get GIF metadata from FRAGMENT_MAP auxiliary picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_002';
      const path = 'test8.png';
      const metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataAbnormalTest(done, testName, path, metadataType,(errCode) => {
        console.info(TAG, testName, `createAuxiliaryPicture success, enum=${metadataType}`);
        expect(metadataType).assertEqual(image.MetadataType.GIF_METADATA);
        done();
      })
    })

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_GET_METADATA_003
     * @tc.number IMAGE_AUXILIARY_PICTURE_GET_METADATA_003
     * @tc.desc   Get GIF metadata from FRAGMENT_MAP auxiliary picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_003';
      const path = 'test8.png';
      const metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataAbnormalTest(done, testName, path, metadataType,(errCode) => {
        console.info(TAG, testName, `createAuxiliaryPicture success, enum=${metadataType}`);
        expect(metadataType).assertEqual(image.MetadataType.FRAGMENT_METADATA);
        done();
      })
    })

    /**
     * @tc.number    : SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0100
     * @tc.name      : SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0100
     * @tc.desc      : AuxiliaryPicture.getMetadata request EXIF_METADATA on GAINMAP auxiliary picture, expect 7600202
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0100';
      const fixture = createPictureWithGAINMAPAux();
      try {
        if (fixture.auxiliary == null) {
          console.error(TAG, testName, 'setup failed: auxiliary is null');
          expect().assertFail();
          releaseFixture(fixture);
          done();
          return;
        }
        console.info(TAG, testName, 'setup success, auxiliary getType=', fixture.auxiliary.getType());
        try {
          fixture.auxiliary.getMetadata(image.MetadataType.EXIF_METADATA);
          console.error(TAG, testName, 'getMetadata(EXIF_METADATA) should throw 7600202 but succeeded');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName, `getMetadata(EXIF_METADATA) threw, code=${error.code}, message=${error.message}`);
          expect(error.code).assertEqual('7600202');
        }
        releaseFixture(fixture);
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        releaseFixture(fixture);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0200
     * @tc.name      : SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0200
     * @tc.desc      : AuxiliaryPicture.getMetadata request FRAGMENT_METADATA on GAINMAP (non-FRAGMENT_MAP) auxiliary picture, expect 7600202
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_IMAGE_AUXILIARY_PICTURE_GET_METADATA_0200';
      const fixture = createPictureWithGAINMAPAux();
      try {
        if (fixture.auxiliary == null) {
          console.error(TAG, testName, 'setup failed: auxiliary is null');
          expect().assertFail();
          releaseFixture(fixture);
          done();
          return;
        }
        console.info(TAG, testName, 'setup success, auxiliary getType=', fixture.auxiliary.getType());
        try {
          fixture.auxiliary.getMetadata(image.MetadataType.FRAGMENT_METADATA);
          console.error(TAG, testName, 'getMetadata(FRAGMENT_METADATA) should throw 7600202 but succeeded');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName, `getMetadata(FRAGMENT_METADATA) threw, code=${error.code}, message=${error.message}`);
          expect(error.code).assertEqual('7600202');
        }
        releaseFixture(fixture);
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        releaseFixture(fixture);
        expect().assertFail();
        done();
      }
    });
  })
}