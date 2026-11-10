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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs } from '@kit.CoreFileKit';
import { sleep } from "../../../ImageCommon.test";
import { Context } from '@kit.AbilityKit';

const TAG = 'ImageSource.ModifyImagePropertySupp'
let fdNumber: int;

async function getFd(fileName: string) {
  let context: Context = Hypium.get("Context") as Context;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  console.info(TAG, "image case open fd success " + fdNumber);
}

async function getImageSource(path: string): Promise<image.ImageSource | undefined> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  // console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageSourceModifyImagePropertySupp() {
  describe('ImageSourceModifyImagePropertySupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_PropertyKey_0100
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_PropertyKey_0100
     * @tc.desc   modifyImageProperties cover key:normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_PropertyKey_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_PropertyKey_0100';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let keyValues: Array<image.PropertyKey> = [
        image.PropertyKey.IMAGE_LENGTH,
        image.PropertyKey.IMAGE_WIDTH,
        image.PropertyKey.GPS_LATITUDE,
        image.PropertyKey.GPS_LONGITUDE,
        image.PropertyKey.GPS_LATITUDE_REF,
        image.PropertyKey.GPS_LONGITUDE_REF,
        image.PropertyKey.DATE_TIME_ORIGINAL,
        image.PropertyKey.EXPOSURE_TIME,
        image.PropertyKey.SCENE_TYPE,
        image.PropertyKey.ISO_SPEED_RATINGS,
        image.PropertyKey.F_NUMBER,
        image.PropertyKey.DATE_TIME,
        image.PropertyKey.GPS_TIME_STAMP,
        image.PropertyKey.GPS_DATE_STAMP,
        image.PropertyKey.IMAGE_DESCRIPTION,
        image.PropertyKey.MAKE,
        image.PropertyKey.MODEL,
        image.PropertyKey.PHOTO_MODE,
        image.PropertyKey.SENSITIVITY_TYPE,
        image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
        image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
        image.PropertyKey.ISO_SPEED,
        image.PropertyKey.APERTURE_VALUE,
        image.PropertyKey.EXPOSURE_BIAS_VALUE,
        image.PropertyKey.METERING_MODE,
        image.PropertyKey.LIGHT_SOURCE,
        image.PropertyKey.FLASH,
        image.PropertyKey.FOCAL_LENGTH,
        image.PropertyKey.USER_COMMENT,
        image.PropertyKey.PIXEL_X_DIMENSION,
        image.PropertyKey.PIXEL_Y_DIMENSION,
        image.PropertyKey.WHITE_BALANCE,
        image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
        image.PropertyKey.CAPTURE_MODE,
        image.PropertyKey.PHYSICAL_APERTURE,
        image.PropertyKey.ROLL_ANGLE,
        image.PropertyKey.PITCH_ANGLE,
        image.PropertyKey.SCENE_FOOD_CONF,
        image.PropertyKey.SCENE_STAGE_CONF,
        image.PropertyKey.SCENE_BLUE_SKY_CONF,
        image.PropertyKey.SCENE_GREEN_PLANT_CONF,
        image.PropertyKey.SCENE_BEACH_CONF,
        image.PropertyKey.SCENE_SNOW_CONF,
        image.PropertyKey.SCENE_SUNSET_CONF,
        image.PropertyKey.SCENE_FLOWERS_CONF,
        image.PropertyKey.SCENE_NIGHT_CONF,
        image.PropertyKey.SCENE_TEXT_CONF,
        image.PropertyKey.FACE_COUNT,
        image.PropertyKey.FOCUS_MODE,
        image.PropertyKey.COMPRESSION,
        image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
        image.PropertyKey.STRIP_OFFSETS,
        image.PropertyKey.SAMPLES_PER_PIXEL,
        image.PropertyKey.ROWS_PER_STRIP,
        image.PropertyKey.STRIP_BYTE_COUNTS,
        image.PropertyKey.X_RESOLUTION,
        image.PropertyKey.Y_RESOLUTION,
        image.PropertyKey.PLANAR_CONFIGURATION,
        image.PropertyKey.RESOLUTION_UNIT,
        image.PropertyKey.TRANSFER_FUNCTION,
        image.PropertyKey.SOFTWARE,
        image.PropertyKey.ARTIST,
        image.PropertyKey.WHITE_POINT,
        image.PropertyKey.PRIMARY_CHROMATICITIES,
        image.PropertyKey.YCBCR_COEFFICIENTS,
        image.PropertyKey.YCBCR_SUB_SAMPLING,
        image.PropertyKey.YCBCR_POSITIONING,
        image.PropertyKey.REFERENCE_BLACK_WHITE,
        image.PropertyKey.COPYRIGHT,
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT,
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH,
        image.PropertyKey.EXPOSURE_PROGRAM,
        image.PropertyKey.SPECTRAL_SENSITIVITY,
        image.PropertyKey.OECF,
        image.PropertyKey.EXIF_VERSION,
        image.PropertyKey.DATE_TIME_DIGITIZED,
        image.PropertyKey.COMPONENTS_CONFIGURATION,
        image.PropertyKey.SHUTTER_SPEED,
        image.PropertyKey.BRIGHTNESS_VALUE,
        image.PropertyKey.MAX_APERTURE_VALUE,
        image.PropertyKey.SUBJECT_DISTANCE,
        image.PropertyKey.SUBJECT_AREA,
        image.PropertyKey.SUBSEC_TIME,
        image.PropertyKey.SUBSEC_TIME_ORIGINAL,
        image.PropertyKey.SUBSEC_TIME_DIGITIZED,
        image.PropertyKey.FLASHPIX_VERSION,
        image.PropertyKey.COLOR_SPACE,
        image.PropertyKey.RELATED_SOUND_FILE,
        image.PropertyKey.FLASH_ENERGY,
        image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
        image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
        image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        image.PropertyKey.SUBJECT_LOCATION,
        image.PropertyKey.EXPOSURE_INDEX,
        image.PropertyKey.SENSING_METHOD,
        image.PropertyKey.FILE_SOURCE,
        image.PropertyKey.CFA_PATTERN,
        image.PropertyKey.CUSTOM_RENDERED,
        image.PropertyKey.EXPOSURE_MODE,
        image.PropertyKey.DIGITAL_ZOOM_RATIO,
        image.PropertyKey.SCENE_CAPTURE_TYPE,
        image.PropertyKey.GAIN_CONTROL,
        image.PropertyKey.CONTRAST,
        image.PropertyKey.SATURATION,
        image.PropertyKey.SHARPNESS,
        image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
        image.PropertyKey.SUBJECT_DISTANCE_RANGE,
        image.PropertyKey.IMAGE_UNIQUE_ID,
        image.PropertyKey.GPS_VERSION_ID,
        image.PropertyKey.GPS_ALTITUDE_REF,
        image.PropertyKey.GPS_ALTITUDE,
        image.PropertyKey.GPS_SATELLITES,
        image.PropertyKey.GPS_STATUS,
        image.PropertyKey.GPS_MEASURE_MODE,
        image.PropertyKey.GPS_DOP,
        image.PropertyKey.GPS_SPEED_REF,
        image.PropertyKey.GPS_SPEED,
        image.PropertyKey.GPS_TRACK_REF,
        image.PropertyKey.GPS_TRACK,
        image.PropertyKey.GPS_IMG_DIRECTION_REF,
        image.PropertyKey.GPS_IMG_DIRECTION,
        image.PropertyKey.GPS_MAP_DATUM,
        image.PropertyKey.GPS_DEST_LATITUDE_REF,
        image.PropertyKey.GPS_DEST_LATITUDE,
        image.PropertyKey.GPS_DEST_LONGITUDE_REF,
        image.PropertyKey.GPS_DEST_LONGITUDE,
        image.PropertyKey.GPS_DEST_BEARING_REF,
        image.PropertyKey.GPS_DEST_BEARING,
        image.PropertyKey.GPS_DEST_DISTANCE_REF,
        image.PropertyKey.GPS_DEST_DISTANCE,
        image.PropertyKey.GPS_PROCESSING_METHOD,
        image.PropertyKey.GPS_AREA_INFORMATION,
        image.PropertyKey.GPS_DIFFERENTIAL,
        image.PropertyKey.BODY_SERIAL_NUMBER,
        image.PropertyKey.CAMERA_OWNER_NAME,
        image.PropertyKey.COMPOSITE_IMAGE,
        image.PropertyKey.COMPRESSED_BITS_PER_PIXEL,
        image.PropertyKey.DNG_VERSION,
        image.PropertyKey.DEFAULT_CROP_SIZE,
        image.PropertyKey.GAMMA,
        image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
        image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
        image.PropertyKey.LENS_MAKE,
        image.PropertyKey.LENS_MODEL,
        image.PropertyKey.LENS_SERIAL_NUMBER,
        image.PropertyKey.LENS_SPECIFICATION,
        image.PropertyKey.NEW_SUBFILE_TYPE,
        image.PropertyKey.OFFSET_TIME,
        image.PropertyKey.OFFSET_TIME_DIGITIZED,
        image.PropertyKey.OFFSET_TIME_ORIGINAL,
        image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE,
        image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE,
        image.PropertyKey.SUBFILE_TYPE,
        image.PropertyKey.GPS_H_POSITIONING_ERROR,
        image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,
        image.PropertyKey.BURST_NUMBER,
        image.PropertyKey.FACE_CONF,
        image.PropertyKey.FACE_LEYE_CENTER,
        image.PropertyKey.FACE_MOUTH_CENTER,
        image.PropertyKey.FACE_POINTER,
        image.PropertyKey.FACE_RECT,
        image.PropertyKey.FACE_REYE_CENTER,
        image.PropertyKey.FACE_SMILE_SCORE,
        image.PropertyKey.FACE_VERSION,
        image.PropertyKey.FRONT_CAMERA,
        image.PropertyKey.SCENE_POINTER,
        image.PropertyKey.SCENE_VERSION,
        image.PropertyKey.IS_XMAGE_SUPPORTED,
        image.PropertyKey.XMAGE_MODE,
        image.PropertyKey.XMAGE_LEFT,
        image.PropertyKey.XMAGE_TOP,
        image.PropertyKey.XMAGE_RIGHT,
        image.PropertyKey.XMAGE_BOTTOM,
        image.PropertyKey.CLOUD_ENHANCEMENT_MODE,
        image.PropertyKey.WIND_SNAPSHOT_MODE,
        image.PropertyKey.GIF_LOOP_COUNT
      ];
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        for (let keyValue of keyValues) {
          imageSourceApi!.modifyImageProperty(keyValue, '1024')
          let data = imageSourceApi!.getImageProperties(checkKey)
          console.info(TAG,testName,`Image Width and Image Height:${data}`);
          expect(data!=undefined).assertTrue();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0100
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0100
     * @tc.desc   modifyImageProperties cover Record:normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0100';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let keyValues: Record<string, string | null> = {
        "ImageLength": "1024",
        "ImageWidth": "1024",
        "GPSLatitude": "1024",
        "GPSLongitude": "1024",
        "GPSLatitudeRef": "1024",
        "GPSLongitudeRef": "1024",
        "DateTimeOriginal": "1024",
        "ExposureTime": "1024",
        "SceneType": "1024",
        "ISOSpeedRatings": "1024",
        "FNumber": "1024",
        "DateTime": "1024",
        "GPSTimeStamp": "1024",
        "GPSDateStamp": "1024",
        "ImageDescription": "1024",
        "Make": "1024",
        "Model": "1024",
        "PhotoMode": "1024",
        "SensitivityType": "1024",
        "StandardOutputSensitivity": "1024",
        "RecommendedExposureIndex": "1024",
        "ISOSpeed": "1024",
        "ApertureValue": "1024",
        "ExposureBiasValue": "1024",
        "MeteringMode": "1024",
        "LightSource": "1024",
        "Flash": "1024",
        "FocalLength": "1024",
        "UserComment": "1024",
        "PixelXDimension": "1024",
        "PixelYDimension": "1024",
        "WhiteBalance": "1024",
        "FocalLengthIn35mmFilm": "1024",
        "CaptureMode": "1024",
        "PhysicalAperture": "1024",
        "RollAngle": "1024",
        "PitchAngle": "1024",
        "SceneFoodConf": "1024",
        "SceneStageConf": "1024",
        "SceneBlueSkyConf": "1024",
        "SceneGreenPlantConf": "1024",
        "SceneBeachConf": "1024",
        "SceneSnowConf": "1024",
        "SceneSunsetConf": "1024",
        "SceneFlowersConf": "1024",
        "SceneNightConf": "1024",
        "SceneTextConf": "1024",
        "FaceCount": "1024",
        "FocusMode": "1024",
        "Compression": "1024",
        "PhotometricInterpretation": "1024",
        "StripOffsets": "1024",
        "SamplesPerPixel": "1024",
        "RowsPerStrip": "1024",
        "StripByteCounts": "1024",
        "XResolution": "1024",
        "YResolution": "1024",
        "PlanarConfiguration": "1024",
        "ResolutionUnit": "1024",
        "TransferFunction": "1024",
        "Software": "1024",
        "Artist": "1024",
        "WhitePoint": "1024",
        "PrimaryChromaticities": "1024",
        "YCbCrCoefficients": "1024",
        "YCbCrSubSampling": "1024",
        "YCbCrPositioning": "1024",
        "ReferenceBlackWhite": "1024",
        "Copyright": "1024",
        "JPEGInterchangeFormat": "1024",
        "JPEGInterchangeFormatLength": "1024",
        "ExposureProgram": "1024",
        "SpectralSensitivity": "1024",
        "OECF": "1024",
        "ExifVersion": "1024",
        "DateTimeDigitized": "1024",
        "ComponentsConfiguration": "1024",
        "ShutterSpeed": "1024",
        "BrightnessValue": "1024",
        "MaxApertureValue": "1024",
        "SubjectDistance": "1024",
        "SubjectArea": "1024",
        "SubsecTime": "1024",
        "SubsecTimeOriginal": "1024",
        "SubsecTimeDigitized": "1024",
        "FlashpixVersion": "1024",
        "ColorSpace": "1024",
        "RelatedSoundFile": "1024",
        "FlashEnergy": "1024",
        "SpatialFrequencyResponse": "1024",
        "FocalPlaneXResolution": "1024",
        "FocalPlaneYResolution": "1024",
        "FocalPlaneResolutionUnit": "1024",
        "SubjectLocation": "1024",
        "ExposureIndex": "1024",
        "SensingMethod": "1024",
        "FileSource": "1024",
        "CFAPattern": "1024",
        "CustomRendered": "1024",
        "ExposureMode": "1024",
        "DigitalZoomRatio": "1024",
        "SceneCaptureType": "1024",
        "GainControl": "1024",
        "Contrast": "1024",
        "Saturation": "1024",
        "Sharpness": "1024",
        "DeviceSettingDescription": "1024",
        "SubjectDistanceRange": "1024",
        "ImageUniqueID": "1024",
        "GPSVersionID": "1024",
        "GPSAltitudeRef": "1024",
        "GPSAltitude": "1024",
        "GPSSatellites": "1024",
        "GPSStatus": "1024",
        "GPSMeasureMode": "1024",
        "GPSDOP": "1024",
        "GPSSpeedRef": "1024",
        "GPSSpeed": "1024",
        "GPSTrackRef": "1024",
        "GPSTrack": "1024",
        "GPSImgDirectionRef": "1024",
        "GPSImgDirection": "1024",
        "GPSMapDatum": "1024",
        "GPSDestLatitudeRef": "1024",
        "GPSDestLatitude": "1024",
        "GPSDestLongitudeRef": "1024",
        "GPSDestLongitude": "1024",
        "GPSDestBearingRef": "1024",
        "GPSDestBearing": "1024",
        "GPSDestDistanceRef": "1024",
        "GPSDestDistance": "1024",
        "GPSProcessingMethod": "1024",
        "GPSAreaInformation": "1024",
        "GPSDifferential": "1024",
        "BodySerialNumber": "1024",
        "CameraOwnerName": "1024",
        "CompositeImage": "1024",
        "CompressedBitsPerPixel": "1024",
        "DNGVersion": "1024",
        "DefaultCropSize": "1024",
        "Gamma": "1024",
        "ISOSpeedLatitudeYYY": "1024",
        "ISOSpeedLatitudeZZZ": "1024",
        "LensMake": "1024",
        "LensModel": "1024",
        "LensSerialNumber": "1024",
        "LensSpecification": "1024",
        "NewSubfileType": "1024",
        "OffsetTime": "1024",
        "OffsetTimeDigitized": "1024",
        "OffsetTimeOriginal": "1024",
        "SourceExposureTimesOfCompositeImage": "1024",
        "SourceImageNumberOfCompositeImage": "1024",
        "SubfileType": "1024",
        "GPSHPositioningError": "1024",
        "PhotographicSensitivity": "1024",
        "BurstNumber": "1024",
        "FaceConf": "1024",
        "FaceLeyeCenter": "1024",
        "FaceMouthCenter": "1024",
        "FacePointer": "1024",
        "FaceRect": "1024",
        "FaceReyeCenter": "1024",
        "FaceSmileScore": "1024",
        "FaceVersion": "1024",
        "FrontCamera": "1024",
        "ScenePointer": "1024",
        "SceneVersion": "1024",
        "IsXmageSupported": "1024",
        "XmageMode": "1024",
        "XmageLeft": "1024",
        "XmageTop": "1024",
        "XmageRight": "1024",
        "XmageBottom": "1024",
        "CloudEnhancementMode": "1024",
        "WindSnapshotMode": "1024",
        "GifLoopCount": "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi!.modifyImageProperties(keyValues)
        let data = imageSourceApi!.getImageProperties(checkKey)
        console.info(TAG,testName,`Image Width and Image Height:${data}`);
        expect(data!=undefined).assertTrue();
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0200
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0200
     * @tc.desc   modifyImageProperties cover Record:normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_Record_0200';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let keyValues: Record<string, string | null> = {};
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi!.modifyImageProperties(keyValues)
        let data = imageSourceApi!.getImageProperties(checkKey)
        console.info(TAG,testName,`Image Width and Image Height:${data}`);
        expect(data!=undefined).assertTrue();
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })

  })
}