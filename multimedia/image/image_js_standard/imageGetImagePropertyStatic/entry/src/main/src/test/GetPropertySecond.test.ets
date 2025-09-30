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
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';

const DATE_TIME: image.PropertyKey = image.PropertyKey.DATE_TIME;
const GPS_TIME_STAMP: image.PropertyKey = image.PropertyKey.GPS_TIME_STAMP;
const GPS_DATE_STAMP: image.PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
const IMAGE_DESCRIPTION: image.PropertyKey = image.PropertyKey.IMAGE_DESCRIPTION;
const MAKE: image.PropertyKey = image.PropertyKey.MAKE;
const MODEL: image.PropertyKey = image.PropertyKey.MODEL;
const SENSITIVITY_TYPE: image.PropertyKey = image.PropertyKey.SENSITIVITY_TYPE;
const RECOMMENDED_EXPOSURE_INDEX: image.PropertyKey = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
const ISO_SPEED: image.PropertyKey = image.PropertyKey.ISO_SPEED;
const APERTURE_VALUE: image.PropertyKey = image.PropertyKey.APERTURE_VALUE;
const EXPOSURE_BIAS_VALUE: image.PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
const METERING_MODE: image.PropertyKey = image.PropertyKey.METERING_MODE;
const LIGHT_SOURCE: image.PropertyKey = image.PropertyKey.LIGHT_SOURCE;
const FLASH: image.PropertyKey = image.PropertyKey.FLASH;
const FOCAL_LENGTH: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH;
const USER_COMMENT: image.PropertyKey = image.PropertyKey.USER_COMMENT;
const PIXEL_X_DIMENSION: image.PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
const PIXEL_Y_DIMENSION: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
const WHITE_BALANCE: image.PropertyKey = image.PropertyKey.WHITE_BALANCE
const FOCAL_LENGTH_IN_35_MM_FILM: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
const PHOTO_MODE: image.PropertyKey = image.PropertyKey.PHOTO_MODE;
const STANDARD_OUTPUT_SENSITIVITY: image.PropertyKey = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
const CAPTURE_MODE: image.PropertyKey = image.PropertyKey.CAPTURE_MODE;
const PHYSICAL_APERTURE: image.PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
const ROLL_ANGLE: image.PropertyKey = image.PropertyKey.ROLL_ANGLE;
const PITCH_ANGLE: image.PropertyKey = image.PropertyKey.PITCH_ANGLE;
const SCENE_FOOD_CONF: image.PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
const SCENE_STAGE_CONF: image.PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
const SCENE_BLUE_SKY_CONF: image.PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
const SCENE_GREEN_PLANT_CONF: image.PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
const SCENE_BEACH_CONF: image.PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
const SCENE_SNOW_CONF: image.PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
const SCENE_SUNSET_CONF: image.PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
const SCENE_FLOWERS_CONF: image.PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
const SCENE_NIGHT_CONF: image.PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
const SCENE_TEXT_CONF: image.PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
const FACE_COUNT: image.PropertyKey = image.PropertyKey.FACE_COUNT;
const FOCUS_MODE: image.PropertyKey = image.PropertyKey.FOCUS_MODE;

let filePath: string;
let fdNumber: int;
let filesDir: string | undefined;
let globalimageSource: image.ImageSource | undefined = undefined;

const getFd = (fileName: string): int => {
  filePath = filesDir + "/" + fileName;
  console.info("image filePath:" + filePath);
  const file = fs.openSync(filePath);
  fdNumber = file.fd as int;
  return fdNumber;
};

const getImagePropertyPromise = async (
  filename: string,
  done: () => void,
  testNum: string,
  key: image.PropertyKey,
  propsValue: string
) => {
  getFd(filename);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalimageSource = imageSourceApi;
    try {
      let data = await imageSourceApi.getImageProperty(key);
      console.info(`${testNum} ${key} ` + JSON.stringify(data));
      expect(data == propsValue).assertTrue();
      done();
    } catch (error) {
      console.log(`${testNum} error: ` + error);
      expect(false).assertTrue();
      done();
    }
  }
}

const getImagePropertyErr = async (
  done: () => void,
  testNum: string,
  tag: image.PropertyKey
) => {
  getFd("test_hw.jpg");
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalimageSource = imageSourceApi;
    try {
      await imageSourceApi.getImageProperty(tag);
      expect(false).assertTrue();
      done();
    } catch (error: BusinessError) {
      expect(error.code != 0).assertTrue();
      console.log(`${testNum} error msg: ` + error);
      done();
    }
  }
}

export default function imageGetImagePropertySecond() {
  describe("imageGetImagePropertySecond", (): void => {

    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined;
      console.info("beforeAll case");
    });

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(() => {
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });


    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100
      * @tc.desc    getImageProperty(DATE_TIME)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(DATE_TIME)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100", DATE_TIME, "2019:11:15 20:48:30");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200
      * @tc.desc    getImageProperty(GPS_TIME_STAMP)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(GPS_TIME_STAMP)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200",
        GPS_TIME_STAMP, "13:31:27.00");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300
      * @tc.desc    getImageProperty(GPS_DATE_STAMP)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(GPS_DATE_STAMP)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300",
        GPS_DATE_STAMP, "2023:04:13");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400
      * @tc.desc    getImageProperty(IMAGE_DESCRIPTION)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(IMAGE_DESCRIPTION)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400",
        IMAGE_DESCRIPTION, "A gray picture");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500
      * @tc.desc    getImageProperty(MAKE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(MAKE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500", MAKE, "HW");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0600
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0600
      * @tc.desc    getImageProperty(MODEL)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(MODEL)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0600", MODEL, "STK-LX1");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0700
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0700
      * @tc.desc    getImageProperty(SENSITIVITY_TYPE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SENSITIVITY_TYPE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0700",
        SENSITIVITY_TYPE, "Standard output sensitivity (SOS)");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0800
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0800
      * @tc.desc    getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0800",
        RECOMMENDED_EXPOSURE_INDEX, "200");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0900
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0900
      * @tc.desc    getImageProperty(ISO_SPEED)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(ISO_SPEED)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0900", ISO_SPEED, "200");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1000
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1000
      * @tc.desc    getImageProperty(APERTURE_VALUE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(APERTURE_VALUE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1000",
        APERTURE_VALUE, "1.69 EV (f/1.8)");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1100
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1100
      * @tc.desc    getImageProperty(EXPOSURE_BIAS_VALUE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(EXPOSURE_BIAS_VALUE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1100",
        EXPOSURE_BIAS_VALUE, "0.00 EV");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1200
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1200
      * @tc.desc    getImageProperty(METERING_MODE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(METERING_MODE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1200", METERING_MODE, "Pattern");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1300
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1300
      * @tc.desc    getImageProperty(LIGHT_SOURCE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(LIGHT_SOURCE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1300", LIGHT_SOURCE, "Daylight");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1400
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1400
      * @tc.desc    getImageProperty(FLASH)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(FLASH)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1400", FLASH, "Flash fired, auto mode");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1500
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1500
      * @tc.desc    getImageProperty(FOCAL_LENGTH)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(FOCAL_LENGTH)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1500", FOCAL_LENGTH, "4.0 mm");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1600
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1600
      * @tc.desc    getImageProperty(USER_COMMENT)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(USER_COMMENT)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1600", USER_COMMENT, "gray");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1700
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1700
      * @tc.desc    getImageProperty(PIXEL_X_DIMENSION)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(PIXEL_X_DIMENSION)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1700",
        PIXEL_X_DIMENSION, "3456");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1800
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1800
      * @tc.desc    getImageProperty(PIXEL_Y_DIMENSION)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(PIXEL_Y_DIMENSION)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1800",
        PIXEL_Y_DIMENSION, "4608");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1900
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1900
      * @tc.desc    getImageProperty(WHITE_BALANCE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(WHITE_BALANCE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_1900", WHITE_BALANCE, "Auto white balance");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2000
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2000
      * @tc.desc    getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2000",
        FOCAL_LENGTH_IN_35_MM_FILM, "26");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2100
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2100
      * @tc.desc    getImageProperty(ROLL_ANGLE )
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(ROLL_ANGLE )
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2100",
        ROLL_ANGLE, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2200
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2200
      * @tc.desc    getImageProperty(PITCH_ANGLE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(PITCH_ANGLE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2200",
        PITCH_ANGLE, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2300
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2300
      * @tc.desc    getImageProperty(SCENE_FOOD_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_FOOD_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2300",
        SCENE_FOOD_CONF, "71");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2400
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2400
      * @tc.desc    getImageProperty(SCENE_STAGE_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_STAGE_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2400",
        SCENE_STAGE_CONF, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2500
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2500
      * @tc.desc    getImageProperty(SCENE_BLUESKY_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_BLUESKY_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("bluesky.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2500",
        SCENE_BLUE_SKY_CONF, "71");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2600
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2600
      * @tc.desc    getImageProperty(SCENE_GREENPLANT_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_GREENPLANT_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("greenplant.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2600",
        SCENE_GREEN_PLANT_CONF, "98");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2700
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2700
      * @tc.desc    getImageProperty(SCENE_BEACH_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_BEACH_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2700",
        SCENE_BEACH_CONF, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2800
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2800
      * @tc.desc    getImageProperty(SCENE_SNOW_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_SNOW_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("snow.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2800",
        SCENE_SNOW_CONF, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2900
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2900
      * @tc.desc    getImageProperty(SCENE_SUNSET_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_SUNSET_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("sunset.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_2900",
        SCENE_SUNSET_CONF, "78");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3000
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3000
      * @tc.desc    getImageProperty(SCENE_FLOWERS_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_FLOWERS_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("flower.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3000",
        SCENE_FLOWERS_CONF, "100");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3100
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3100
      * @tc.desc    getImageProperty(SCENE_NIGHT_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_NIGHT_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("night.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3100",
        SCENE_NIGHT_CONF, "99");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3200
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3200
      * @tc.desc    getImageProperty(SCENE_TEXT_CONF)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(SCENE_TEXT_CONF)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("text.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3200",
        SCENE_TEXT_CONF, "100");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3300
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3300
      * @tc.desc    getImageProperty(FACE_COUNT)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(FACE_COUNT)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3300",
        FACE_COUNT, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3400
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3400
      * @tc.desc    getImageProperty(FOCUS_MODE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(FOCUS_MODE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3400",
        FOCUS_MODE, "default_exif_value");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3500
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3500
      * @tc.desc    getImageProperty(CAPTURE_MODE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(CAPTURE_MODE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3500",
        CAPTURE_MODE, "0");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3600
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3600
      * @tc.desc    getImageProperty(PHYSICAL_APERTURE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(PHYSICAL_APERTURE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyPromise("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_3600",
        PHYSICAL_APERTURE, "1");
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0100
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0100
      * @tc.desc    getImageProperty(PHOTO_MODE)
      *                 1.create imagesource
      *                 2.set property
      *                 3.call getImageProperty(PHOTO_MODE)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0100", PHOTO_MODE);
    });

    /**
      * @tc.number  SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0200
      * @tc.name    SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0200
      * @tc.desc    getImageProperty(STANDARD_OUTPUT_SENSITIVITY)
      *                1.create imagesource
      *                2.set property
      *                3.call getImageProperty(STANDARD_OUTPUT_SENSITIVITY)
      * @tc.size    MEDIUM
      * @tc.type    Functional
      * @tc.level   Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_STATIC_0200", STANDARD_OUTPUT_SENSITIVITY);
    });
  });
}

