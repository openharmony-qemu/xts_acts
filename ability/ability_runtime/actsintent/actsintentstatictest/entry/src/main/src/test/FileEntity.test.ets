'use static';
/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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
import { describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import insightIntent from '@ohos.app.ability.insightIntent';
import { InsightIntentEntity } from '@ohos.app.ability.InsightIntentDecorator';
import wantConstant from '@ohos.app.ability.wantConstant';

@InsightIntentEntity({
  entityCategory: 'file entity category'
})
class DemoFileEntity implements insightIntent.FileEntity {
  public entityId: 'OHOS_FILE_ENTITY' = 'OHOS_FILE_ENTITY';
  public uris: Array<string> = ['file://com.example.demo/data/test.txt'];
  public flags?: Int = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION.valueOf();
}

export default function fileEntityStaticTest(): void {
  describe('ActsInsightIntentFileEntityStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_InsightIntent_FileEntity_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_InsightIntent_FileEntity_static_0100
     * @tc.desc   FileEntity.entityId fixed OHOS_FILE_ENTITY; uris non-empty Array<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_InsightIntent_FileEntity_static_0100', Level.LEVEL0,
      (): void => {
        let entity: insightIntent.FileEntity = new DemoFileEntity();
        expect(entity.entityId).assertEqual('OHOS_FILE_ENTITY');
        expect(Array.isArray(entity.uris)).assertTrue();
        expect(entity.uris.length > 0).assertTrue();
        expect(typeof entity.uris[0]).assertEqual('string');
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_InsightIntent_FileEntity_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_InsightIntent_FileEntity_static_0200
     * @tc.desc   FileEntity.flags optional: set FLAG_AUTH_READ_URI_PERMISSION vs unset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_InsightIntent_FileEntity_static_0200', Level.LEVEL0,
      (): void => {
        let withFlag: insightIntent.FileEntity = {
          entityId: 'OHOS_FILE_ENTITY',
          uris: ['file://com.example.demo/data/a.txt'],
          flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION.valueOf()
        };
        let noFlag: insightIntent.FileEntity = {
          entityId: 'OHOS_FILE_ENTITY',
          uris: ['file://com.example.demo/data/b.txt']
        };
        expect(withFlag.entityId).assertEqual('OHOS_FILE_ENTITY');
        expect(withFlag.flags).assertEqual(
          wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION.valueOf());
        expect(noFlag.entityId).assertEqual('OHOS_FILE_ENTITY');
        expect(noFlag.flags === undefined).assertTrue();
      });
  });
}
