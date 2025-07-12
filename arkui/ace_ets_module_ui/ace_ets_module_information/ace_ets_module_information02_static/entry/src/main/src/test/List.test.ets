/**
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
import loadingProgressJsunit from './ProgressTest/loadingProgressJsunit.test'
import loadingProgressJsunit2 from './ProgressTest/LoadingProgressJsunit2.test'
import progressStyleJsunit from './ProgressTest/Progress.test'
import progressTest from './ProgressTest/progress1.test'
import pgj1 from './ProgressTest/progress2.test'
import progressScaleCountJsunit from './ProgressTest/progress3.test'
import pg1 from './ProgressTest/Progress4Jsunit.test'
import pgj2 from './ProgressTest/progress5.test'
import ProgressCapsuleRadius from './ProgressTest/ProgressCapsuleRadius.test'
import ProgressContentModifierTest from './ProgressTest/ProgressContentModifier.test'
import pg2 from './ProgressTest/ProgressJsunit.test'
import ProgressMask from './ProgressTest/ProgressMask.test'
import ProgressJsunit from './ProgressTest/ProgressJsunit.test'
import ProgressPrivacySensitiveTest from './ProgressTest/ProgressPrivacySensitive.test'
import progressSecTest from './ProgressTest/progressSec.test'
import loadingProgressJsunit from './LoadingProgress/LoadingProgress.test';
import loadingProgressCircularJsunit from './LoadingProgress/loadingProgress02.test';
import LoadingProgressContentModifier from './LoadingProgress/LoadingProgressContentModifier.test';
import qrCodeJsunit from './QrcodeTest/QrCode3Jsunit.test'
import qrcodeJsunit from './QrCodeJsunit.test'
import QRCodeUIJsunit from './QrcodeTest/QRCodeUIJsunit.test'
import qrCodeJsunit from './QrcodeTest/QrcodeJsunit.test'
import QrcodeNodeTest from './QrcodeNode.test'
import TextClockApiTest from './TextColckTest/TextClockApiTest/TextClockApiTest.test'
import TextClockDateTimeOptionsTest from './TextColckTest/TextClockDateTimeOptions.test'
import TextClockJsunit from './TextColckTest/TextClockJsunit.test'
import TextClockLongJsunit from './TextColckTest/TextClockLongJsunit.test'
import TextClockNodeTest from './TextColckTest/textclockNode.test'
import TextClockJsunit01 from './TextClockJsunit.test'
import TextTimerTextShadowTest from './TextTimerTest/TextTimerTextShadow.test'
import TextTimerApiTest from './TextTimerTest/TextTimerApiTest/TextTimerApiTest.test'
import TextTimerNodeTest from './TextTimerTest/texttimerNode.test'
import TextTimerJsunit from './TextTimerTest/TextTimerJsunit.test'
import textTimerTest from './TextTimerTest/TextTimer.test'

export default function testsuite() {
  console.info("test start");
  loadingProgressJsunit();
  loadingProgressJsunit2();
  progressStyleJsunit();
  progressTest();
  pgj1();
  progressScaleCountJsunit();
  pg1();
  pgj2();
  ProgressCapsuleRadius();
  ProgressContentModifierTest();
  pg2();
  ProgressMask();
  ProgressJsunit();
  ProgressPrivacySensitiveTest();
  progressSecTest();

  loadingProgressJsunit();
  loadingProgressCircularJsunit();
  LoadingProgressContentModifier();

  qrCodeJsunit();
  qrcodeJsunit();
  QRCodeUIJsunit();
  qrCodeJsunit();
  QrcodeNodeTest();

  TextClockApiTest();
  TextClockDateTimeOptionsTest();
  TextClockJsunit();
  TextClockLongJsunit();
  TextClockNodeTest();
  TextClockJsunit01();

  TextTimerApiTest();
  TextTimerJsunit();
  TextTimerNodeTest();
  TextTimerTextShadowTest();
  textTimerTest();
}
