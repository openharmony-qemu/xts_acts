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
import patternLockJsunit01 from "./PatternLockTest/PatternLock01.test";
import PatternLockActivateCircleStyle1 from "./PatternLockTest/PatternLockActivateCircleStyle1.test";
import patternLockJsunit from "./PatternLockTest/PatternLockJsunit.test";
import PatternLockJsunit02 from "./PatternLockTest/PatternLockJsunit02.test";
import badgeJsunit from './BadgeTest/BadgeJsunit.test';
import badgeTest from './BadgeTest/badge'
import badge3Jsunit from './BadgeTest/Badge3Jsunit.test';
import BadgeNodeTest from './BadgeTest/badgeNode.test';
import datalPanelUIJsunit from './DataPanel/datalPanelUIJsunit.test';
import datapanelTest from './DataPanel/datapanel2.test';
import datapanelJsunit from './DataPanel/DataPanelJsunit.test';
import datapanelJsunit1 from './DataPanel/DataPanelJsunit.test';
import DataPanelContentModifierTest from './DataPanel/DataPanelContentModifier.test';
import gaugeJsunit from './Gauge/GaugeJsunit.test';
import gauge3Jsunit from './Gauge/gauge3Jsunit.test';
import gaugeColorsJsunit3 from './Gauge/gauge2.test';
import gaugeColorsJsunit4 from './Gauge/gauge2.test';
import GaugeContentModifier from './Gauge/GaugeContentModifier.test';
import gaugeJsunit1 from './Gauge/GaugeJsunit1.test';
import GaugePrivacySensitiveTest from './Gauge/GaugePrivacySensitive.test';
import GaugeUxTest from './Gauge/gaugeux.test';

export default function testsuite() {
  console.info("test start");
  patternLockJsunit01()
  PatternLockActivateCircleStyle1()
  patternLockJsunit()
  PatternLockJsunit02()

  badgeTest()
  badge3Jsunit()
  badgeJsunit()
  BadgeNodeTest()

  datalPanelUIJsunit()
  datapanelTest()
  datapanelJsunit()
  DataPanelContentModifierTest()
  datapanelJsunit1()

  gaugeJsunit();
  gauge3Jsunit();
  gaugeColorsJsunit3();
  gaugeColorsJsunit4();
  GaugeContentModifier();
  gaugeJsunit1();
  GaugePrivacySensitiveTest();
  GaugeUxTest()
}
