/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import asset from '@ohos.security.asset';
import { Logger } from './utils/common/Logger';
import { CreateBatchAssetMaps, CreateAssetMap, MaxGroupId, MinGroupId } from './utils/asset/AssetUtils';
import { StringToUint8Array, GetDataBySize } from './utils/common/CommonUtils';

export default function AssetApiCoverEnumTest() {

  describe('AssetApiCoverEnumTest', () => {

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0100
     * @tc.number SUB_Security_Asset_Api_Interface_0100
     * @tc.desc   test asset.TagType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.TagType.BOOL).assertEqual(0x01 << 28);
      expect(asset.TagType.NUMBER).assertEqual(0x02 << 28);
      expect(asset.TagType.BYTES).assertEqual(0x03 << 28);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0200
     * @tc.number SUB_Security_Asset_Api_Interface_0200
     * @tc.desc   test asset.TagType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.Tag.SECRET).assertEqual(asset.TagType.BYTES | 0x01);
      expect(asset.Tag.ALIAS).assertEqual(asset.TagType.BYTES | 0x02);
      expect(asset.Tag.ACCESSIBILITY).assertEqual(asset.TagType.NUMBER | 0x03);
      expect(asset.Tag.REQUIRE_PASSWORD_SET).assertEqual(asset.TagType.BOOL | 0x04);
      expect(asset.Tag.AUTH_TYPE).assertEqual(asset.TagType.NUMBER | 0x05);
      expect(asset.Tag.AUTH_VALIDITY_PERIOD).assertEqual(asset.TagType.NUMBER | 0x06);
      expect(asset.Tag.AUTH_CHALLENGE).assertEqual(asset.TagType.BYTES | 0x07);
      expect(asset.Tag.AUTH_TOKEN).assertEqual(asset.TagType.BYTES | 0x08);
      expect(asset.Tag.SYNC_TYPE).assertEqual(asset.TagType.NUMBER | 0x10);
      expect(asset.Tag.IS_PERSISTENT).assertEqual(asset.TagType.BOOL | 0x11);
      expect(asset.Tag.DATA_LABEL_CRITICAL_1).assertEqual(asset.TagType.BYTES | 0x20);
      expect(asset.Tag.DATA_LABEL_CRITICAL_2).assertEqual(asset.TagType.BYTES | 0x21);
      expect(asset.Tag.DATA_LABEL_CRITICAL_3).assertEqual(asset.TagType.BYTES | 0x22);
      expect(asset.Tag.DATA_LABEL_CRITICAL_4).assertEqual(asset.TagType.BYTES | 0x23);
      expect(asset.Tag.DATA_LABEL_NORMAL_1).assertEqual(asset.TagType.BYTES | 0x30);
      expect(asset.Tag.DATA_LABEL_NORMAL_2).assertEqual(asset.TagType.BYTES | 0x31);
      expect(asset.Tag.DATA_LABEL_NORMAL_3).assertEqual(asset.TagType.BYTES | 0x32);
      expect(asset.Tag.DATA_LABEL_NORMAL_4).assertEqual(asset.TagType.BYTES | 0x33);
      expect(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1).assertEqual(asset.TagType.BYTES | 0x34);
      expect(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2).assertEqual(asset.TagType.BYTES | 0x35);
      expect(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3).assertEqual(asset.TagType.BYTES | 0x36);
      expect(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4).assertEqual(asset.TagType.BYTES | 0x37);
      expect(asset.Tag.RETURN_TYPE).assertEqual(asset.TagType.NUMBER | 0x40);
      expect(asset.Tag.RETURN_LIMIT).assertEqual(asset.TagType.NUMBER | 0x41);
      expect(asset.Tag.RETURN_OFFSET).assertEqual(asset.TagType.NUMBER | 0x42);
      expect(asset.Tag.RETURN_ORDERED_BY).assertEqual(asset.TagType.NUMBER | 0x43);
      expect(asset.Tag.CONFLICT_RESOLUTION).assertEqual(asset.TagType.NUMBER | 0x44);
      expect(asset.Tag.UPDATE_TIME).assertEqual(asset.TagType.BYTES | 0x45);
      expect(asset.Tag.OPERATION_TYPE).assertEqual(asset.TagType.NUMBER | 0x46);
      expect(asset.Tag.REQUIRE_ATTR_ENCRYPTED).assertEqual(asset.TagType.BOOL | 0x47);
      expect(asset.Tag.GROUP_ID).assertEqual(asset.TagType.BYTES | 0x48);
      expect(asset.Tag.WRAP_TYPE).assertEqual(asset.TagType.NUMBER | 0x49);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0300
     * @tc.number SUB_Security_Asset_Api_Interface_0300
     * @tc.desc   test asset.Tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.TagType.BOOL).assertEqual(0x01 << 28);
      expect(asset.TagType.NUMBER).assertEqual(0x02 << 28);
      expect(asset.TagType.BYTES).assertEqual(0x03 << 28);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0400
     * @tc.number SUB_Security_Asset_Api_Interface_0400
     * @tc.desc   test asset.Accessibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.Accessibility.DEVICE_POWERED_ON).assertEqual(0);
      expect(asset.Accessibility.DEVICE_FIRST_UNLOCKED).assertEqual(1);
      expect(asset.Accessibility.DEVICE_UNLOCKED).assertEqual(2);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0500
     * @tc.number SUB_Security_Asset_Api_Interface_0500
     * @tc.desc   test asset.AuthType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.AuthType.NONE).assertEqual(0x00);
      expect(asset.AuthType.ANY).assertEqual(0xFF);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0600
     * @tc.number SUB_Security_Asset_Api_Interface_0600
     * @tc.desc   test asset.SyncType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.SyncType.NEVER).assertEqual(0);
      expect(asset.SyncType.THIS_DEVICE).assertEqual(1 << 0);
      expect(asset.SyncType.TRUSTED_DEVICE).assertEqual(1 << 1);
      expect(asset.SyncType.TRUSTED_ACCOUNT).assertEqual(1 << 2);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0700
     * @tc.number SUB_Security_Asset_Api_Interface_0700
     * @tc.desc   test asset.ReturnType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.ReturnType.ALL).assertEqual(0);
      expect(asset.ReturnType.ATTRIBUTES).assertEqual(1);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0800
     * @tc.number SUB_Security_Asset_Api_Interface_0800
     * @tc.desc   test asset.ConflictResolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.ConflictResolution.OVERWRITE).assertEqual(0);
      expect(asset.ConflictResolution.THROW_ERROR).assertEqual(1);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_0900
     * @tc.number SUB_Security_Asset_Api_Interface_0900
     * @tc.desc   test asset.OperationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.OperationType.NEED_SYNC).assertEqual(0);
      expect(asset.OperationType.NEED_LOGOUT).assertEqual(1);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_1000
     * @tc.number SUB_Security_Asset_Api_Interface_1000
     * @tc.desc   test asset.WrapType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.WrapType.NEVER).assertEqual(0);
      expect(asset.WrapType.TRUSTED_ACCOUNT).assertEqual(1);
    });

    /**
     * @tc.name   SUB_Security_Asset_Api_Interface_1100
     * @tc.number SUB_Security_Asset_Api_Interface_1100
     * @tc.desc   test asset.ErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_Api_Interface_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(asset.ErrorCode.PERMISSION_DENIED).assertEqual(201);
      expect(asset.ErrorCode.NOT_SYSTEM_APPLICATION).assertEqual(202);
      expect(asset.ErrorCode.INVALID_ARGUMENT).assertEqual(401);
      expect(asset.ErrorCode.SERVICE_UNAVAILABLE).assertEqual(24000001);
      expect(asset.ErrorCode.NOT_FOUND).assertEqual(24000002);
      expect(asset.ErrorCode.DUPLICATED).assertEqual(24000003);
      expect(asset.ErrorCode.ACCESS_DENIED).assertEqual(24000004);
      expect(asset.ErrorCode.STATUS_MISMATCH).assertEqual(24000005);
      expect(asset.ErrorCode.OUT_OF_MEMORY).assertEqual(24000006);
      expect(asset.ErrorCode.DATA_CORRUPTED).assertEqual(24000007);
      expect(asset.ErrorCode.DATABASE_ERROR).assertEqual(24000008);
      expect(asset.ErrorCode.CRYPTO_ERROR).assertEqual(24000009);
      expect(asset.ErrorCode.IPC_ERROR).assertEqual(24000010);
      expect(asset.ErrorCode.BMS_ERROR).assertEqual(24000011);
      expect(asset.ErrorCode.ACCOUNT_ERROR).assertEqual(24000012);
      expect(asset.ErrorCode.ACCESS_TOKEN_ERROR).assertEqual(24000013);
      expect(asset.ErrorCode.FILE_OPERATION_ERROR).assertEqual(24000014);
      expect(asset.ErrorCode.GET_SYSTEM_TIME_ERROR).assertEqual(24000015);
      expect(asset.ErrorCode.LIMIT_EXCEEDED).assertEqual(24000016);
      expect(asset.ErrorCode.UNSUPPORTED).assertEqual(24000017);
      expect(asset.ErrorCode.PARAM_VERIFICATION_FAILED).assertEqual(24000018);
      expect(asset.ErrorCode.INCONSISTENT_ATTRIBUTE).assertEqual(24000019);
    });

  });
}