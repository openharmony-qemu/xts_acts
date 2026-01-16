/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavsession from 'libavsession.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function AVSessionMediaDescriptionTest() {
  describe('AVSessionMediaDescriptionTest', () => {
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderCreate_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderCreate001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_Create interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderCreateSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderCreate001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderCreate_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderCreate002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_Create interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderCreateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderCreate002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderDestroy_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderDestroy001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_Destroy interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderDestroySuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderDestroy_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderDestroy002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_Destroy interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderDestroyInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAssetId_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAssetId001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAssetId interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetAssetId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetAssetIdSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetAssetId001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAssetId_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAssetId002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAssetId interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetAssetId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetAssetIdInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetAssetId002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetTitle_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetTitle001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetTitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetTitle_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetTitle002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetTitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetTitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetSubtitle_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetSubtitle001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetSubtitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetSubtitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetSubTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetSubtitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetSubtitle_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetSubtitle002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetSubtitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetSubtitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetSubTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetSubtitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetArtist_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetArtist001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetArtist interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetArtist001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetArtistSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetArtist001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetArtist_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetArtist002  
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetArtist interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetArtist002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetArtistInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetArtist002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // /**
    //  * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAlbumCoverUri_001
    //  * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAlbumCoverUri001
    //  * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAlbumCoverUri interface.
    //  * @tc.level    Level1
    //  * @tc.size     MediumTest
    //  * @tc.type     Function
    //  */
    // it('testAVSessionAVMediaDescriptionBuilderSetAlbumCoverUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (done: Function) => {
    //     try {
    //       let result: number = libavsession.AVMediaDescriptionBuilderSetAlbumCoverUriSuccess();
    //       expect(result).assertEqual(1);
    //       done()
    //     } catch (err) {
    //       console.error("====>testAVSessionAVMediaDescriptionBuilderSetAlbumCoverUri001 catch err: " + err);
    //       expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
    //     }
    //   });
      
    // /** 
    //  * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAlbumCoverUri_002
    //  * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAlbumCoverUri002
    //  * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAlbumCoverUri interface.
    //  * @tc.level    Level1
    //  * @tc.size     MediumTest
    //  * @tc.type     Function
    //  */
    // it('testAVSessionAVMediaDescriptionBuilderSetAlbumCoverUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (done: Function) => {
    //     try {
    //       let result: number = libavsession.AVMediaDescriptionBuilderSetAlbumCoverUriInvalidParam();
    //       expect(result).assertEqual(1);
    //       done()
    //     } catch (err) {
    //       console.error("====>testAVSessionAVMediaDescriptionBuilderSetAlbumCoverUri002 catch err: " + err);
    //       expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
    //     }
    //   });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetMediaType_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetMediaType001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetMediaType interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetMediaType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetMediaTypeSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetMediaType001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetMediaType_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetMediaType002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetMediaType interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetMediaType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetMediaTypeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetMediaType002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetLyricContent_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetLyricContent001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetLyricContent interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetLyricContent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetLyricContentSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetLyricContent001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetLyricContent_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetLyricContent002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetLyricContent interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetLyricContent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetLyricContentInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetLyricContent002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetDuration_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetDuration001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetDuration interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetDuration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetDurationSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetDuration001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /** 
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetDuration_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetDuration002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetDuration interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetDuration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetDurationInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetDuration002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetMediaUri_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetMediaUri001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetMediaUri interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetMediaUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetMediaUriSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetMediaUri001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetMediaUri_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetMediaUri002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetMediaUri interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetMediaUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetMediaUriInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetMediaUri002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetStartPosition_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetStartPosition001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetStartPosition interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetStartPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetStartPositionSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetStartPosition001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetStartPosition_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetStartPosition002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetStartPosition interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetStartPosition002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetStartPositionInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetStartPosition002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetMediaSize_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetMediaSize001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetMediaSize interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetMediaSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetMediaSizeSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetMediaSize001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetMediaSize_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetMediaSize002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetMediaSize interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetMediaSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetMediaSizeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetMediaSize002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAlbumTitle_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAlbumTitle001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAlbumTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetAlbumTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetAlbumTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetAlbumTitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAlbumTitle_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAlbumTitle002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAlbumTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetAlbumTitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetAlbumTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetAlbumTitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAppName_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAppName001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAppName interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetAppName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetAppNameSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetAppName001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderSetAppName_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderSetAppName002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_SetAppName interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderSetAppName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderSetAppNameInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderSetAppName002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderGenerateAVMediaDescription_001
     * @tc.name     testAVSessionAVMediaDescriptionBuilderGenerateAVMediaDescription001
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderGenerateAVMediaDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderGenerateAVMediaDescriptionSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderGenerateAVMediaDescription001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionBuilderGenerateAVMediaDescription_002
     * @tc.name     testAVSessionAVMediaDescriptionBuilderGenerateAVMediaDescription002
     * @tc.desc     testing OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionBuilderGenerateAVMediaDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionBuilderGenerateAVMediaDescriptionInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionBuilderGenerateAVMediaDescription002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetAssetId_001
     * @tc.name     testAVSessionAVMediaDescriptionGetAssetId001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAssetId interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetAssetId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetAssetIdSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetAssetId001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetAssetId_002
     * @tc.name     testAVSessionAVMediaDescriptionGetAssetId002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAssetId interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetAssetId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetAssetIdInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetAssetId002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetTitle_001
     * @tc.name     testAVSessionAVMediaDescriptionGetTitle001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetTitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetTitle_002
     * @tc.name     testAVSessionAVMediaDescriptionGetTitle002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetTitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetTitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetSubtitle_001
     * @tc.name     testAVSessionAVMediaDescriptionGetSubtitle001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetSubtitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetSubtitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetSubTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetSubtitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetSubtitle_002
     * @tc.name     testAVSessionAVMediaDescriptionGetSubtitle002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetSubtitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetSubtitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetSubTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetSubtitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetArtist_001
     * @tc.name     testAVSessionAVMediaDescriptionGetArtist001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetArtist interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetArtist001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetArtistSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetArtist001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetArtist_002 
     * @tc.name     testAVSessionAVMediaDescriptionGetArtist002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetArtist interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetArtist002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetArtistInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetArtist002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    // /**
    //  * @tc.number   SUB_AVSession_AVMediaDescriptionGetAlbumCoverUri_001
    //  * @tc.name     testAVSessionAVMediaDescriptionGetAlbumCoverUri001
    //  * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAlbumCoverUri interface.
    //  * @tc.level    Level1
    //  * @tc.size     MediumTest
    //  * @tc.type     Function
    //  */
    // it('testAVSessionAVMediaDescriptionGetAlbumCoverUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (done: Function) => {
    //     try {
    //       let result: number = libavsession.AVMediaDescriptionGetAlbumCoverUriSuccess();
    //       expect(result).assertEqual(1);
    //       done()
    //     } catch (err) {
    //       console.error("====>testAVSessionAVMediaDescriptionGetAlbumCoverUri001 catch err: " + err);
    //       expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
    //     }
    //   });

    // /**
    //  * @tc.number   SUB_AVSession_AVMediaDescriptionGetAlbumCoverUri_002
    //  * @tc.name     testAVSessionAVMediaDescriptionGetAlbumCoverUri002
    //  * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAlbumCoverUri interface.
    //  * @tc.level    Level1
    //  * @tc.size     MediumTest
    //  * @tc.type     Function
    //  */
    // it('testAVSessionAVMediaDescriptionGetAlbumCoverUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (done: Function) => {
    //     try {
    //       let result: number = libavsession.AVMediaDescriptionGetAlbumCoverUriInvalidParam();
    //       expect(result).assertEqual(1);
    //       done()
    //     } catch (err) {
    //       console.error("====>testAVSessionAVMediaDescriptionGetAlbumCoverUri002 catch err: " + err);
    //       expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
    //     }
    //   });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetMediaType_001
     * @tc.name     testAVSessionAVMediaDescriptionGetMediaType001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetMediaType interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetMediaType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetMediaTypeSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetMediaType001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetMediaType_002
     * @tc.name     testAVSessionAVMediaDescriptionGetMediaType002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetMediaType interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetMediaType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetMediaTypeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetMediaType002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetLyricContent_001
     * @tc.name     testAVSessionAVMediaDescriptionGetLyricContent001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetLyricContent interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetLyricContent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetLyricContentSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetLyricContent001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetLyricContent_002
     * @tc.name     testAVSessionAVMediaDescriptionGetLyricContent002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetLyricContent interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetLyricContent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetLyricContentInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetLyricContent002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetDuration_001
     * @tc.name     testAVSessionAVMediaDescriptionGetDuration001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetDuration interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetDuration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetDurationSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetDuration001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetDuration_002
     * @tc.name     testAVSessionAVMediaDescriptionGetDuration002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetDuration interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetDuration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetDurationInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetDuration002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetMediaUri_001
     * @tc.name     testAVSessionAVMediaDescriptionGetMediaUri001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetMediaUri interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetMediaUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetMediaUriSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetMediaUri001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetMediaUri_002
     * @tc.name     testAVSessionAVMediaDescriptionGetMediaUri002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetMediaUri interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetMediaUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetMediaUriInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetMediaUri002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetStartPosition_001
     * @tc.name     testAVSessionAVMediaDescriptionGetStartPosition001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetStartPosition interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetStartPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetStartPositionSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetStartPosition001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetStartPosition_002
     * @tc.name     testAVSessionAVMediaDescriptionGetStartPosition002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetStartPosition interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetStartPosition002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetStartPositionInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetStartPosition002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetMediaSize_001
     * @tc.name     testAVSessionAVMediaDescriptionGetMediaSize001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetMediaSize interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetMediaSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetMediaSizeSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetMediaSize001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetMediaSize_002
     * @tc.name     testAVSessionAVMediaDescriptionGetMediaSize002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetMediaSize interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetMediaSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetMediaSizeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetMediaSize002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetAlbumTitle_001
     * @tc.name     testAVSessionAVMediaDescriptionGetAlbumTitle001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAlbumTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetAlbumTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetAlbumTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetAlbumTitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetAlbumTitle_002
     * @tc.name     testAVSessionAVMediaDescriptionGetAlbumTitle002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAlbumTitle interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetAlbumTitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetAlbumTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetAlbumTitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetAppName_001
     * @tc.name     testAVSessionAVMediaDescriptionGetAppName001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAppName interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetAppName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetAppNameSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetAppName001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionGetAppName_002
     * @tc.name     testAVSessionAVMediaDescriptionGetAppName002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_GetAppName interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionGetAppName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionGetAppNameInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionGetAppName002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionDestroy_001
     * @tc.name     testAVSessionAVMediaDescriptionDestroy001
     * @tc.desc     testing OH_AVSession_AVMediaDescription_Destroy interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionDestroySuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMediaDescriptionDestroy_002
     * @tc.name     testAVSessionAVMediaDescriptionDestroy002
     * @tc.desc     testing OH_AVSession_AVMediaDescription_Destroy interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMediaDescriptionDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMediaDescriptionDestroyInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMediaDescriptionDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}