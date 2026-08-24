'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import * as test_bundle from '../ets/skill'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function skillTest(): void {
  describe("ActsSkillTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Skill_Static_0100
     * @tc.name      test_skill_actions_0001
     * @tc.desc      Test Skill actions getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skill_actions_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skill_actions_0001 start');
      let skill = test_bundle.getSkill();
      expect(skill.actions[0]).assertEqual("SkillImpl::getActions");
      console.log('test_skill_actions_0001 done');
      done();
      console.log('test_skill_actions_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Skill_Static_0200
     * @tc.name      test_skill_entities_0001
     * @tc.desc      Test Skill entities getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skill_entities_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skill_entities_0001 start');
      let skill = test_bundle.getSkill();
      expect(skill.entities[0]).assertEqual("SkillImpl::getEntities");
      console.log('test_skill_entities_0001 done');
      done();
      console.log('test_skill_entities_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Skill_Static_0300
     * @tc.name      test_skill_domainVerify_0001
     * @tc.desc      Test Skill domainVerify getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skill_domainVerify_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skill_domainVerify_0001 start');
      let skill = test_bundle.getSkill();
      expect(skill.domainVerify).assertTrue();
      console.log('test_skill_domainVerify_0001 done');
      done();
      console.log('test_skill_domainVerify_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_0400
     * @tc.name      test_skillUri_scheme_0001
     * @tc.desc      Test SkillUri scheme getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_scheme_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_scheme_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.scheme).assertEqual("SkillUriImpl::getScheme");
      console.log('test_skillUri_scheme_0001 done');
      done();
      console.log('test_skillUri_scheme_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_0500
     * @tc.name      test_skillUri_host_0001
     * @tc.desc      Test SkillUri host getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_host_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_host_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.host).assertEqual("SkillUriImpl::getHost");
      console.log('test_skillUri_host_0001 done');
      done();
      console.log('test_skillUri_host_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_0600
     * @tc.name      test_skillUri_port_0001
     * @tc.desc      Test SkillUri port getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_port_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_port_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.port).assertEqual(21474);
      console.log('test_skillUri_port_0001 done');
      done();
      console.log('test_skillUri_port_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_0700
     * @tc.name      test_skillUri_path_0001
     * @tc.desc      Test SkillUri path getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_path_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_path_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.path).assertEqual("SkillUriImpl::getPath");
      console.log('test_skillUri_path_0001 done');
      done();
      console.log('test_skillUri_path_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_0800
     * @tc.name      test_skillUri_pathStartWith_0001
     * @tc.desc      Test SkillUri pathStartWith getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_pathStartWith_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_pathStartWith_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.pathStartWith).assertEqual("SkillUriImpl::getPathStartWith");
      console.log('test_skillUri_pathStartWith_0001 done');
      done();
      console.log('test_skillUri_pathStartWith_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_0900
     * @tc.name      test_skillUri_pathRegex_0001
     * @tc.desc      Test SkillUri pathRegex getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_pathRegex_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_pathRegex_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.pathRegex).assertEqual("SkillUriImpl::getPathRegex");
      console.log('test_skillUri_pathRegex_0001 done');
      done();
      console.log('test_skillUri_pathRegex_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_1000
     * @tc.name      test_skillUri_type_0001
     * @tc.desc      Test SkillUri type getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_type_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_type_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.type).assertEqual("SkillUriImpl::getType");
      console.log('test_skillUri_type_0001 done');
      done();
      console.log('test_skillUri_type_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_1100
     * @tc.name      test_skillUri_utd_0001
     * @tc.desc      Test SkillUri utd getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_utd_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_utd_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.utd).assertEqual("SkillUriImpl::getUtd");
      console.log('test_skillUri_utd_0001 done');
      done();
      console.log('test_skillUri_utd_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_1200
     * @tc.name      test_skillUri_maxFileSupported_0001
     * @tc.desc      Test SkillUri maxFileSupported getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_maxFileSupported_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_maxFileSupported_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.maxFileSupported).assertEqual(21474);
      console.log('test_skillUri_maxFileSupported_0001 done');
      done();
      console.log('test_skillUri_maxFileSupported_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SkillUri_Static_1300
     * @tc.name      test_skillUri_linkFeature_0001
     * @tc.desc      Test SkillUri linkFeature getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_skillUri_linkFeature_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_skillUri_linkFeature_0001 start');
      let skillUri = test_bundle.getSkillUri();
      expect(skillUri.linkFeature).assertEqual("SkillUriImpl::getLinkFeature");
      console.log('test_skillUri_linkFeature_0001 done');
      done();
      console.log('test_skillUri_linkFeature_0001 end');
    });
  })
}