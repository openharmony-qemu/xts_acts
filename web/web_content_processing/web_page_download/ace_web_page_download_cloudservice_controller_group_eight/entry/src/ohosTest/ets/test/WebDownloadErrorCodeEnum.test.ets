/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();

export default function WebDownloadErrorCodeEnumTest() {
  describe('WebDownloadErrorCodeEnumTest', () => {
    beforeAll(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done()
    });

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_ERROR_UNKNOWN
    *@tc.name    : testWebDownloadErrorCodeErrorUnknown
    *@tc.desc    : test WebDownloadErrorCode ERROR_UNKNOWN
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeErrorUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeErrorUnknown start')
        try {
            expect(webview.WebDownloadErrorCode.ERROR_UNKNOWN).assertEqual(0)
        } catch(error) {
            console.error('testWebDownloadErrorCodeErrorUnknown error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeErrorUnknown end')
        done()
    })


   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_FAILED
    *@tc.name    : testWebDownloadErrorCodeFileFailed
    *@tc.desc    : test WebDownloadErrorCode FILE_FAILED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileFailed start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_FAILED).assertEqual(1)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileFailed error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileFailed end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_ACCESS_DENIED
    *@tc.name    : testWebDownloadErrorCodeFileAccessDenied
    *@tc.desc    : test WebDownloadErrorCode FILE_ACCESS_DENIED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileAccessDenied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileAccessDenied start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_ACCESS_DENIED).assertEqual(2)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileAccessDenied error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileAccessDenied end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_NO_SPACE
    *@tc.name    : testWebDownloadErrorCodeFileNoSpace
    *@tc.desc    : test WebDownloadErrorCode FILE_NO_SPACE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileNoSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileNoSpace start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_NO_SPACE).assertEqual(3)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileNoSpace error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileNoSpace end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_NAME_TOO_LONG
    *@tc.name    : testWebDownloadErrorCodeFileNameTooLong
    *@tc.desc    : test WebDownloadErrorCode FILE_NAME_TOO_LONG
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileNameTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileNameTooLong start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_NAME_TOO_LONG).assertEqual(5)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileNameTooLong error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileNameTooLong end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_TOO_LARGE
    *@tc.name    : testWebDownloadErrorCodeFileNameTooLarge
    *@tc.desc    : test WebDownloadErrorCode FILE_TOO_LARGE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileNameTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileNameTooLarge start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_TOO_LARGE).assertEqual(6)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileNameTooLarge error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileNameTooLarge end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_TRANSIENT_ERROR
    *@tc.name    : testWebDownloadErrorCodeFileTransientError
    *@tc.desc    : test WebDownloadErrorCode FILE_TRANSIENT_ERROR
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileTransientError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileTransientError start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_TRANSIENT_ERROR).assertEqual(10)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileTransientError error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileTransientError end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_BLOCKED
    *@tc.name    : testWebDownloadErrorCodeFileBlocked
    *@tc.desc    : test WebDownloadErrorCode FILE_BLOCKED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileBlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileBlocked start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_BLOCKED).assertEqual(11)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileBlocked error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileBlocked end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_TOO_SHORT
    *@tc.name    : testWebDownloadErrorCodeFileTooShort
    *@tc.desc    : test WebDownloadErrorCode FILE_TOO_SHORT
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileTooShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileTooShort start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_TOO_SHORT).assertEqual(13)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileTooShort error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileTooShort end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_HASH_MISMATCH
    *@tc.name    : testWebDownloadErrorCodeFileHashMismatch
    *@tc.desc    : test WebDownloadErrorCode FILE_HASH_MISMATCH
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileHashMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileHashMismatch start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_HASH_MISMATCH).assertEqual(14)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileHashMismatch error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileHashMismatch end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_FILE_SAME_AS_SOURCE
    *@tc.name    : testWebDownloadErrorCodeFileSameAsSource
    *@tc.desc    : test WebDownloadErrorCode FILE_SAME_AS_SOURCE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeFileSameAsSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileSameAsSource start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_SAME_AS_SOURCE).assertEqual(15)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileSameAsSource error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileSameAsSource end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_TIMEOUT
    *@tc.name    : testWebDownloadErrorCodeNetworkTimeout
    *@tc.desc    : test WebDownloadErrorCode NETWORK_TIMEOUT
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeNetworkTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkTimeout start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_TIMEOUT).assertEqual(21)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkTimeout error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkTimeout end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_DISCONNECTED
    *@tc.name    : testWebDownloadErrorCodeNetworkDisconnected
    *@tc.desc    : test WebDownloadErrorCode NETWORK_DISCONNECTED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeNetworkDisconnected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkDisconnected start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_DISCONNECTED).assertEqual(22)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkDisconnected error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkDisconnected end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_SERVER_DOWN
    *@tc.name    : testWebDownloadErrorCodeNetworkServerDown
    *@tc.desc    : test WebDownloadErrorCode NETWORK_SERVER_DOWN
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeNetworkServerDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkServerDown start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_SERVER_DOWN).assertEqual(23)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkServerDown error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkServerDown end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_INVALID_REQUEST
    *@tc.name    : testWebDownloadErrorCodeNetworkInvalidRequest
    *@tc.desc    : test WebDownloadErrorCode NETWORK_INVALID_REQUEST
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeNetworkInvalidRequest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkInvalidRequest start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_INVALID_REQUEST).assertEqual(24)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkInvalidRequest error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkInvalidRequest end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_FAILED
    *@tc.name    : testWebDownloadErrorCodeServerFailed
    *@tc.desc    : test WebDownloadErrorCode SERVER_FAILED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerFailed start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_FAILED).assertEqual(30)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerFailed error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerFailed end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_NO_RANGE
    *@tc.name    : testWebDownloadErrorCodeServerNoRange
    *@tc.desc    : test WebDownloadErrorCode SERVER_NO_RANGE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerNoRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerNoRange start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_NO_RANGE).assertEqual(31)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerNoRange error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerNoRange end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_BAD_CONTENT
    *@tc.name    : testWebDownloadErrorCodeServerBadContent
    *@tc.desc    : test WebDownloadErrorCode SERVER_BAD_CONTENT
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerBadContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerBadContent start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_BAD_CONTENT).assertEqual(33)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerBadContent error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerBadContent end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_UNAUTHORIZED
    *@tc.name    : testWebDownloadErrorCodeServerUnauthorized
    *@tc.desc    : test WebDownloadErrorCode SERVER_UNAUTHORIZED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerUnauthorized', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerUnauthorized start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_UNAUTHORIZED).assertEqual(34)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerUnauthorized error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerUnauthorized end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_CERT_PROBLEM
    *@tc.name    : testWebDownloadErrorCodeServerCertProblem
    *@tc.desc    : test WebDownloadErrorCode SERVER_CERT_PROBLEM
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerCertProblem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerCertProblem start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_CERT_PROBLEM).assertEqual(35)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerCertProblem error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerCertProblem end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_FORBIDDEN
    *@tc.name    : testWebDownloadErrorCodeServerForbidden
    *@tc.desc    : test WebDownloadErrorCode SERVER_FORBIDDEN
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerForbidden', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerForbidden start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_FORBIDDEN).assertEqual(36)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerForbidden error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerForbidden end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_UNREACHABLE
    *@tc.name    : testWebDownloadErrorCodeServerUnreachable
    *@tc.desc    : test WebDownloadErrorCode SERVER_UNREACHABLE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerUnreachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerUnreachable start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_UNREACHABLE).assertEqual(37)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerUnreachable error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerUnreachable end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_CONTENT_LENGTH_MISMATCH
    *@tc.name    : testWebDownloadErrorCodeServerContentLengthMismatch
    *@tc.desc    : test WebDownloadErrorCode SERVER_CONTENT_LENGTH_MISMATCH
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerContentLengthMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerContentLengthMismatch start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH).assertEqual(38)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerContentLengthMismatch error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerContentLengthMismatch end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_SERVER_CROSS_ORIGIN_REDIRECT
    *@tc.name    : testWebDownloadErrorCodeServerCrossOriginRedirect
    *@tc.desc    : test WebDownloadErrorCode SERVER_CROSS_ORIGIN_REDIRECT
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeServerCrossOriginRedirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerCrossOriginRedirect start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT).assertEqual(39)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerCrossOriginRedirect error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerCrossOriginRedirect end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_USER_CANCELED
    *@tc.name    : testWebDownloadErrorCodeUserCanceled
    *@tc.desc    : test WebDownloadErrorCode USER_CANCELED
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeUserCanceled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeUserCanceled start')
        try {
            expect(webview.WebDownloadErrorCode.USER_CANCELED).assertEqual(40)
        } catch(error) {
            console.error('testWebDownloadErrorCodeUserCanceled error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeUserCanceled end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_USER_SHUTDOWN
    *@tc.name    : testWebDownloadErrorCodeUserShutdown
    *@tc.desc    : test WebDownloadErrorCode USER_SHUTDOWN
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeUserShutdown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeUserShutdown start')
        try {
            expect(webview.WebDownloadErrorCode.USER_SHUTDOWN).assertEqual(41)
        } catch(error) {
            console.error('testWebDownloadErrorCodeUserShutdown error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeUserShutdown end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebDownloadErrorCode_CRASH
    *@tc.name    : testWebDownloadErrorCodeCrash
    *@tc.desc    : test WebDownloadErrorCode CRASH
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebDownloadErrorCodeCrash', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeCrash start')
        try {
            expect(webview.WebDownloadErrorCode.CRASH).assertEqual(50)
        } catch(error) {
            console.error('testWebDownloadErrorCodeCrash error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeCrash end')
        done()
    })

  })
}