/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

 import bundle from '@ohos.bundle.bundleManager';
 import { BusinessError } from '@kit.BasicServicesKit';
 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";
 import { JSON } from '@kit.ArkTS';
 
 const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
 
 const VENDOR = "example";
 const VERSION_CODE = 1000000;
 const VERSION_NAME = "1.0.0";
 const MIN_COMPATIBLE_VERSION_CODE = 1000000;
 const TARGET_VERSION = 100;
 
 export default function addAITestCaseTest() {
   describe('addAITestCaseTest', () => {
 
     beforeAll(() => {
       console.info('addAITestCaseTest beforeAll called');
     });
 
     afterAll(() => {
       console.info('addAITestCaseTest afterAll called');
     });
 
     beforeEach(() => {
       console.info('addAITestCaseTest beforeEach called');
     });
 
     afterEach(() => {
       console.info('addAITestCaseTest afterEach called');
     });
 
 
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_0100
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_0100
      * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_DEFAULT by promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       try {
         await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then((data: bundle.BundleInfo) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0100: " + JSON.stringify(data));
           expect(data.name).assertEqual(BUNDLE_NAME);
           expect(data.vendor).assertEqual(VENDOR);
           expect(data.versionCode).assertEqual(1000000);
           expect(data.versionName).assertEqual("1.0.0");
           expect(data.buildVersion).assertEqual("1.0.0");
           expect(data.minCompatibleVersionCode).assertLarger(0);
           expect(data.appInfo).assertEqual(null);
           expect(data.hapModulesInfo.length).assertEqual(0);
           expect(data.reqPermissionDetails.length).assertEqual(0);
           expect(data.permissionGrantStates.length).assertEqual(0);
           expect(data.signatureInfo).assertEqual(null);
           expect(data.routerMap.length).assertEqual(0);
           expect(data.installTime).assertLarger(0)
           expect(data.firstInstallTime).assertLarger(0)
           expect(data.updateTime).assertLarger(0)
           expect(data.appIndex).assertEqual(0)
           done();
         }).catch((err: BusinessError) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0100 failed: " + JSON.stringify(err));
           expect().assertFail();
           done();
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0100 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_0200
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_0200
      * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_WITH_APPLICATION by promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       try {
         await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).then((data: bundle.BundleInfo) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0200: " + JSON.stringify(data));
           expect(data.name).assertEqual(BUNDLE_NAME);
           expect(data.vendor).assertEqual(VENDOR);
           expect(data.versionCode).assertEqual(1000000);
           expect(data.versionName).assertEqual("1.0.0");
           expect(data.buildVersion).assertEqual("1.0.0");
           expect(data.minCompatibleVersionCode).assertLarger(0);
           expect(data.hapModulesInfo.length).assertEqual(0);
           expect(data.reqPermissionDetails.length).assertEqual(0);
           expect(data.permissionGrantStates.length).assertEqual(0);
           expect(data.signatureInfo).assertEqual(null);
           expect(data.routerMap.length).assertEqual(0);
           expect(data.installTime).assertLarger(0)
           expect(data.firstInstallTime).assertLarger(0)
           expect(data.updateTime).assertLarger(0)
           expect(data.appIndex).assertEqual(0)
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0200: appInfo" + JSON.stringify(data.appInfo))
           expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.bundleType).assertEqual(0);
           expect(data.appInfo.debug).assertEqual(false);
           expect(data.appInfo.description).assertEqual("$string:description_application");
           expect(data.appInfo.descriptionId).assertLarger(0)
           expect(data.appInfo.enabled).assertTrue()
           expect(data.appInfo.label).assertEqual("$string:app_name")
           expect(data.appInfo.labelId).assertLarger(0)
           expect(data.appInfo.icon).assertEqual("$media:app_icon")
           expect(data.appInfo.iconId).assertLarger(0)
           expect(data.appInfo.process).assertEqual("ohos.acts.bundle.stage.test")
           expect(data.appInfo.permissions.length).assertEqual(0)
           expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
           expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}")
           expect(data.appInfo.metadataArray.length).assertEqual(0)
           expect(data.appInfo.removable).assertTrue();
           expect(data.appInfo.accessTokenId).assertLarger(0);
           expect(data.appInfo.uid).assertLarger(0);
           expect(data.appInfo.systemApp).assertFalse();
           expect(data.appInfo.appDistributionType).assertEqual("os_integration");
           expect(data.appInfo.appProvisionType).assertEqual("release");
           expect(data.appInfo.dataUnclearable).assertEqual(false);
           expect(data.appInfo.nativeLibraryPath).assertEqual("");
           expect(data.appInfo.appIndex).assertEqual(0);
           expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(0);
           expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
           expect(data.appInfo.flags).assertEqual(1);
           expect(data.appInfo.cloudFileSyncEnabled).assertEqual(false);
           expect(data.appInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
           expect(data.appInfo.releaseType.length).assertLarger(0);
           expect(data.appInfo.releaseType.length).assertLarger(0);
           expect(data.appInfo.installSource).assertEqual("unknown")
           expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.iconResource.moduleName.length).assertLarger(0);
           expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
           expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.labelResource.moduleName.length).assertLarger(0);
           expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
           expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.descriptionResource.moduleName.length).assertLarger(0);
           expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
           expect(data.appInfo.permissions.length).assertEqual(0);
           done();
         }).catch((err: BusinessError) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0200 failed: " + JSON.stringify(err));
           expect().assertFail();
           done();
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0200 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_0400
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_0400
      * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_WITH_SIGNATURE_INFO by promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
       try {
         await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO).then((data: bundle.BundleInfo) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0400: " + JSON.stringify(data));
           expect(data.name).assertEqual(BUNDLE_NAME);
           expect(data.vendor).assertEqual(VENDOR);
           expect(data.versionCode).assertEqual(1000000);
           expect(data.versionName).assertEqual("1.0.0");
           expect(data.buildVersion).assertEqual("1.0.0");
           expect(data.minCompatibleVersionCode).assertLarger(0);
           expect(data.appInfo).assertEqual(null);
           expect(data.hapModulesInfo.length).assertEqual(0);
           expect(data.reqPermissionDetails.length).assertEqual(0);
           expect(data.permissionGrantStates.length).assertEqual(0);
           expect(data.signatureInfo.appId.length).assertLarger(0);
           expect(data.signatureInfo.fingerprint.length).assertLarger(0);
           expect(data.signatureInfo.appIdentifier).assertEqual("");
           expect(data.signatureInfo.certificate).assertContain("-----BEGIN CERTIFICATE-----");
           expect(data.routerMap.length).assertEqual(0);
           expect(data.installTime).assertLarger(0)
           expect(data.firstInstallTime).assertLarger(0)
           expect(data.updateTime).assertLarger(0)
           expect(data.appIndex).assertEqual(0)
 
           done();
         }).catch((err: BusinessError) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0400 failed: " + JSON.stringify(err));
           expect().assertFail();
           done();
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0400 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
 
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_0600
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_0600
      * @tc.desc   test BundleInfo when getBundleInfo with userId by promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
       try {
         await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100).then((data: bundle.BundleInfo) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0600: " + JSON.stringify(data));
           expect(data.name).assertEqual(BUNDLE_NAME);
           expect(data.vendor).assertEqual(VENDOR);
           expect(data.versionCode).assertEqual(1000000);
           expect(data.versionName).assertEqual("1.0.0");
           expect(data.buildVersion).assertEqual("1.0.0");
           expect(data.minCompatibleVersionCode).assertLarger(0);
           expect(data.appInfo).assertEqual(null);
           expect(data.hapModulesInfo.length).assertEqual(0);
           expect(data.reqPermissionDetails.length).assertEqual(0);
           expect(data.permissionGrantStates.length).assertEqual(0);
           expect(data.signatureInfo).assertEqual(null);
           expect(data.routerMap.length).assertEqual(0);
           expect(data.installTime).assertLarger(0)
           expect(data.firstInstallTime).assertLarger(0)
           expect(data.updateTime).assertLarger(0)
           expect(data.appIndex).assertEqual(0)
           done();
         }).catch((err: BusinessError) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0600 failed: " + JSON.stringify(err));
           expect().assertFail();
           done();
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0600 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_0700
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_0700
      * @tc.desc   test BundleInfo when bundleName is invalid by promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
       try {
         await bundle.getBundleInfo("", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then((data: bundle.BundleInfo) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0700 failed: should not return data");
           expect(data).assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0700: " + JSON.stringify(err));
           expect(err.code).assertEqual(17700001);
           done();
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0700 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_0900
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_0900
      * @tc.desc   test BundleInfo when combination flags by promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
       try {
         const flags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
         bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
         bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
         await bundle.getBundleInfo(BUNDLE_NAME, flags).then((data: bundle.BundleInfo) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0900: " + JSON.stringify(data));
 
           expect(data.name).assertEqual(BUNDLE_NAME);
           expect(data.vendor).assertEqual(VENDOR);
           expect(data.versionCode).assertEqual(1000000);
           expect(data.versionName).assertEqual("1.0.0");
           expect(data.buildVersion).assertEqual("1.0.0");
           expect(data.minCompatibleVersionCode).assertLarger(0);
           expect(data.reqPermissionDetails.length).assertEqual(0);
           expect(data.permissionGrantStates.length).assertEqual(0);
           expect(data.signatureInfo.appId.length).assertLarger(0);
           expect(data.signatureInfo.fingerprint.length).assertLarger(0);
           expect(data.signatureInfo.appIdentifier).assertEqual("");
           expect(data.signatureInfo.certificate).assertContain("-----BEGIN CERTIFICATE-----");
           expect(data.routerMap.length).assertEqual(0);
           expect(data.installTime).assertLarger(0)
           expect(data.firstInstallTime).assertLarger(0)
           expect(data.updateTime).assertLarger(0)
           expect(data.appIndex).assertEqual(0)
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0900: appInfo" + JSON.stringify(data.appInfo))
           expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.bundleType).assertEqual(0);
           expect(data.appInfo.debug).assertEqual(false);
           expect(data.appInfo.description).assertEqual("$string:description_application");
           expect(data.appInfo.descriptionId).assertLarger(0)
           expect(data.appInfo.enabled).assertTrue()
           expect(data.appInfo.label).assertEqual("$string:app_name")
           expect(data.appInfo.labelId).assertLarger(0)
           expect(data.appInfo.icon).assertEqual("$media:app_icon")
           expect(data.appInfo.iconId).assertLarger(0)
           expect(data.appInfo.process).assertEqual("ohos.acts.bundle.stage.test")
           expect(data.appInfo.permissions.length).assertEqual(0)
           expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
           expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}")
           expect(data.appInfo.metadataArray.length).assertEqual(0)
           expect(data.appInfo.removable).assertTrue();
           expect(data.appInfo.accessTokenId).assertLarger(0);
           expect(data.appInfo.uid).assertLarger(0);
           expect(data.appInfo.systemApp).assertFalse();
           expect(data.appInfo.appDistributionType).assertEqual("os_integration");
           expect(data.appInfo.appProvisionType).assertEqual("release");
           expect(data.appInfo.dataUnclearable).assertEqual(false);
           expect(data.appInfo.nativeLibraryPath).assertEqual("");
           expect(data.appInfo.appIndex).assertEqual(0);
           expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(0);
           expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
           expect(data.appInfo.flags).assertEqual(1);
           expect(data.appInfo.cloudFileSyncEnabled).assertEqual(false);
           expect(data.appInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
           expect(data.appInfo.releaseType.length).assertLarger(0);
           expect(data.appInfo.releaseType.length).assertLarger(0);
           expect(data.appInfo.installSource).assertEqual("unknown")
           expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.iconResource.moduleName.length).assertLarger(0);
           expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
           expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.labelResource.moduleName.length).assertLarger(0);
           expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
           expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
           expect(data.appInfo.descriptionResource.moduleName.length).assertLarger(0);
           expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
           expect(data.appInfo.permissions.length).assertEqual(0);
           expect(data.reqPermissionDetails.length).assertEqual(0);
           expect(data.permissionGrantStates.length).assertEqual(0);
           expect(data.routerMap.length).assertEqual(0);
           expect(data.hapModulesInfo[0].name).assertEqual("testModule");
           expect(data.hapModulesInfo[0].icon).assertEqual("");
           expect(data.hapModulesInfo[0].iconId).assertEqual(0);
           expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
           expect(data.hapModulesInfo[0].labelId).assertLarger(0);
           expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
           expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
           expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
           expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
           expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
           expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
           expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
           expect(data.hapModulesInfo[0].installationFree).assertEqual(false);
           expect(data.hapModulesInfo[0].hashValue).assertEqual("");
           expect(data.hapModulesInfo[0].type).assertEqual(2);
           expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
           expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
           expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
           expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/testModule.hap");
           expect(data.hapModulesInfo[0].nativeLibraryPath.length).assertEqual(0);
           done();
         }).catch((err: BusinessError) => {
           console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0900 failed: " + JSON.stringify(err));
           expect().assertFail();
           done();
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_0900 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_1000
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_1000
      * @tc.desc   test getBundleInfo callback when bundleName is empty string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         bundle.getBundleInfo("", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err: BusinessError, data: bundle.BundleInfo) => {
           if (err) {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1000 err: " + JSON.stringify(err));
             expect(err.code).assertEqual(17700001);
             done();
           } else {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1000 should not return data");
             expect().assertFail();
             done();
           }
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1000 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_1100
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_1100
      * @tc.desc   test getBundleInfo callback when bundleName is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         bundle.getBundleInfo(null, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err: BusinessError, data: bundle.BundleInfo) => {
           if (err) {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1100 err: " + JSON.stringify(err));
             expect().assertFail();
             done();
           } else {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1100 should not return data");
             expect().assertFail();
             done();
           }
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1100 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_1200
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_1200
      * @tc.desc   test getBundleInfo callback when bundleName is undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         bundle.getBundleInfo(undefined, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err: BusinessError, data: bundle.BundleInfo) => {
           if (err) {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1200 err: " + JSON.stringify(err));
             expect().assertFail();
             done();
           } else {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1200 should not return data");
             expect().assertFail();
             done();
           }
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1200 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
 
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_1400
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_1400
      * @tc.desc   test getBundleInfo callback when userId is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, null, (err: BusinessError, data: bundle.BundleInfo) => {
           if (err) {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1400 err: " + JSON.stringify(err));
             expect().assertFail();
             done();
           } else {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1400 should not return data" + JSON.stringify(data));
             expect(data.name).assertEqual(BUNDLE_NAME);
             expect(data.vendor).assertEqual(VENDOR);
             expect(data.versionCode).assertEqual(1000000);
             expect(data.versionName).assertEqual("1.0.0");
             expect(data.buildVersion).assertEqual("1.0.0");
             expect(data.minCompatibleVersionCode).assertLarger(0);
             expect(data.appInfo).assertEqual(null);
             expect(data.hapModulesInfo.length).assertEqual(0);
             expect(data.reqPermissionDetails.length).assertEqual(0);
             expect(data.permissionGrantStates.length).assertEqual(0);
             expect(data.signatureInfo).assertEqual(null);
             expect(data.routerMap.length).assertEqual(0);
             expect(data.installTime).assertLarger(0)
             expect(data.firstInstallTime).assertLarger(0)
             expect(data.updateTime).assertLarger(0)
             expect(data.appIndex).assertEqual(0)
             done();
           }
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1400 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_1500
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_1500
      * @tc.desc   test getBundleInfo callback when userId is undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfo_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, undefined, (err: BusinessError, data: bundle.BundleInfo) => {
           if (err) {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1500 err: " + JSON.stringify(err));
             expect().assertFail();
             done();
           } else {
             console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1500 should not return data");
             expect(data.name).assertEqual(BUNDLE_NAME);
             expect(data.vendor).assertEqual(VENDOR);
             expect(data.versionCode).assertEqual(1000000);
             expect(data.versionName).assertEqual("1.0.0");
             expect(data.buildVersion).assertEqual("1.0.0");
             expect(data.minCompatibleVersionCode).assertLarger(0);
             expect(data.appInfo).assertEqual(null);
             expect(data.hapModulesInfo.length).assertEqual(0);
             expect(data.reqPermissionDetails.length).assertEqual(0);
             expect(data.permissionGrantStates.length).assertEqual(0);
             expect(data.signatureInfo).assertEqual(null);
             expect(data.routerMap.length).assertEqual(0);
             expect(data.installTime).assertLarger(0)
             expect(data.firstInstallTime).assertLarger(0)
             expect(data.updateTime).assertLarger(0)
             expect(data.appIndex).assertEqual(0)
             done();
           }
         });
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfo_1500 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_1600
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_1600
      * @tc.desc   test getBundleInfoSync when bundleName is empty string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync("", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_1600 should not return data ==>" + JSON.stringify(data));
         expect().assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_1600 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(17700001);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_1700
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_1700
      * @tc.desc   test getBundleInfoSync when bundleName is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(null, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_1700 should not return data");
         expect(data).assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_1700 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_1800
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_1800
      * @tc.desc   test getBundleInfoSync when bundleName is undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(undefined, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_1800 should not return data");
         expect(data).assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_1800 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
 
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2000
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2000
      * @tc.desc   test getBundleInfoSync when bundleFlags is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(BUNDLE_NAME, null,100);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2000 should not return data" + JSON.stringify(data));
         expect().assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2000 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2100
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2100
      * @tc.desc   test getBundleInfoSync when bundleFlags is undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(BUNDLE_NAME, undefined,100);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2100 should not return data" + JSON.stringify(data));
         expect().assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2100 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2300
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2300
      * @tc.desc   test getBundleInfoSync when userId is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, null);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2300 should not return data" +JSON.stringify(data));
         expect(data.name).assertEqual(BUNDLE_NAME);
         expect(data.vendor).assertEqual(VENDOR);
         expect(data.versionCode).assertEqual(1000000);
         expect(data.versionName).assertEqual("1.0.0");
         expect(data.buildVersion).assertEqual("1.0.0");
         expect(data.minCompatibleVersionCode).assertLarger(0);
         expect(data.appInfo).assertEqual(null);
         expect(data.hapModulesInfo.length).assertEqual(0);
         expect(data.reqPermissionDetails.length).assertEqual(0);
         expect(data.permissionGrantStates.length).assertEqual(0);
         expect(data.signatureInfo).assertEqual(null);
         expect(data.routerMap.length).assertEqual(0);
         expect(data.installTime).assertLarger(0)
         expect(data.firstInstallTime).assertLarger(0)
         expect(data.updateTime).assertLarger(0)
         expect(data.appIndex).assertEqual(0)
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2300 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2400
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2400
      * @tc.desc   test getBundleInfoSync when userId is undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, undefined);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2400 should return data" + JSON.stringify(data));
         expect(data.name).assertEqual(BUNDLE_NAME);
         expect(data.vendor).assertEqual(VENDOR);
         expect(data.versionCode).assertEqual(1000000);
         expect(data.versionName).assertEqual("1.0.0");
         expect(data.buildVersion).assertEqual("1.0.0");
         expect(data.minCompatibleVersionCode).assertLarger(0);
         expect(data.appInfo).assertEqual(null);
         expect(data.hapModulesInfo.length).assertEqual(0);
         expect(data.reqPermissionDetails.length).assertEqual(0);
         expect(data.permissionGrantStates.length).assertEqual(0);
         expect(data.signatureInfo).assertEqual(null);
         expect(data.routerMap.length).assertEqual(0);
         expect(data.installTime).assertLarger(0)
         expect(data.firstInstallTime).assertLarger(0)
         expect(data.updateTime).assertLarger(0)
         expect(data.appIndex).assertEqual(0)
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2400 exception: " + JSON.stringify(error));
         expect().assertFail();
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2500
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2500
      * @tc.desc   test getBundleInfoSync two params when bundleName is empty string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync("", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2500 should not return data");
         expect(data).assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2500 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(17700001);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2600
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2600
      * @tc.desc   test getBundleInfoSync two params when bundleName is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(null, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2600 should not return data");
         expect(data).assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2600 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2700
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2700
      * @tc.desc   test getBundleInfoSync two params when bundleName is undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(undefined, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2700 should not return data");
         expect(data).assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2700 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2800
      * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2800
      * @tc.desc   test getBundleInfoSync two params when bundleFlags is null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
       try {
         let data = bundle.getBundleInfoSync(BUNDLE_NAME, null);
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2800 should not return data");
         expect(data).assertFail();
         done();
       } catch (error) {
         console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2800 exception: " + JSON.stringify(error));
         expect(error.code).assertEqual(401);
         done();
       }
     });
 
/**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2900
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2900
       * @tc.desc   test getBundleInfoSync two params when bundleFlags is undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        try {
          let data = bundle.getBundleInfoSync(BUNDLE_NAME, undefined);
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2900 should not return data");
          expect(data).assertFail();
          done();
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_2900 exception: " + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_3000
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_3000
       * @tc.desc   test getBundleInfo callback with combination flags test.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfo_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          const flags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
          bundle.getBundleInfo(BUNDLE_NAME, flags, (err: BusinessError, data: bundle.BundleInfo) => {
            if (err) {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_3000 failed: " + JSON.stringify(err));
              expect().assertFail();
              done();
            } else {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_3000: " + JSON.stringify(data));
              expect(data.name).assertEqual(BUNDLE_NAME);
              expect(data.vendor).assertEqual(VENDOR);
              expect(data.versionCode).assertEqual(1000000);
              expect(data.versionName).assertEqual("1.0.0");
              expect(data.buildVersion).assertEqual("1.0.0");
              expect(data.minCompatibleVersionCode).assertLarger(0);
              expect(data.reqPermissionDetails.length).assertEqual(0);
              expect(data.permissionGrantStates.length).assertEqual(0);
              expect(data.signatureInfo.appId.length).assertLarger(0);
              expect(data.signatureInfo.fingerprint.length).assertLarger(0);
              expect(data.signatureInfo.appIdentifier).assertEqual("");
              expect(data.signatureInfo.certificate).assertContain("-----BEGIN CERTIFICATE-----");
              expect(data.routerMap.length).assertEqual(0);
              expect(data.installTime).assertLarger(0);
              expect(data.firstInstallTime).assertLarger(0);
              expect(data.updateTime).assertLarger(0);
              expect(data.appIndex).assertEqual(0);
              expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.bundleType).assertEqual(0);
              expect(data.appInfo.debug).assertEqual(false);
              expect(data.appInfo.description).assertEqual("$string:description_application");
              expect(data.appInfo.descriptionId).assertLarger(0);
              expect(data.appInfo.enabled).assertTrue();
              expect(data.appInfo.label).assertEqual("$string:app_name");
              expect(data.appInfo.labelId).assertLarger(0);
              expect(data.appInfo.icon).assertEqual("$media:app_icon");
              expect(data.appInfo.iconId).assertLarger(0);
              expect(data.appInfo.process).assertEqual("ohos.acts.bundle.stage.test");
              expect(data.appInfo.permissions.length).assertEqual(0);
              expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
              expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
              expect(data.appInfo.metadataArray.length).assertEqual(0);
              expect(data.appInfo.removable).assertTrue();
              expect(data.appInfo.accessTokenId).assertLarger(0);
              expect(data.appInfo.uid).assertLarger(0);
              expect(data.appInfo.systemApp).assertFalse();
              expect(data.appInfo.appDistributionType).assertEqual("os_integration");
              expect(data.appInfo.appProvisionType).assertEqual("release");
              expect(data.appInfo.dataUnclearable).assertEqual(false);
              expect(data.appInfo.nativeLibraryPath).assertEqual("");
              expect(data.appInfo.appIndex).assertEqual(0);
              expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(0);
              expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
              expect(data.appInfo.flags).assertEqual(1);
              expect(data.appInfo.cloudFileSyncEnabled).assertEqual(false);
              expect(data.appInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
              expect(data.appInfo.releaseType.length).assertLarger(0);
              expect(data.appInfo.installSource).assertEqual("unknown");
              expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.iconResource.moduleName.length).assertLarger(0);
              expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
              expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.labelResource.moduleName.length).assertLarger(0);
              expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
              expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.descriptionResource.moduleName.length).assertLarger(0);
              expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
              expect(data.hapModulesInfo[0].name).assertEqual("testModule");
              expect(data.hapModulesInfo[0].icon).assertEqual("");
              expect(data.hapModulesInfo[0].iconId).assertEqual(0);
              expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
              expect(data.hapModulesInfo[0].labelId).assertLarger(0);
              expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
              expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
              expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
              expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
              expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
              expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
              expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
              expect(data.hapModulesInfo[0].installationFree).assertEqual(false);
              expect(data.hapModulesInfo[0].hashValue).assertEqual("");
              expect(data.hapModulesInfo[0].type).assertEqual(2);
              expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
              expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
              expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
              expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/testModule.hap");
              expect(data.hapModulesInfo[0].nativeLibraryPath.length).assertEqual(0);
              done();
            }
          });
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfo_3000 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_3100
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_3100
       * @tc.desc   test getBundleInfo callback with userId and combination flags test.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfo_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          const flags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
          bundle.getBundleInfo(BUNDLE_NAME, flags, 100, (err: BusinessError, data: bundle.BundleInfo) => {
            if (err) {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_3100 failed: " + JSON.stringify(err));
              expect().assertFail();
              done();
            } else {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_3100: " + JSON.stringify(data));
              expect(data.name).assertEqual(BUNDLE_NAME);
              expect(data.vendor).assertEqual(VENDOR);
              expect(data.versionCode).assertEqual(1000000);
              expect(data.versionName).assertEqual("1.0.0");
              expect(data.buildVersion).assertEqual("1.0.0");
              expect(data.minCompatibleVersionCode).assertLarger(0);
              expect(data.reqPermissionDetails.length).assertEqual(0);
              expect(data.permissionGrantStates.length).assertEqual(0);
              expect(data.signatureInfo.appId.length).assertLarger(0);
              expect(data.signatureInfo.fingerprint.length).assertLarger(0);
              expect(data.signatureInfo.appIdentifier).assertEqual("");
              expect(data.signatureInfo.certificate).assertContain("-----BEGIN CERTIFICATE-----");
              expect(data.routerMap.length).assertEqual(0);
              expect(data.installTime).assertLarger(0);
              expect(data.firstInstallTime).assertLarger(0);
              expect(data.updateTime).assertLarger(0);
              expect(data.appIndex).assertEqual(0);
              expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.bundleType).assertEqual(0);
              expect(data.appInfo.debug).assertEqual(false);
              expect(data.appInfo.description).assertEqual("$string:description_application");
              expect(data.appInfo.descriptionId).assertLarger(0);
              expect(data.appInfo.enabled).assertTrue();
              expect(data.appInfo.label).assertEqual("$string:app_name");
              expect(data.appInfo.labelId).assertLarger(0);
              expect(data.appInfo.icon).assertEqual("$media:app_icon");
              expect(data.appInfo.iconId).assertLarger(0);
              expect(data.appInfo.process).assertEqual("ohos.acts.bundle.stage.test");
              expect(data.appInfo.permissions.length).assertEqual(0);
              expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
              expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
              expect(data.appInfo.metadataArray.length).assertEqual(0);
              expect(data.appInfo.removable).assertTrue();
              expect(data.appInfo.accessTokenId).assertLarger(0);
              expect(data.appInfo.uid).assertLarger(0);
              expect(data.appInfo.systemApp).assertFalse();
              expect(data.appInfo.appDistributionType).assertEqual("os_integration");
              expect(data.appInfo.appProvisionType).assertEqual("release");
              expect(data.appInfo.dataUnclearable).assertEqual(false);
              expect(data.appInfo.nativeLibraryPath).assertEqual("");
              expect(data.appInfo.appIndex).assertEqual(0);
              expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(0);
              expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
              expect(data.appInfo.flags).assertEqual(1);
              expect(data.appInfo.cloudFileSyncEnabled).assertEqual(false);
              expect(data.appInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
              expect(data.appInfo.releaseType.length).assertLarger(0);
              expect(data.appInfo.installSource).assertEqual("unknown");
              expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.iconResource.moduleName.length).assertLarger(0);
              expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
              expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.labelResource.moduleName.length).assertLarger(0);
              expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
              expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data.appInfo.descriptionResource.moduleName.length).assertLarger(0);
              expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
              expect(data.hapModulesInfo[0].name).assertEqual("testModule");
              expect(data.hapModulesInfo[0].icon).assertEqual("");
              expect(data.hapModulesInfo[0].iconId).assertEqual(0);
              expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
              expect(data.hapModulesInfo[0].labelId).assertLarger(0);
              expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
              expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
              expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
              expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
              expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
              expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
              expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
              expect(data.hapModulesInfo[0].installationFree).assertEqual(false);
              expect(data.hapModulesInfo[0].hashValue).assertEqual("");
              expect(data.hapModulesInfo[0].type).assertEqual(2);
              expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
              expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
              expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
              expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/testModule.hap");
              expect(data.hapModulesInfo[0].nativeLibraryPath.length).assertEqual(0);
              done();
            }
          });
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfo_3100 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_3200
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_3200
       * @tc.desc   test getBundleInfoSync three params with combination flags test.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfoSync_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          const flags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
          let data = bundle.getBundleInfoSync(BUNDLE_NAME, flags, 100);
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_3200: " + JSON.stringify(data));
          expect(data.name).assertEqual(BUNDLE_NAME);
          expect(data.vendor).assertEqual(VENDOR);
          expect(data.versionCode).assertEqual(1000000);
          expect(data.versionName).assertEqual("1.0.0");
          expect(data.buildVersion).assertEqual("1.0.0");
          expect(data.minCompatibleVersionCode).assertLarger(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo.appId.length).assertLarger(0);
          expect(data.signatureInfo.fingerprint.length).assertLarger(0);
          expect(data.signatureInfo.appIdentifier).assertEqual("");
          expect(data.signatureInfo.certificate).assertContain("-----BEGIN CERTIFICATE-----");
          expect(data.routerMap.length).assertEqual(0);
          expect(data.installTime).assertLarger(0);
          expect(data.firstInstallTime).assertLarger(0);
          expect(data.updateTime).assertLarger(0);
          expect(data.appIndex).assertEqual(0);
          expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.bundleType).assertEqual(0);
          expect(data.appInfo.debug).assertEqual(false);
          expect(data.appInfo.description).assertEqual("$string:description_application");
          expect(data.appInfo.descriptionId).assertLarger(0);
          expect(data.appInfo.enabled).assertTrue();
          expect(data.appInfo.label).assertEqual("$string:app_name");
          expect(data.appInfo.labelId).assertLarger(0);
          expect(data.appInfo.icon).assertEqual("$media:app_icon");
          expect(data.appInfo.iconId).assertLarger(0);
          expect(data.appInfo.process).assertEqual("ohos.acts.bundle.stage.test");
          expect(data.appInfo.permissions.length).assertEqual(0);
          expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
          expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
          expect(data.appInfo.metadataArray.length).assertEqual(0);
          expect(data.appInfo.removable).assertTrue();
          expect(data.appInfo.accessTokenId).assertLarger(0);
          expect(data.appInfo.uid).assertLarger(0);
          expect(data.appInfo.systemApp).assertFalse();
          expect(data.appInfo.appDistributionType).assertEqual("os_integration");
          expect(data.appInfo.appProvisionType).assertEqual("release");
          expect(data.appInfo.dataUnclearable).assertEqual(false);
          expect(data.appInfo.nativeLibraryPath).assertEqual("");
          expect(data.appInfo.appIndex).assertEqual(0);
          expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(0);
          expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
          expect(data.appInfo.flags).assertEqual(1);
          expect(data.appInfo.cloudFileSyncEnabled).assertEqual(false);
          expect(data.appInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
          expect(data.appInfo.releaseType.length).assertLarger(0);
          expect(data.appInfo.installSource).assertEqual("unknown");
          expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.iconResource.moduleName.length).assertLarger(0);
          expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
          expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.labelResource.moduleName.length).assertLarger(0);
          expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
          expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.descriptionResource.moduleName.length).assertLarger(0);
          expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
          expect(data.hapModulesInfo[0].name).assertEqual("testModule");
          expect(data.hapModulesInfo[0].icon).assertEqual("");
          expect(data.hapModulesInfo[0].iconId).assertEqual(0);
          expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
          expect(data.hapModulesInfo[0].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
          expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
          expect(data.hapModulesInfo[0].installationFree).assertEqual(false);
          expect(data.hapModulesInfo[0].hashValue).assertEqual("");
          expect(data.hapModulesInfo[0].type).assertEqual(2);
          expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
          expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
          expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
          expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/testModule.hap");
          expect(data.hapModulesInfo[0].nativeLibraryPath.length).assertEqual(0);
          done();
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_3200 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_3300
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_3300
       * @tc.desc   test getBundleInfoSync two params with combination flags test.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfoSync_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          const flags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
          let data = bundle.getBundleInfoSync(BUNDLE_NAME, flags);
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_3300: " + JSON.stringify(data));
          expect(data.name).assertEqual(BUNDLE_NAME);
          expect(data.vendor).assertEqual(VENDOR);
          expect(data.versionCode).assertEqual(1000000);
          expect(data.versionName).assertEqual("1.0.0");
          expect(data.buildVersion).assertEqual("1.0.0");
          expect(data.minCompatibleVersionCode).assertLarger(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo.appId.length).assertLarger(0);
          expect(data.signatureInfo.fingerprint.length).assertLarger(0);
          expect(data.signatureInfo.appIdentifier).assertEqual("");
          expect(data.signatureInfo.certificate).assertContain("-----BEGIN CERTIFICATE-----");
          expect(data.routerMap.length).assertEqual(0);
          expect(data.installTime).assertLarger(0);
          expect(data.firstInstallTime).assertLarger(0);
          expect(data.updateTime).assertLarger(0);
          expect(data.appIndex).assertEqual(0);
          expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.bundleType).assertEqual(0);
          expect(data.appInfo.debug).assertEqual(false);
          expect(data.appInfo.description).assertEqual("$string:description_application");
          expect(data.appInfo.descriptionId).assertLarger(0);
          expect(data.appInfo.enabled).assertTrue();
          expect(data.appInfo.label).assertEqual("$string:app_name");
          expect(data.appInfo.labelId).assertLarger(0);
          expect(data.appInfo.icon).assertEqual("$media:app_icon");
          expect(data.appInfo.iconId).assertLarger(0);
          expect(data.appInfo.process).assertEqual("ohos.acts.bundle.stage.test");
          expect(data.appInfo.permissions.length).assertEqual(0);
          expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
          expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
          expect(data.appInfo.metadataArray.length).assertEqual(0);
          expect(data.appInfo.removable).assertTrue();
          expect(data.appInfo.accessTokenId).assertLarger(0);
          expect(data.appInfo.uid).assertLarger(0);
          expect(data.appInfo.systemApp).assertFalse();
          expect(data.appInfo.appDistributionType).assertEqual("os_integration");
          expect(data.appInfo.appProvisionType).assertEqual("release");
          expect(data.appInfo.dataUnclearable).assertEqual(false);
          expect(data.appInfo.nativeLibraryPath).assertEqual("");
          expect(data.appInfo.appIndex).assertEqual(0);
          expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(0);
          expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
          expect(data.appInfo.flags).assertEqual(1);
          expect(data.appInfo.cloudFileSyncEnabled).assertEqual(false);
          expect(data.appInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
          expect(data.appInfo.releaseType.length).assertLarger(0);
          expect(data.appInfo.installSource).assertEqual("unknown");
          expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.iconResource.moduleName.length).assertLarger(0);
          expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
          expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.labelResource.moduleName.length).assertLarger(0);
          expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
          expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.descriptionResource.moduleName.length).assertLarger(0);
          expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
          expect(data.hapModulesInfo[0].name).assertEqual("testModule");
          expect(data.hapModulesInfo[0].icon).assertEqual("");
          expect(data.hapModulesInfo[0].iconId).assertEqual(0);
          expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
          expect(data.hapModulesInfo[0].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
          expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
          expect(data.hapModulesInfo[0].installationFree).assertEqual(false);
          expect(data.hapModulesInfo[0].hashValue).assertEqual("");
          expect(data.hapModulesInfo[0].type).assertEqual(2);
          expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
          expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
          expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
          expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/testModule.hap");
          expect(data.hapModulesInfo[0].nativeLibraryPath.length).assertEqual(0);
          done();
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_3300 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_2001
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_2001
       * @tc.desc   test getBundleInfo callback permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfo_2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          bundle.getBundleInfo("com.example.myapplication1" ,bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, (err: BusinessError, data: bundle.BundleInfo) => {
            if (err) {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_201_001 err: " + JSON.stringify(err));
              expect(err.code).assertEqual(201);
              done();
            } else {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_201_001 should not return data");
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfo_201_001 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfo_2002
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfo_2002
       * @tc.desc   test getBundleInfo with userId callback permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfo_2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          bundle.getBundleInfo("com.example.myapplication1", bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, 100, (err: BusinessError, data: bundle.BundleInfo) => {
            if (err) {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_201_002 err: " + JSON.stringify(err));
              expect(err.code).assertEqual(201);
              done();
            } else {
              console.info("SUB_BMS_FRAMEWORK_getBundleInfo_201_002 should not return data");
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfo_201_002 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2003
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2003
       * @tc.desc   test getBundleInfoSync with userId permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfoSync_201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let data = bundle.getBundleInfoSync("com.example.myapplication1", bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, 100);
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_201_001 should not return data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_201_001 exception: " + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleInfoSync_2004
       * @tc.number SUB_BMS_FRAMEWORK_getBundleInfoSync_2004
       * @tc.desc   test getBundleInfoSync permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleInfoSync_2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let data = bundle.getBundleInfoSync("com.example.myapplication1", bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_201_002 should not return data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleInfoSync_201_002 exception: " + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleNameByUid_2005
       * @tc.number SUB_BMS_FRAMEWORK_getBundleNameByUid_2005
       * @tc.desc   test getBundleNameByUid callback permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleNameByUid_2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          bundle.getBundleNameByUid(100, (err: BusinessError, data: string) => {
            if (err) {
              console.info("SUB_BMS_FRAMEWORK_getBundleNameByUid_201_001 err: " + JSON.stringify(err));
              expect(err.code).assertEqual(201);
              done();
            } else {
              console.info("SUB_BMS_FRAMEWORK_getBundleNameByUid_201_001 should not return data");
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleNameByUid_201_001 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleNameByUid_2006
       * @tc.number SUB_BMS_FRAMEWORK_getBundleNameByUid_2006
       * @tc.desc   test getBundleNameByUid promise permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleNameByUid_2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await bundle.getBundleNameByUid(100).then((data: string) => {
            console.info("SUB_BMS_FRAMEWORK_getBundleNameByUid_201_002 should not return data: " + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.info("SUB_BMS_FRAMEWORK_getBundleNameByUid_201_002 err: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          });
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleNameByUid_201_002 exception: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.name   SUB_BMS_FRAMEWORK_getBundleNameByUidSync_2007
       * @tc.number SUB_BMS_FRAMEWORK_getBundleNameByUidSync_2007
       * @tc.desc   test getBundleNameByUidSync permission denied.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_BMS_FRAMEWORK_getBundleNameByUidSync_2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let data = bundle.getBundleNameByUidSync(100);
          console.info("SUB_BMS_FRAMEWORK_getBundleNameByUidSync_201_001 should not return data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (error) {
          console.info("SUB_BMS_FRAMEWORK_getBundleNameByUidSync_201_001 exception: " + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        }
      });

    });
  }