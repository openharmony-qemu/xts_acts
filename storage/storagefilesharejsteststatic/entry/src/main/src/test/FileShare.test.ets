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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import fileUri from '@ohos.file.fileuri';
import fileShare from '@ohos.fileshare';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wantConstant from '@ohos.app.ability.wantConstant';


let domain: int = 0x0000;
let tag: string = 'testTag'; 
const FILE_CONTENT = 'hello world';

export default function FileShare_test() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  describe("FileShare_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'FileShare_test start');


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_ActivatePermission_0100
     * @tc.name FileShare_activatePermission_001
     * @tc.desc Test activatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_activatePermission_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const fileStr: String = "/data/storage/el2/base/haps/entry/files/FileShare_activatePermission_001.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_001 START');

        try {
          const uriObject = new fileUri.FileUri(fileStr);
          const uri = uriObject.toString();
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.activatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_001: activatePermission success');
          expect(true).assertTrue();

        } catch (e : Error) {
          hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_001 has failed for ' + e);
          let err = e as BusinessError;
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          } else {
            expect(false).assertTrue();
          }
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_001 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_ActivatePermission_0200
     * @tc.name FileShare_activatePermission_002
     * @tc.desc Test activatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE and WRITE_MODE .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_activatePermission_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const fileStr: String = "/data/storage/el2/base/haps/entry/files/FileShare_activatePermission_002.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_002 START');

        try {
          const uriObject = new fileUri.FileUri(fileStr);
          const uri = uriObject.toString();
          hilog.info(domain, tag, '%{public}s', `Constructed URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.activatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_002 success');
          expect(true).assertTrue();

        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag,
            'FileShare_activatePermission_002 failed: code = %{public}d, message = %{public}s',
            err.code, err.message);
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          } else {
            expect(false).assertTrue();
          }
        }

        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_002 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_ActivatePermission_0300
     * @tc.name FileShare_activatePermission_003
     * @tc.desc Test activatePermission() interfaces
     * Test INVALID_PATH uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('FileShare_activatePermission_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (): Promise<void> => {
        const fileStr1: String = "/data/storage/el2/base/haps/entry/files/FileShare_activatePermission_003_1.txt";
        const fileStr2: String = "/data/storage/el2/base/haps/entry/files/FileShare_activatePermission_003_2.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_003 START');

        try {
          const uriObject1 = new fileUri.FileUri(fileStr1);
          const uri1 = uriObject1.toString();
          const policyInfo1: fileShare.PolicyInfo = {
            uri: uri1,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const uriObject2 = new fileUri.FileUri(fileStr2);
          const uri2 = uriObject2.toString();
          const fd = await fs.open(uri2, fs.OpenMode.CREATE);
          await fs.close(fd);
          const policyInfo2: fileShare.PolicyInfo = {
            uri: uri2,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const policies: Array<fileShare.PolicyInfo> = [policyInfo1, policyInfo2];
          await fileShare.activatePermission(policies);
          hilog.error(domain, tag, 'Unexpected success: activatePermission should have failed');
          expect(false).assertTrue();

        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          if (error.code === 801) {
            expect(error.message === "The device doesn't support this api").assertTrue();
          }
          if (error.code == 13900001) {
            expect(error.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_003 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0100
     * @tc.name FileShare_deactivatePermission_001
     * @tc.desc Test deactivatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_deactivatePermission_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const fileStr: String = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_001.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_001 START');

        try {
          const uriObject = new fileUri.FileUri(fileStr);
          const uri = uriObject.toString();
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.deactivatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_001: deactivatePermission success');
          expect(true).assertTrue();
        } catch (e : Error) {
          hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_001 has failed for ' + e);
          let err = e as BusinessError;
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          } else {
            expect(false).assertTrue();
          }
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_001 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0200
     * @tc.name FileShare_deactivatePermission_002
     * @tc.desc Test deactivatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE and WRITE_MODE .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_deactivatePermission_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const fileStr: String = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_002.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_002 START');

        try {
          const uriObject = new fileUri.FileUri(fileStr);
          const uri = uriObject.toString();
          hilog.info(domain, tag, '%{public}s', `Constructed URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.deactivatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_002 success');
          expect(true).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag,
            'FileShare_deactivatePermission_002 failed: code = %{public}d, message = %{public}s',
            err.code, err.message);
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          } else {
            expect(false).assertTrue();
          }
        }

        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_002 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0300
     * @tc.name FileShare_deactivatePermission_003
     * @tc.desc Test deactivatePermission() interfaces
     * Test INVALID_PATH uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('FileShare_deactivatePermission_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (): Promise<void> => {
        const fileStr1: String = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_003_1.txt";
        const fileStr2: String = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_003_2.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_003 START');

        try {
          const uriObject1 = new fileUri.FileUri(fileStr1);
          const uri1 = uriObject1.toString();
          const policyInfo1: fileShare.PolicyInfo = {
            uri: uri1,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const uriObject2 = new fileUri.FileUri(fileStr2);
          const uri2 = uriObject2.toString();
          const fd = await fs.open(uri2, fs.OpenMode.CREATE);
          await fs.close(fd);
          const policyInfo2: fileShare.PolicyInfo = {
            uri: uri2,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const policies: Array<fileShare.PolicyInfo> = [policyInfo1, policyInfo2];
          await fileShare.deactivatePermission(policies);
          hilog.error(domain, tag, 'Unexpected success: deactivatePermission should have failed');
          expect(false).assertTrue();

        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          if (error.code === 801) {
            expect(error.message === "The device doesn't support this api").assertTrue();
          }

          if (error.code == 13900001) {
            expect(error.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_003 END');
      });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_GrantUriPermission_0000
     * @tc.name test_GrantUriPermission_000
     * @tc.desc Test grantUriPermission interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_GrantUriPermission_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        try {
          let uri = "file://media/image/9";
          let bundleName = "com.demo.a";
          await fileShare.grantUriPermission(uri, bundleName, wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION);
          hilog.info(domain, tag, '%{public}s', `test_GrantUriPermission_000 success`);
          expect(true).assertTrue();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_GrantUriPermission_0100
     * @tc.name test_GrantUriPermission_003
     * @tc.desc Test grantUriPermission interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_GrantUriPermission_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        try {
          let uri = "file://media/image/9";
          let bundleName = "com.demo.a";
          fileShare.grantUriPermission(uri, bundleName, wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
            (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, "err.code: " + err?.code + ", err.message: " + err?.message);
                expect(false).assertTrue();
              } else {
                expect(true).assertTrue();
              }}
              );
              hilog.info(domain, tag, '%{public}s', `test_GrantUriPermission_003 success`);
            } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
              error.code, error.message);
            expect(false).assertTrue();
          }
        });

  })
  hilog.info(domain, tag, '%{public}s', 'FileShare_test end');

}