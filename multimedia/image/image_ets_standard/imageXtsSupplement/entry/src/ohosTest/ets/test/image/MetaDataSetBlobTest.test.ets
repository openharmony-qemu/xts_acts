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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { sleep, isEmpty, getPermission, driveFn } from '../common';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import json from '@ohos.util.json';

const TAG = 'MetaDataSetBlobTest.xts'
let fdNumber: number;
let imageSourceApi: image.ImageSource;

async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function getPropertiesAbnormalPromiseTest(testName: string, path: string): Promise<image.Metadata> {
  imageSourceApi = await getImageSource(path);
  let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
  let pictureObj: image.Picture = await image.createPicture(commodityPixelMap);
  let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
  let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
  console.log(TAG, testName, JSON.stringify(metaData));
  return metaData;
}

export default function MetaDataSetBlobTest() {
  describe('MetaDataSetBlobTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
      await imageSourceApi?.release();
    });

    /**
     * @tc.number     SUB_IMAGE_METADATA_SET_BLOB_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_SET_BLOB_TEST_001
     * @tc.desc       Metadata -setBlob -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_SET_BLOB_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_SET_BLOB_TEST_001';
      const path = 'test_exif_v2.jpg';
      try {
        let metaData = await getPropertiesAbnormalPromiseTest(testName, path);
        await metaData.setBlob(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600206);
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_SET_BLOB_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_SET_BLOB_TEST_002
     * @tc.desc       Metadata -setBlob -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_SET_BLOB_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_SET_BLOB_TEST_002';
      const path = 'test_exif_v2.jpg';
      try {
        let metaData = await getPropertiesAbnormalPromiseTest(testName, path);
        await metaData.setBlob(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600206);
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_SOURCE_CREATE_PIXELMAP_TEST_001
     * @tc.name       SUB_IMAGE_SOURCE_CREATE_PIXELMAP_TEST_001
     * @tc.desc       imageSource -createPixelMap
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXELMAP_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXELMAP_TEST_001';
      const path = 'test_exif_v2.jpg';
      imageSourceApi = await getImageSource(path);
      try {
        imageSourceApi.createPixelMap(async (err: BusinessError, pixelMap: image.PixelMap) => {
          if (err) {
            console.error(TAG, testName, `Failed to create pixelMap.code is ${err.code},message is ${err.message}`);
            await imageSourceApi?.release();
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelMap object.');
            await imageSourceApi?.release();
            expect(isEmpty(pixelMap.isEditable)).assertFalse();
          }
        })
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_001
     * @tc.desc       imageSource -getImageProperties -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_001';
      const path = 'test_exif_v2.jpg';
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.getImageProperties(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_002
     * @tc.desc       imageSource -getImageProperties -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_GET_IMAGE_PROPERTIES_TEST_002';
      const path = 'test_exif_v2.jpg';
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.getImageProperties(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_MAKER_NOTE_HUA_WEI_META_DATA_TEST_001
     * @tc.name       SUB_IMAGE_MAKER_NOTE_HUA_WEI_META_DATA_TEST_001
     * @tc.desc       image -MakerNoteHuaweiMetadata -createInstance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_MAKER_NOTE_HUA_WEI_META_DATA_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAKER_NOTE_HUA_WEI_META_DATA_TEST_001';
      try {
        let result = image.MakerNoteHuaweiMetadata.createInstance();
        expect(isEmpty(result.isXmageSupported)).assertTrue();
        expect(isEmpty(result.xmageWatermarkMode)).assertTrue();
        expect(isEmpty(result.xmageLeft)).assertTrue();
        expect(isEmpty(result.xmageTop)).assertTrue();
        expect(isEmpty(result.xmageRight)).assertTrue();
        expect(isEmpty(result.xmageBottom)).assertTrue();
        expect(isEmpty(result.xmageColorMode)).assertTrue();
        expect(isEmpty(result.isCloudEnhanced)).assertTrue();
        expect(isEmpty(result.cloudLabel)).assertTrue();
        expect(isEmpty(result.isWindSnapshot)).assertTrue();
        expect(isEmpty(result.sceneVersion)).assertTrue();
        expect(isEmpty(result.sceneFoodConfidence)).assertTrue();
        expect(isEmpty(result.sceneStageConfidence)).assertTrue();
        expect(isEmpty(result.sceneBlueSkyConfidence)).assertTrue();
        expect(isEmpty(result.sceneGreenPlantConfidence)).assertTrue();
        expect(isEmpty(result.sceneBeachConfidence)).assertTrue();
        expect(isEmpty(result.sceneSnowConfidence)).assertTrue();
        expect(isEmpty(result.sceneSunsetConfidence)).assertTrue();
        expect(isEmpty(result.sceneSunsetConfidence)).assertTrue();
        expect(isEmpty(result.sceneFlowersConfidence)).assertTrue();
        expect(isEmpty(result.sceneNightConfidence)).assertTrue();
        expect(isEmpty(result.sceneTextConfidence)).assertTrue();
        expect(isEmpty(result.faceCount)).assertTrue();
        expect(isEmpty(result.faceConfidences)).assertTrue();
        expect(isEmpty(result.faceSmileScores)).assertTrue();
        expect(isEmpty(result.captureMode)).assertTrue();
        expect(isEmpty(result.burstNumber)).assertTrue();
        expect(isEmpty(result.isFrontCamera)).assertTrue();
        expect(isEmpty(result.rollAngle)).assertTrue();
        expect(isEmpty(result.pitchAngle)).assertTrue();
        expect(isEmpty(result.physicalAperture)).assertTrue();
        expect(isEmpty(result.focusMode)).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' createInstance error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_001
     * @tc.desc       Metadata -exifMetadata -getProperties -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties(null).then((data) => {
            console.info(TAG, testName, 'Get properties ', JSON.stringify(data));
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName,
              `Get properties failed error.code is ${error.code}, error.message is ${error.message}`);
            expect().assertFail();
          });
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'exifMetadata getProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_002
     * @tc.desc       Metadata -exifMetadata -getProperties -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_GET_PROPERTIES_TEST_002';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties(undefined).then((data) => {
            console.info(TAG, testName, 'Get properties ', JSON.stringify(data));
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName,
              `Get properties failed error.code is ${error.code}, error.message is ${error.message}`);
            expect().assertFail();
          });
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'exifMetadata getProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_001
     * @tc.desc       Metadata -exifMetadata -setProperties -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.setProperties(null).then((data) => {
            console.info(TAG, testName, 'Get properties ', JSON.stringify(data));
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName,
              `Get properties failed error.code is ${error.code}, error.message is ${error.message}`);
            expect().assertFail();
          });
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, ' exifMetadata setProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_002
     * @tc.desc       Metadata -exifMetadata -setProperties -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_002';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.setProperties(undefined).then((data) => {
            console.info(TAG, testName, 'Get properties ', JSON.stringify(data));
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName,
              `Get properties failed error.code is ${error.code}, error.message is ${error.message}`);
            expect().assertFail();
          });
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, ' exifMetadata setProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_003
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_003
     * @tc.desc       Metadata -exifMetadata -setProperties -7600202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_SET_PROPERTIES_TEST_003';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.setProperties({ "abc": "abc" });
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'exifMetadata setProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_CLONE_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_CLONE_TEST_001
     * @tc.desc       Metadata -exifMetadata -clone
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_CLONE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_CLONE_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          let New_metaData: image.ExifMetadata = await metaData.exifMetadata.clone();
          console.info(TAG, testName, 'exifMetadata clone Success.');
          expect(isEmpty(New_metaData)).assertFalse();
          expect(New_metaData.newSubfileType).assertEqual(metaData.exifMetadata.newSubfileType);
          expect(New_metaData.subfileType).assertEqual(metaData.exifMetadata.subfileType);
          expect(New_metaData.imageWidth).assertEqual(metaData.exifMetadata.imageWidth);
          expect(New_metaData.imageLength).assertEqual(metaData.exifMetadata.imageLength);
          expect(New_metaData.bitsPerSample).assertEqual(metaData.exifMetadata.bitsPerSample);
          expect(New_metaData.compression).assertEqual(metaData.exifMetadata.compression);
          expect(New_metaData.photometricInterpretation).assertEqual(metaData.exifMetadata.photometricInterpretation);
          expect(New_metaData.imageDescription).assertEqual(metaData.exifMetadata.imageDescription);
          expect(New_metaData.make).assertEqual(metaData.exifMetadata.make);
          expect(New_metaData.model).assertEqual(metaData.exifMetadata.model);
          expect(isEmpty(New_metaData)).assertFalse();
          expect(New_metaData.stripOffsets).assertEqual(metaData.exifMetadata.stripOffsets);
          expect(New_metaData.orientation).assertEqual(metaData.exifMetadata.orientation);
          expect(New_metaData.samplesPerPixel).assertEqual(metaData.exifMetadata.samplesPerPixel);
          expect(New_metaData.rowsPerStrip).assertEqual(metaData.exifMetadata.rowsPerStrip);
          expect(New_metaData.stripByteCounts).assertEqual(metaData.exifMetadata.stripByteCounts);
          expect(New_metaData.xResolution).assertEqual(metaData.exifMetadata.xResolution);
          expect(New_metaData.yResolution).assertEqual(metaData.exifMetadata.yResolution);
          expect(New_metaData.planarConfiguration).assertEqual(metaData.exifMetadata.planarConfiguration);
          expect(New_metaData.resolutionUnit).assertEqual(metaData.exifMetadata.resolutionUnit);
          expect(New_metaData.transferFunction).assertEqual(metaData.exifMetadata.transferFunction);
          expect(isEmpty(New_metaData)).assertFalse();
          expect(New_metaData.software).assertEqual(metaData.exifMetadata.software);
          expect(New_metaData.dateTime).assertEqual(metaData.exifMetadata.dateTime);
          expect(New_metaData.artist).assertEqual(metaData.exifMetadata.artist);
          expect(New_metaData.whitePoint).assertEqual(metaData.exifMetadata.whitePoint);
          expect(New_metaData.primaryChromaticities).assertEqual(metaData.exifMetadata.primaryChromaticities);
          expect(New_metaData.photoMode).assertEqual(metaData.exifMetadata.photoMode);
          expect(New_metaData.yCbCrCoefficients).assertEqual(metaData.exifMetadata.yCbCrCoefficients);
          expect(New_metaData.yCbCrSubSampling).assertEqual(metaData.exifMetadata.yCbCrSubSampling);
          expect(New_metaData.yCbCrPositioning).assertEqual(metaData.exifMetadata.yCbCrPositioning);
          expect(New_metaData.referenceBlackWhite).assertEqual(metaData.exifMetadata.referenceBlackWhite);
          expect(New_metaData.copyright).assertEqual(metaData.exifMetadata.copyright);
          expect(New_metaData.exposureTime).assertEqual(metaData.exifMetadata.exposureTime);
          expect(New_metaData.fNumber).assertEqual(metaData.exifMetadata.fNumber);
          expect(New_metaData.exposureProgram).assertEqual(metaData.exifMetadata.exposureProgram);
          expect(New_metaData.spectralSensitivity).assertEqual(metaData.exifMetadata.spectralSensitivity);
          expect(New_metaData.gpsVersionID).assertEqual(metaData.exifMetadata.gpsVersionID);
          expect(New_metaData.gpsLatitudeRef).assertEqual(metaData.exifMetadata.gpsLatitudeRef);
          expect(New_metaData.gpsLatitude).assertEqual(metaData.exifMetadata.gpsLatitude);
          expect(New_metaData.gpsLongitudeRef).assertEqual(metaData.exifMetadata.gpsLongitudeRef);
          expect(New_metaData.gpsLongitude).assertEqual(metaData.exifMetadata.gpsLongitude);
          expect(New_metaData.gpsAltitudeRef).assertEqual(metaData.exifMetadata.gpsAltitudeRef);
          expect(New_metaData.gpsAltitude).assertEqual(metaData.exifMetadata.gpsAltitude);
          expect(New_metaData.gpsTimestamp).assertEqual(metaData.exifMetadata.gpsTimestamp);
          expect(New_metaData.gpsSatellites).assertEqual(metaData.exifMetadata.gpsSatellites);
          expect(New_metaData.gpsStatus).assertEqual(metaData.exifMetadata.gpsStatus);
          expect(New_metaData.gpsMeasureMode).assertEqual(metaData.exifMetadata.gpsMeasureMode);
          expect(New_metaData.gpsDop).assertEqual(metaData.exifMetadata.gpsDop);
          expect(New_metaData.gpsSpeedRef).assertEqual(metaData.exifMetadata.gpsSpeedRef);
          expect(New_metaData.gpsSpeed).assertEqual(metaData.exifMetadata.gpsSpeed);
          expect(New_metaData.gpsTrackRef).assertEqual(metaData.exifMetadata.gpsTrackRef);
          expect(New_metaData.gpsTrack).assertEqual(metaData.exifMetadata.gpsTrack);
          expect(New_metaData.gpsImgDirectionRef).assertEqual(metaData.exifMetadata.gpsImgDirectionRef);
          expect(New_metaData.gpsImgDirection).assertEqual(metaData.exifMetadata.gpsImgDirection);
          expect(New_metaData.gpsMapDatum).assertEqual(metaData.exifMetadata.gpsMapDatum);
          expect(New_metaData.gpsDestLatitudeRef).assertEqual(metaData.exifMetadata.gpsDestLatitudeRef);
          expect(New_metaData.gpsDestLatitude).assertEqual(metaData.exifMetadata.gpsDestLatitude);
          expect(New_metaData.gpsDestLongitudeRef).assertEqual(metaData.exifMetadata.gpsDestLongitudeRef);
          expect(New_metaData.gpsDestLongitude).assertEqual(metaData.exifMetadata.gpsDestLongitude);
          expect(New_metaData.gpsDestBearingRef).assertEqual(metaData.exifMetadata.gpsDestBearingRef);
          expect(New_metaData.gpsDestBearing).assertEqual(metaData.exifMetadata.gpsDestBearing);
          expect(New_metaData.gpsDestDistanceRef).assertEqual(metaData.exifMetadata.gpsDestDistanceRef);
          expect(New_metaData.gpsDestDistance).assertEqual(metaData.exifMetadata.gpsDestDistance);
          expect(New_metaData.gpsProcessingMethod).assertEqual(metaData.exifMetadata.gpsProcessingMethod);
          expect(New_metaData.gpsAreaInformation).assertEqual(metaData.exifMetadata.gpsAreaInformation);
          expect(New_metaData.gpsDateStamp).assertEqual(metaData.exifMetadata.gpsDateStamp);
          expect(New_metaData.gpsDifferential).assertEqual(metaData.exifMetadata.gpsDifferential);
          expect(New_metaData.gpsHPositioningError).assertEqual(metaData.exifMetadata.gpsHPositioningError);
          expect(New_metaData.isoSpeedRatings).assertEqual(metaData.exifMetadata.isoSpeedRatings);
          expect(New_metaData.photographicSensitivity).assertEqual(metaData.exifMetadata.photographicSensitivity);
          expect(New_metaData.oecf).assertEqual(metaData.exifMetadata.oecf);
          expect(New_metaData.sensitivityType).assertEqual(metaData.exifMetadata.sensitivityType);
          expect(New_metaData.standardOutputSensitivity).assertEqual(metaData.exifMetadata.standardOutputSensitivity);
          expect(New_metaData.recommendedExposureIndex).assertEqual(metaData.exifMetadata.recommendedExposureIndex);
          expect(New_metaData.isoSpeedLatitudeyyy).assertEqual(metaData.exifMetadata.isoSpeedLatitudeyyy);
          expect(New_metaData.isoSpeedLatitudezzz).assertEqual(metaData.exifMetadata.isoSpeedLatitudezzz);
          expect(New_metaData.exifVersion).assertEqual(metaData.exifMetadata.exifVersion);
          expect(New_metaData.dateTimeOriginal).assertEqual(metaData.exifMetadata.dateTimeOriginal);
          expect(New_metaData.dateTimeDigitized).assertEqual(metaData.exifMetadata.dateTimeDigitized);
          expect(New_metaData.offsetTime).assertEqual(metaData.exifMetadata.offsetTime);
          expect(New_metaData.offsetTimeOriginal).assertEqual(metaData.exifMetadata.offsetTimeOriginal);
          expect(New_metaData.offsetTimeDigitized).assertEqual(metaData.exifMetadata.offsetTimeDigitized);
          expect(New_metaData.componentsConfiguration).assertEqual(metaData.exifMetadata.componentsConfiguration);
          expect(New_metaData.compressedBitsPerPixel).assertEqual(metaData.exifMetadata.compressedBitsPerPixel);
          expect(New_metaData.shutterSpeedValue).assertEqual(metaData.exifMetadata.shutterSpeedValue);
          expect(New_metaData.apertureValue).assertEqual(metaData.exifMetadata.apertureValue);
          expect(New_metaData.brightnessValue).assertEqual(metaData.exifMetadata.brightnessValue);
          expect(New_metaData.exposureBiasValue).assertEqual(metaData.exifMetadata.exposureBiasValue);
          expect(New_metaData.maxApertureValue).assertEqual(metaData.exifMetadata.maxApertureValue);
          expect(New_metaData.subjectDistance).assertEqual(metaData.exifMetadata.subjectDistance);
          expect(New_metaData.meteringMode).assertEqual(metaData.exifMetadata.meteringMode);
          expect(New_metaData.lightSource).assertEqual(metaData.exifMetadata.lightSource);
          expect(New_metaData.flash).assertEqual(metaData.exifMetadata.flash);
          expect(New_metaData.focalLength).assertEqual(metaData.exifMetadata.focalLength);
          expect(New_metaData.subjectArea).assertEqual(metaData.exifMetadata.subjectArea);
          expect(New_metaData.makerNote).assertEqual(metaData.exifMetadata.makerNote);
          expect(New_metaData.userComment).assertEqual(metaData.exifMetadata.userComment);
          expect(New_metaData.subsecTime).assertEqual(metaData.exifMetadata.subsecTime);
          expect(New_metaData.subsecTimeOriginal).assertEqual(metaData.exifMetadata.subsecTimeOriginal);
          expect(New_metaData.subsecTimeDigitized).assertEqual(metaData.exifMetadata.subsecTimeDigitized);
          expect(New_metaData.flashpixVersion).assertEqual(metaData.exifMetadata.flashpixVersion);
          expect(New_metaData.colorSpace).assertEqual(metaData.exifMetadata.colorSpace);
          expect(New_metaData.pixelXDimension).assertEqual(metaData.exifMetadata.pixelXDimension);
          expect(New_metaData.pixelYDimension).assertEqual(metaData.exifMetadata.pixelYDimension);
          expect(New_metaData.relatedSoundFile).assertEqual(metaData.exifMetadata.relatedSoundFile);
          expect(New_metaData.flashEnergy).assertEqual(metaData.exifMetadata.flashEnergy);
          expect(New_metaData.spatialFrequencyResponse).assertEqual(metaData.exifMetadata.spatialFrequencyResponse);
          expect(New_metaData.focalPlaneXResolution).assertEqual(metaData.exifMetadata.focalPlaneXResolution);
          expect(New_metaData.focalPlaneYResolution).assertEqual(metaData.exifMetadata.focalPlaneYResolution);
          expect(New_metaData.focalPlaneResolutionUnit).assertEqual(metaData.exifMetadata.focalPlaneResolutionUnit);
          expect(New_metaData.subjectLocation).assertEqual(metaData.exifMetadata.subjectLocation);
          expect(New_metaData.exposureIndex).assertEqual(metaData.exifMetadata.exposureIndex);
          expect(New_metaData.sensingMethod).assertEqual(metaData.exifMetadata.sensingMethod);
          expect(New_metaData.fileSource).assertEqual(metaData.exifMetadata.fileSource);
          expect(New_metaData.sceneType).assertEqual(metaData.exifMetadata.sceneType);
          expect(New_metaData.cfaPattern).assertEqual(metaData.exifMetadata.cfaPattern);
          expect(New_metaData.customRendered).assertEqual(metaData.exifMetadata.customRendered);
          expect(New_metaData.exposureMode).assertEqual(metaData.exifMetadata.exposureMode);
          expect(New_metaData.whiteBalance).assertEqual(metaData.exifMetadata.whiteBalance);
          expect(New_metaData.digitalZoomRatio).assertEqual(metaData.exifMetadata.digitalZoomRatio);
          expect(New_metaData.focalLengthIn35mmFilm).assertEqual(metaData.exifMetadata.focalLengthIn35mmFilm);
          expect(New_metaData.sceneCaptureType).assertEqual(metaData.exifMetadata.sceneCaptureType);
          expect(New_metaData.gainControl).assertEqual(metaData.exifMetadata.gainControl);
          expect(New_metaData.contrast).assertEqual(metaData.exifMetadata.contrast);
          expect(New_metaData.saturation).assertEqual(metaData.exifMetadata.saturation);
          expect(New_metaData.sharpness).assertEqual(metaData.exifMetadata.sharpness);
          expect(New_metaData.deviceSettingDescription).assertEqual(metaData.exifMetadata.deviceSettingDescription);
          expect(New_metaData.subjectDistanceRange).assertEqual(metaData.exifMetadata.subjectDistanceRange);
          expect(New_metaData.imageUniqueId).assertEqual(metaData.exifMetadata.imageUniqueId);
          expect(New_metaData.cameraOwnerName).assertEqual(metaData.exifMetadata.cameraOwnerName);
          expect(New_metaData.bodySerialNumber).assertEqual(metaData.exifMetadata.bodySerialNumber);
          expect(New_metaData.lensSpecification).assertEqual(metaData.exifMetadata.lensSpecification);
          expect(New_metaData.lensMake).assertEqual(metaData.exifMetadata.lensMake);
          expect(New_metaData.lensModel).assertEqual(metaData.exifMetadata.lensModel);
          expect(New_metaData.lensSerialNumber).assertEqual(metaData.exifMetadata.lensSerialNumber);
          expect(New_metaData.compositeImage).assertEqual(metaData.exifMetadata.compositeImage);
          expect(New_metaData.sourceImageNumberOfCompositeImage)
            .assertEqual(metaData.exifMetadata.sourceImageNumberOfCompositeImage);
          expect(New_metaData.sourceExposureTimesOfCompositeImage)
            .assertEqual(metaData.exifMetadata.sourceExposureTimesOfCompositeImage);
          expect(New_metaData.gamma).assertEqual(metaData.exifMetadata.gamma);
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, ' exifMetadata clone error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_001
     * @tc.desc       Metadata -exifMetadata -setBlob -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.setBlob(null);
          console.info(TAG, testName, 'exifMetadata setBlob Success.');
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, ' exifMetadata setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600206);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_002
     * @tc.desc       Metadata -exifMetadata -setBlob -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_METADATA_SET_BLOB_TEST_002';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.setBlob(undefined);
          console.info(TAG, testName, 'exifMetadata setBlob Success.');
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
        done();
      } catch (error) {
        console.error(TAG, testName, ' exifMetadata setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600206);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_001
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -setProperties -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties(null).then(async () => {
            console.info(TAG, testName, 'Set properties success.');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName,
              `Failed to set metadata Properties. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          })
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'makerNoteHuaweiMetadata setProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_002
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -setProperties -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_PROPERTIES_TEST_002';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties(undefined);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'makerNoteHuaweiMetadata setProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_001
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -setBlob -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setBlob(undefined);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'makerNoteHuaweiMetadata setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600206);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_002
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -setBlob -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_SET_BLOB_TEST_002';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setBlob(null);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'makerNoteHuaweiMetadata setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600206);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_CLONE_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_CLONE_TEST_001
     * @tc.desc       Metadata -exifMetadata -clone
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_CLONE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_CLONE_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          let New_metaData: image.MakerNoteHuaweiMetadata = await metaData.makerNoteHuaweiMetadata.clone();
          console.info(TAG, testName, 'makerNoteHuaweiMetadata clone Success.');
          expect(isEmpty(New_metaData)).assertFalse();
          expect(New_metaData.isXmageSupported).assertEqual(metaData.makerNoteHuaweiMetadata.isXmageSupported);
          expect(New_metaData.xmageWatermarkMode).assertEqual(metaData.makerNoteHuaweiMetadata.xmageWatermarkMode);
          expect(New_metaData.xmageLeft).assertEqual(metaData.makerNoteHuaweiMetadata.xmageLeft);
          expect(New_metaData.xmageTop).assertEqual(metaData.makerNoteHuaweiMetadata.xmageTop);
          expect(New_metaData.xmageRight).assertEqual(metaData.makerNoteHuaweiMetadata.xmageRight);
          expect(New_metaData.xmageBottom).assertEqual(metaData.makerNoteHuaweiMetadata.xmageBottom);
          expect(New_metaData.xmageColorMode).assertEqual(metaData.makerNoteHuaweiMetadata.xmageColorMode);
          expect(New_metaData.isCloudEnhanced).assertEqual(metaData.makerNoteHuaweiMetadata.isCloudEnhanced);
          expect(New_metaData.cloudLabel).assertEqual(metaData.makerNoteHuaweiMetadata.cloudLabel);
          expect(New_metaData.isWindSnapshot).assertEqual(metaData.makerNoteHuaweiMetadata.isWindSnapshot);
          expect(isEmpty(New_metaData)).assertFalse();
          expect(New_metaData.sceneVersion).assertEqual(metaData.makerNoteHuaweiMetadata.sceneVersion);
          expect(New_metaData.sceneFoodConfidence).assertEqual(metaData.makerNoteHuaweiMetadata.sceneFoodConfidence);
          expect(New_metaData.sceneBlueSkyConfidence)
            .assertEqual(metaData.makerNoteHuaweiMetadata.sceneBlueSkyConfidence);
          expect(New_metaData.sceneStageConfidence).assertEqual(metaData.makerNoteHuaweiMetadata.sceneStageConfidence);
          expect(New_metaData.sceneGreenPlantConfidence)
            .assertEqual(metaData.makerNoteHuaweiMetadata.sceneGreenPlantConfidence);
          expect(New_metaData.sceneBeachConfidence).assertEqual(metaData.makerNoteHuaweiMetadata.sceneBeachConfidence);
          expect(New_metaData.sceneSnowConfidence).assertEqual(metaData.makerNoteHuaweiMetadata.sceneSnowConfidence);
          expect(New_metaData.sceneSunsetConfidence)
            .assertEqual(metaData.makerNoteHuaweiMetadata.sceneSunsetConfidence);
          expect(New_metaData.sceneFlowersConfidence)
            .assertEqual(metaData.makerNoteHuaweiMetadata.sceneFlowersConfidence);
          expect(New_metaData.sceneNightConfidence).assertEqual(metaData.makerNoteHuaweiMetadata.sceneNightConfidence);
          expect(New_metaData.sceneTextConfidence).assertEqual(metaData.makerNoteHuaweiMetadata.sceneTextConfidence);
          expect(New_metaData.faceCount).assertEqual(metaData.makerNoteHuaweiMetadata.faceCount);
          expect(New_metaData.faceConfidences).assertEqual(metaData.makerNoteHuaweiMetadata.faceConfidences);
          expect(New_metaData.faceSmileScores).assertEqual(metaData.makerNoteHuaweiMetadata.faceSmileScores);
          expect(New_metaData.captureMode).assertEqual(metaData.makerNoteHuaweiMetadata.captureMode);
          expect(New_metaData.burstNumber).assertEqual(metaData.makerNoteHuaweiMetadata.burstNumber);
          expect(New_metaData.isFrontCamera).assertEqual(metaData.makerNoteHuaweiMetadata.isFrontCamera);
          expect(New_metaData.rollAngle).assertEqual(metaData.makerNoteHuaweiMetadata.rollAngle);
          expect(New_metaData.pitchAngle).assertEqual(metaData.makerNoteHuaweiMetadata.pitchAngle);
          expect(New_metaData.physicalAperture).assertEqual(metaData.makerNoteHuaweiMetadata.physicalAperture);
          expect(New_metaData.focusMode).assertEqual(metaData.makerNoteHuaweiMetadata.focusMode);
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, ' makerNoteHuaweiMetadata clone error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    });

    /**
     * @tc.number     SUB_IMAGE_SOURCE_HEIFS_METADATA_SET_BLOB_TEST_001
     * @tc.name       SUB_IMAGE_SOURCE_HEIFS_METADATA_SET_BLOB_TEST_001
     * @tc.desc       heifsMetadata -setBlob -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('IMAGE_HEIFS_METADATA_GET_PROPERTIES_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_GET_PROPERTIES_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSourceApi = image.createImageSource(array, ops);
        let imageData = await imageSourceApi.readImageMetadata();
        console.info(TAG, testName, 'metadataType');
        await imageData.heifsMetadata?.setBlob(null);
        console.info(TAG, testName, 'heifsMetadata success setBlob');
        expect(isEmpty(imageData)).assertFalse();
        await imageSourceApi?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, ' heifsMetadata setBlob error', error.message, error.code);
        await imageSourceApi?.release();
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     SUB_IMAGE_SOURCE_HEIFS_METADATA_SET_BLOB_TEST_002
     * @tc.name       SUB_IMAGE_SOURCE_HEIFS_METADATA_SET_BLOB_TEST_002
     * @tc.desc       heifsMetadata -setBlob -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_SOURCE_HEIFS_METADATA_SET_BLOB_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_HEIFS_METADATA_SET_BLOB_TEST_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSourceApi = image.createImageSource(array, ops);
        let imageData = await imageSourceApi.readImageMetadata();
        console.info(TAG, testName, 'metadataType');
        await imageData.heifsMetadata?.setBlob(undefined);
        console.info(TAG, testName, 'heifsMetadata success setBlob');
        expect(isEmpty(imageData)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, ' heifsMetadata setBlob error', error.message, error.code);
        await imageSourceApi?.release();
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number     SUB_IMAGE_SOURCE_HEIFS_METADATA_CLONE_TEST_001
     * @tc.name       SUB_IMAGE_SOURCE_HEIFS_METADATA_CLONE_TEST_001
     * @tc.desc       heifsMetadata -clone
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_SOURCE_HEIFS_METADATA_CLONE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_HEIFS_METADATA_CLONE_TEST_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSourceApi = image.createImageSource(array, ops);
        let imageData = await imageSourceApi.readImageMetadata()
        console.info(TAG, testName, 'metadataType',json.stringify(imageData.heifsMetadata))
        let result:image.HeifsMetadata|undefined= await imageData.heifsMetadata?.clone()
        console.info(TAG, testName, 'heifsMetadata success setBlob');
        expect(result?.heifsDelayTime).assertEqual(imageData.heifsMetadata?.heifsDelayTime);
        done();
      } catch (error) {
        console.error(TAG, testName, ' heifsMetadata setBlob error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        imageSourceApi?.release();
        done();
      }
    });
  })
}