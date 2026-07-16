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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index';
import { camera } from '@kit.CameraKit';

const TAG = "CameraEnumStaticTest";

export default function cameraEnumStaticTest() {
  describe('cameraEnumStaticTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_AUTOMOTIVE_CAMERA_POSITION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_AUTOMOTIVE_CAMERA_POSITION_STATIC_0100
     * @tc.desc   assert all automotive camera position enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_AUTOMOTIVE_CAMERA_POSITION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_OTHER == 0).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_OTHER:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_OTHER}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_FRONT == 1).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_FRONT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_FRONT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_REAR == 2).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_REAR:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_REAR}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_LEFT == 3).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_LEFT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_LEFT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_RIGHT == 4).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_RIGHT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_RIGHT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_OTHER == 5).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_OTHER:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_OTHER}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_LEFT == 6).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_LEFT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_LEFT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_CENTER == 7).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_CENTER:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_CENTER}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_RIGHT == 8).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_RIGHT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_RIGHT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_LEFT == 9).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_LEFT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_LEFT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_CENTER == 10).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_CENTER:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_CENTER}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_RIGHT == 11).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_RIGHT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_RIGHT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_LEFT == 12).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_LEFT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_LEFT}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_CENTER == 13).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_CENTER:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_CENTER}`);
      expect(camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_RIGHT == 14).assertTrue();
      console.info(`${TAG} AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_RIGHT:${camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_RIGHT}`);
      done();
    })
  })
}