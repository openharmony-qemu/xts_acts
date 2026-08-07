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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import cameraObj from 'libentry.so'
import { driveFn, getPermission, sleep, COMMON_WAIT_DURATION} from '../CameraCommon.test';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = "xts.CameraMetadataOutputNdkTest";

export default function CameraMetadataOutputNdkTest() {

  describe('CameraMetadataOutputNdkTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      console.info(TAG, 'beforeAll case', indexSurfaceId);
      let result = cameraObj.initWithSurface(indexSurfaceId);
      console.info(TAG, result)
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      await sleep(500);
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_TYPE_ENUM_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_TYPE_ENUM_0100
     * @tc.desc     MetadataObjectType - Enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_TYPE_ENUM_0100', Level.LEVEL0, async () => {
      let result = cameraObj.checkMetadataObjectTypeEnumValues();
      console.info(TAG, result);
      expect(result).assertTrue();
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_EMOTION_ENUM_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_EMOTION_ENUM_0100
     * @tc.desc     MetadataObjectEmotionType - Enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_EMOTION_ENUM_0100', Level.LEVEL0, async () => {
      let result = cameraObj.checkMetadataObjectEmotionEnumValues();
      console.info(TAG, result);
      expect(result).assertTrue();
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0100
     * @tc.desc     OH_MetadataOutput_RegisterMetadataObjectExtAvailableCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNullOutput();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });
    
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0200
     * @tc.desc     OH_MetadataOutput_RegisterMetadataObjectExtAvailableCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNullCallback();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0300
     * @tc.desc     OH_MetadataOutput_RegisterMetadataObjectExtAvailableCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackAllNull();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0400
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0400
     * @tc.desc     OH_MetadataOutput_RegisterMetadataObjectExtAvailableCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0400', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0500
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0500
     * @tc.desc     OH_MetadataOutput_RegisterMetadataObjectExtAvailableCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0500', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackDuplicate();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0600
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0600
     * @tc.desc     OH_MetadataOutput_RegisterMetadataObjectExtAvailableCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_CALLBACK_0600', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterAndUnregisterMetadataCallback();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0100
     * @tc.desc     OH_MetadataOutput_UnregisterMetadataObjectExtAvailableCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterMetadataCallbackNullOutput();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0200
     * @tc.desc     OH_MetadataOutput_UnregisterMetadataObjectExtAvailableCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterMetadataCallbackNullCallback();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0300
     * @tc.desc     OH_MetadataOutput_UnregisterMetadataObjectExtAvailableCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterMetadataCallbackNotRegistered();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0400
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0400
     * @tc.desc     OH_MetadataOutput_UnregisterMetadataObjectExtAvailableCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0400', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterMetadataCallbackRegistered();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0500
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0500
     * @tc.desc     OH_MetadataOutput_UnregisterMetadataObjectExtAvailableCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0500', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackTriggerAfterUnregister();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0600
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0600
     * @tc.desc     OH_MetadataOutput_UnregisterMetadataObjectExtAvailableCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_CALLBACK_0600', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterMetadataCallbackTwice();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0100
     * @tc.desc     OH_MetadataOutput_RegisterErrorExtCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterErrorCallbackNullOutput();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0200
     * @tc.desc     OH_MetadataOutput_RegisterErrorExtCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterErrorCallbackNullCallback();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0300
     * @tc.desc     OH_MetadataOutput_RegisterErrorExtCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterErrorCallbackAllNull();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0400
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0400
     * @tc.desc     OH_MetadataOutput_RegisterErrorExtCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_REGISTER_METADATA_ERROR_CALLBACK_0400', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterErrorCallbackNormal();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0100
     * @tc.desc     OH_MetadataOutput_UnregisterErrorExtCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterErrorCallbackNullOutput();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0200
     * @tc.desc     OH_MetadataOutput_UnregisterErrorExtCallback - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterErrorCallbackNullCallback();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0300
     * @tc.desc     OH_MetadataOutput_UnregisterErrorExtCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterErrorCallbackNotRegistered();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0400
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0400
     * @tc.desc     OH_MetadataOutput_UnregisterErrorExtCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0400', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterErrorCallbackRegistered();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0500
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0500
     * @tc.desc     OH_MetadataOutput_UnregisterErrorExtCallback - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNREGISTER_METADATA_ERROR_CALLBACK_0500', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnregisterErrorCallbackTwice();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0100
     * @tc.desc     OH_MetadataOutput_IsLockMetadataObjectTrackingSupported - boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestCheckLockTrackingSupportReturnValue();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0200
     * @tc.desc     OH_MetadataOutput_IsLockMetadataObjectTrackingSupported - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestLockWhenTrackingNotSupported();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0100
     * @tc.desc     OH_MetadataOutput_LockMetadataObjectTracking - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestLockTrackingNullMetadataOutput();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0200
     * @tc.desc     OH_MetadataOutput_LockMetadataObjectTracking - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestLockTrackingNullPoint();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0300
     * @tc.desc     OH_MetadataOutput_LockMetadataObjectTracking - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestLockTrackingInvalidPoint();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0400
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0400
     * @tc.desc     OH_MetadataOutput_LockMetadataObjectTracking - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0400', Level.LEVEL0, async () => {
      let result = cameraObj.TestLockTrackingValidPoint();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0500
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0500
     * @tc.desc     OH_MetadataOutput_LockMetadataObjectTracking - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0500', Level.LEVEL0, async () => {
      let result = cameraObj.TestLockTrackingWithoutSessionConfig();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0100
     * @tc.desc     OH_MetadataOutput_UnlockMetadataObjectTracking - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnlockTrackingNullMetadataOutput();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0200
     * @tc.desc     OH_MetadataOutput_UnlockMetadataObjectTracking - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnlockTrackingNormal();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0300
     * @tc.desc     OH_MetadataOutput_UnlockMetadataObjectTracking - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnlockThenLock();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0400
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0400
     * @tc.desc     OH_MetadataOutput_UnlockMetadataObjectTracking - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0400', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnlockWhenNotLocked();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0500
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0500
     * @tc.desc     OH_MetadataOutput_UnlockMetadataObjectTracking - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_UNLOCK_METADATA_OBJECT_TRACKING_0500', Level.LEVEL0, async () => {
      let result = cameraObj.TestUnlockWithoutSessionConfig();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0200
     * @tc.desc     OH_MetadataOutput_IsLockMetadataObjectTrackingSupported - boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_IS_LOCK_METADATA_OBJECT_TRACKING_SUPPORTED_0200', Level.LEVEL0, async () => {
      let isSupported = cameraObj.TestCheckLockTrackingSupportReturnBoolean();
      console.info(TAG, "TestCheckLockTrackingSupportReturnBoolean isSupported:", isSupported);
      expect(isSupported == true || isSupported == false).assertTrue();
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_IS_LOCK_FOCUS_TRACKED_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_IS_LOCK_FOCUS_TRACKED_0100
     * @tc.desc     OH_MetadataObjectExt_IsLockFocusTracked - boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_IS_LOCK_FOCUS_TRACKED_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let isTracked = cameraObj.TestIsLockFocusTracked();
      console.info(TAG, "TestIsLockFocusTracked isTracked:", isTracked);
      expect(isTracked == true || isTracked == false).assertTrue();
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_YAW_ANGLE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_YAW_ANGLE_0100
     * @tc.desc     OH_MetadataObjectExt_GetYawAngle - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_YAW_ANGLE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetYawAngle();
      console.info(TAG, "TestGetYawAngle ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_TIMESTAMP_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_TIMESTAMP_0100
     * @tc.desc     OH_MetadataObjectExt_GetTimestamp - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_TIMESTAMP_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetTimestamp();
      console.info(TAG, "TestGetTimestamp ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_ROLL_ANGLE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_ROLL_ANGLE_0100
     * @tc.desc     OH_MetadataObjectExt_GetRollAngle - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_ROLL_ANGLE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetRollAngle();
      console.info(TAG, "TestGetRollAngle ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_RIGHT_EYE_BOUNDING_BOX_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_RIGHT_EYE_BOUNDING_BOX_0100
     * @tc.desc     OH_MetadataObjectExt_GetRightEyeBoundingBox - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_RIGHT_EYE_BOUNDING_BOX_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetRightEyeBoundingBox();
      console.info(TAG, "TestGetRightEyeBoundingBox ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_PITCH_ANGLE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_PITCH_ANGLE_0100
     * @tc.desc     OH_MetadataObjectExt_GetPitchAngle - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_PITCH_ANGLE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetPitchAngle();
      console.info(TAG, "TestGetPitchAngle ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_METADATA_OBJECT_TYPE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_METADATA_OBJECT_TYPE_0100
     * @tc.desc     OH_MetadataObjectExt_GetMetadataObjectType - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_METADATA_OBJECT_TYPE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetMetadataObjectType();
      console.info(TAG, "TestGetMetadataObjectType ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_LEFT_EYE_BOUNDING_BOX_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_LEFT_EYE_BOUNDING_BOX_0100
     * @tc.desc     OH_MetadataObjectExt_GetLeftEyeBoundingBox - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_LEFT_EYE_BOUNDING_BOX_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetLeftEyeBoundingBox();
      console.info(TAG, "TestGetLeftEyeBoundingBox ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_EMOTION_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_EMOTION_0100
     * @tc.desc     OH_MetadataObjectExt_GetEmotion - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_EMOTION_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetEmotion();
      console.info(TAG, "TestGetEmotion ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_GET_BOUNDING_BOX_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_GET_BOUNDING_BOX_0100
     * @tc.desc     OH_MetadataObjectExt_GetBoundingBox - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_GET_BOUNDING_BOX_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestGetBoundingBox();
      console.info(TAG, "TestGetBoundingBox ret:", ret);
      expect(ret).assertEqual(0);
    });
 
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_METADATA_DESTROY_0100
     * @tc.name     SUB_MULTIMEDIA_OH_METADATA_DESTROY_0100
     * @tc.desc     OH_MetadataObjectExt_Destroy - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_METADATA_DESTROY_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestRegisterMetadataCallbackNormal();
      console.info(TAG, result);
      await sleep(COMMON_WAIT_DURATION)
      let ret = cameraObj.TestDestroy();
      console.info(TAG, "TestDestroy ret:", ret);
      expect(ret).assertEqual(0);
    });
    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_ERRORCODE_ENUM_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_ERRORCODE_ENUM_0100
     * @tc.desc     CAMERA_ERROR_OPTIONAL_PROPERTY_NOT_EXIST - Enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_METADATA_OBJECT_ERRORCODE_ENUM_0100', Level.LEVEL0, async () => {
      let result = cameraObj.checkOptionalPropertyNotExistEnumValues();
      console.info(TAG, result);
      expect(result).assertTrue();
    });
  })
}